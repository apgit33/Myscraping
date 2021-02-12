<?php

namespace App\Controller\User;

use App\Controller\Controller;
use App\Controller\Extraction\ExtractionController;
use App\Models\Database\Database;
use App\Mail\Mail;
use App\Models\User\User;
use PDO;

use \Respect\Validation\Validator as v;
use \App\Models\Util\Crypt;

class UserController extends Controller
{

    public function addUser(User $user)
    {
        $query = "INSERT INTO `ws_users`(`u_email`, `u_first_name`, `u_last_name`, `u_phone`, `u_password`, `u_validation`) VALUES (:mail,:fname,:lname,:phone,:psw,:valid)";

        $array = [
            'mail' => [
                PDO::PARAM_STR => $user->getEmail()
            ],
            'fname' => [
                PDO::PARAM_STR => $user->getFirstName()
            ],
            'lname' => [
                PDO::PARAM_STR => $user->getLastName()
            ],
            'phone' => [
                PDO::PARAM_STR => $user->getPhone()
            ],
            'psw' => [
                PDO::PARAM_STR => $user->getPassword()
            ],
            'valid' => [
                PDO::PARAM_STR => $user->getValidation()
            ],
        ];

        Database::executeSql($query, $array);
        // $this->render('form_login', ['messsage' => 'Vous avez reçu un mail blablabla']);
    }

    public function logout()
    {
        session_destroy();
        header('Location: ' . SERVER_URI);
        exit();
    }

    public function checkForm()
    {
        $erreurs = [];
        $user = new User();

        foreach ($_POST as $key => $value) {
            $_POST[$key] = trim($value);
        }

        if (!v::alpha('-')->length(2, 45)->validate($_POST['u_first_name'])) $erreurs['check_firstname'] = 'check firstname';

        if (!v::alpha('-')->length(2, 45)->validate($_POST['u_last_name'])) $erreurs['check_lastname'] = 'check_lastname';

        if (!$this->existEmail($_POST['u_email'])) {
            if (v::email()->validate($_POST['u_email'])) {
                $user->set_u_email($_POST['u_email']);
            } else {
                $erreurs['check_email'] = 'Email non valide';
            }
        } else {
            $erreurs['check_email'] = 'Email deja existant';
        }
        if (!v::phone()->validate($_POST['u_phone'])) $erreurs['check_phone'] = 'Entrez un numéro valide';

        if (v::alpha('-')->length(2, 45)->validate($_POST['u_password'])) {

            if ($_POST['password_confirm'] !== $_POST['u_password']) {
                $erreurs['check_password_confirm'] = 'mdp confirmation';
            }
        } else {
            $erreurs['check_password'] = 'mdp';
        }

        if (empty($erreurs)) {
            $user->hydrate($_POST);
            $user->set_u_password(password_hash($user->getPassword(), PASSWORD_DEFAULT));

            // $mail_crypt = Crypt::encryptSimple($user->getEmail());
            // $id_crypt = Crypt::encryptSimple($user->getId());
            $id = uniqid('', true);
            // $user->set_u_validation(hash('sha1', "$mail_crypt#$id_crypt"));
            $user->set_u_validation(hash('sha1', $id));
            $this->addUser($user);

            // $user->set_u_validation($mail_crypt."°".$id_crypt);
            $user->set_u_validation($id);
            $this->sendMail($user);
        }

        echo json_encode(array('validation' => empty($erreurs), 'erreurs' => $erreurs));
    }

    public function existEmail($email)
    {
        $query = "SELECT u_email FROM ws_users WHERE u_email = :email";
        $data = [
            'email' => [
                PDO::PARAM_STR => $email
            ]
        ];
        $response = Database::executeSql($query, $data);
        return $response->fetch(\PDO::FETCH_ASSOC);
    }

    public function sendMail(User $user)
    {
        //envoi mail de confirmation
        $sujet = "Myscraping - validez votre compte";
        $message = "Confirme ton compte: <a href = '" . SERVER_URI . "/confirm-" . $user->getValidation() . "'>Confirmation</a>.<br>";

        // mail($user->getEmail(),$sujet,$message);
        // Mail::mailTo($user,$sujet,$message);
    }

    public function checkFormLogin()
    {
        $user = new User();

        foreach ($_POST as $key => $pos) {
            $_POST[$key] = trim($pos);
        }

        if (v::email()->validate($_POST['u_email'])) {
            $user->hydrate($_POST);
        }
        $this->userExist($user);
    }


