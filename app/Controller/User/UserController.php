<?php

namespace App\Controller\User;

use App\Controller\Controller;
use App\Models\Database\Database;
use App\Mail\Mail;
use App\Models\User\User;
use PDO;

use \Respect\Validation\Validator as v;
use \App\Models\Util\Crypt;

class UserController extends Controller
{

    public function signup()
    {
        $this->render('form_signup.html.twig', [
            'SERVER_URI' => SERVER_URI,
        ]);
    }

    public function login()
    {

        if (isset($_POST['login']) && isset($_POST['mdp'])) {
            //tu traites les chaines, les securises logiquement etc... (pas pour l'exemple)
            $login = $_POST['login'];
            $mdp = $_POST['mdp'];
            // notre model ne sert qu'à vérifier en base si l'user existe.
            $connexion = new ConnexionModel();
            if ($connexion->userExist($login, $mdp)) {
                $_SESSION['is_logged'] = true;
                header('Location: /index.php');
                exit();
            } else {
                //sinon on le renvoit sur l'espace membre
                include 'app/views/authentification.php';
            }
        }
        //si user deja connecté 
        $path = (true) ? 'form_login.html.twig' : 'form_signup.html.twig';
        $this->render($path, [
            'SERVER_URI' => SERVER_URI,
            'user' => $this,
        ]);
    }

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


    public function test()
    {
        // $this->render('base.html.twig',[
        //     'SERVER_URI' => SERVER_URI,
        // ]);
        $id = 6;
        $title = 'Maxime occaecati consectetur.';
        $query = "SELECT * FROM `ws_categories` where `c_id` = :id AND `c_title`= :title";


        $testeee =
            [
                'id' => [
                    PDO::PARAM_INT => $id
                ],
                'title' => [
                    PDO::PARAM_STR => $title
                ],
            ];

        $response = Database::executeSql($query, $testeee);
        $rep = $response->fetchALL(\PDO::FETCH_ASSOC);

        foreach ($rep as $t) {
            // print_r($t);
            echo $t['c_title'] . "<br>";
        }
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

        if (v::alpha('-')->length(2, 45)->validate($_POST['firstName'])) {
            $user->set_u_first_name($_POST['firstName']);
        } else {
            $erreurs['check_firstname'] = 'check firstname';
        }
        if (v::alpha('-')->length(2, 45)->validate($_POST['lastName'])) {
            $user->set_u_last_name($_POST['lastName']);
        } else {
            $erreurs['check_lastname'] = 'check firstname';
        }
        if (!$this->existEmail($_POST['email'])) {
            if(v::email()->validate($_POST['email'])) {
                $user->set_u_email($_POST['email']);
            } else {
                $erreurs['check_email'] = 'Email non valide';
            }
        } else {
            $erreurs['check_email'] = 'Email deja existant';
        }
        if (v::phone()->validate($_POST['phone'])) {
            $user->set_u_phone($_POST['phone']);
        } else {
            $erreurs['check_phone'] = 'Entrez un numéro valide';
        }
        if (v::alpha('-')->length(2, 45)->validate($_POST['password'])) {
            $user->set_u_password($_POST['password']);
            if ($_POST['password_confirm'] !== $_POST['password']) {
                $erreurs['check_password_confirm'] = 'mdp confirmation';
            }
        } else {
            $erreurs['check_password'] = 'mdp';
        }

        if (empty($erreurs)) {
            $validation = true;
            $user->set_u_password(password_hash($user->getPassword(), PASSWORD_DEFAULT));
            
            $mail_crypt = Crypt::encryptSimple($user->getEmail());
            $id_crypt = Crypt::encryptSimple($user->getId());

            $user->set_u_validation(hash('sha1',"$mail_crypt&$id_crypt"));

            // var_dump($user);
            $this->addUser($user);
            $this->sendMail($user);
        } else {
            $validation = false;
        }
        echo json_encode(array('validation' => $validation, 'erreurs' => $erreurs));
    }

    public function existEmail($email){
        $query = "SELECT u_email FROM ws_users WHERE u_email = :email";
        $data = [
            'email' => [
                PDO::PARAM_STR => $email
            ]
        ];
        $response = Database::executeSql($query, $data);
        return $response->fetch(\PDO::FETCH_ASSOC);

    }

    public function sendMail(User $user){

        //envoi mail de confirmation
        $sujet = "Myscraping - validez votre compte";
        $message = "Confirme ton compte: <a href = '".SERVER_URI."/confirm-".$user->getValidation()."'>Confirmation</a>.<br>";

        // Mail::mailTo($user,$sujet,$message);
    }

    public function checkFormLogin()
    {
        $user = new User();

        foreach ($_POST as $key => $pos) {
            $_POST[$key] = trim($pos);
        }

        if(v::email()->validate($_POST['u_email'])) {
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
        $data = Database::executeSql($query,$datas);
        
        $data = $data->fetch(\PDO::FETCH_ASSOC);
        
        $erreurs['check_login'] = "Mauvais identifiant";
        $validation = false;
        if(password_verify($user->getPassword(),$data['u_password'])){

            if($user->isValidate()) {
                session_start();
                $user->hydrate($data);
                $_SESSION['user'] = serialize($user);
                $validation = true;
                $_SESSION['valid'] = true;
            } else {
                $erreurs['check_login'] = "pas validé renvoi mail ?";
            }
            
        }

        echo json_encode(array('validation' => $validation, 'erreurs' => $erreurs));
    }

    public function checkFormAccount() {
        session_start();
        $user = unserialize($_SESSION['user']);

        foreach ($_POST as $key => $value) {
            $_POST[$key] = trim($value);
        }
        $validation = false;
        $erreurs['check_firstname'] = 'check firstname';

        var_dump($_POST);
        if (v::alpha('-')->length(2, 45)->validate($_POST['firstName'])) {
            $user->set_u_first_name($_POST['firstName']);
        } else {
            $erreurs['check_firstname'] = 'check firstname';
        }
        if (v::alpha('-')->length(2, 45)->validate($_POST['lastName'])) {
            $user->set_u_last_name($_POST['lastName']);
        } else {
            $erreurs['check_lastname'] = 'check firstname';
        }
        echo json_encode(array('validation' => $validation, 'erreurs' => $erreurs));


    }
}