    public function userExist(User $user)
    {
        $query = "SELECT u_id,u_first_name,u_last_name,u_phone,u_email,u_password,u_validation,u_id,u_validate FROM ws_users WHERE u_email=:email";
        $datas = [
            'email' => [
                PDO::PARAM_STR => $user->getEmail()
            ]
        ];
        $data = Database::executeSql($query, $datas);

        $data = $data->fetch(\PDO::FETCH_ASSOC);
        $erreurs = [];
        $validation = false;
        if (password_verify($user->getPassword(), $data['u_password'])) {
            $user->hydrate($data);
            if ($user->isValidate()) {
                $_SESSION['user'] = serialize($user);
                $validation = true;
            } else {
                $erreurs['check_login'] = "pas validé renvoi mail ?";
            }
        } else {
            $erreurs['check_login'] = "Mauvais identifiant";
        }

        echo json_encode(array('validation' => $validation, 'erreurs' => $erreurs));
    }

    public function checkFormAccount()
    {
        $erreurs = [];

        $user = unserialize($_SESSION['user']);

        foreach ($_POST as $key => $value) {
            $_POST[$key] = trim($value);
        }

        if (!v::alpha('-')->length(2, 45)->validate($_POST['u_first_name'])) $erreurs['check_firstname'] = 'check firstname';

        if (!v::alpha('-')->length(2, 45)->validate($_POST['u_last_name'])) $erreurs['check_lastname'] = 'check_lastname';

        if (!v::phone()->validate($_POST['u_phone'])) $erreurs['check_phone'] = 'Entrez un numéro valide';

        if (!empty($_POST['u_password'])) {

            if (!password_verify($_POST['u_password'], $user->getPassword())) $erreurs['check_password'] = 'check_password';

            if ($_POST['password_new'] !== $_POST['password_confirm']) $erreurs['check_password_confirm'] = 'check_password';
        }

        if (empty($erreurs)) {

            $user->hydrate([
                'u_first_name' => $_POST['u_first_name'],
                'u_last_name' => $_POST['u_last_name'],
                'u_phone' => $_POST['u_phone']
            ]);

            if (!empty($_POST['password_new'])) $user->set_u_password(password_hash($_POST['password_new'], PASSWORD_DEFAULT));

            $this->update($user);

            $_SESSION['user'] = serialize($user);
        }
        echo json_encode(array('validation' => empty($erreurs), 'erreurs' => $erreurs));
    }

    public function update(User $user)
    {
        $query = "UPDATE ws_users SET u_first_name=:fname,u_last_name=:lname,u_phone=:phone, u_password=:pwd WHERE u_id=:id";
        $data = [
            'id' => [
                PDO::PARAM_INT => $user->getId()
            ],
            'fname' => [
                PDO::PARAM_STR => $user->getFirstName()
            ],
            'lname' => [
                PDO::PARAM_STR => $user->getLastName()
            ],
            'phone' => [
                PDO::PARAM_STR => $user->getPhone()
            ],
            'pwd' => [
                PDO::PARAM_STR => $user->getPassword()
            ]
        ];
        Database::executeSql($query, $data);
    }

    public function show()
    {

        $this->render('form_user', [
            'user' => array_values((array)unserialize($_SESSION['user'])),
            'SERVER_URI' => SERVER_URI
        ]);
    }

    public function validate($slug)
    {
        echo $slug;

        $query = "UPDATE ws_users SET u_validate=true, u_validation=NULL WHERE u_validation=:v";
        $data = [
            'v' => [
                PDO::PARAM_STR => hash('sha1', $slug)
            ]
        ];
        Database::executeSql($query, $data);

        header('Location: ' . SERVER_URI);
        exit;
    }

    public function signin()
    {
        $this->render('form_signin', [
            'SERVER_URI' => SERVER_URI
        ]);
    }

    public function signup()
    {
        $this->render('form_signup', [
            'SERVER_URI' => SERVER_URI
        ]);
    }

    public function index()
    {
        if (!isset($_SESSION['user'])) {
            header('Location: signin');
            exit();
        }

        $this->render('index', [
            'scraps' => ExtractionController::getAll(),
            'SERVER_URI' => SERVER_URI,
            'user' => $_SESSION['user']
        ]);
    }
}
