<?php

namespace App\Controller\User;

use App\Controller\Controller;
use App\Models\Database\Database;
use App\Models\User\User;
use PDO;

use \Respect\Validation\Validator as v;

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
        $query = "INSERT INTO `ws_users`(`u_email`, `u_first_name`, `u_last_name`, `u_phone`, `u_password`) VALUES (:mail,:fname,:lname,:phone,:psw)";

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
        foreach ($_POST as $key => $pos) {
            $_POST[$key] = trim($pos);
        }

        if (v::alpha('-')->length(2, 45)->validate($_POST['firstName'])) {
            $user->setFirstName($_POST['firstName']);
        } else {
            $erreurs['check_firstname'] = 'check firstname';
        }
        if (v::alpha('-')->length(2, 45)->validate($_POST['lastName'])) {
            $user->setLastName($_POST['lastName']);
        } else {
            $erreurs['check_lastname'] = 'check firstname';
        }
        // if (!$this->existEmail($_POST['email'])) {
            if(v::email()->validate($_POST['email'])) {
                $user->setEmail($_POST['email']);
            } else {
                $erreurs['check_email'] = 'Email non valide';
            }
        // } else {
        //     $erreurs['check_email'] = 'Email deja existant';
        // }
        if (v::phone()->validate($_POST['phone'])) {
            $user->setPhone($_POST['phone']);
        } else {
            $erreurs['check_phone'] = 'Entrez un numéro valide';
        }
        if (v::alpha('-')->length(2, 45)->validate($_POST['password'])) {
            $user->setPassword($_POST['password']);
            if ($_POST['password_confirm'] !== $_POST['password']) {
                $erreurs['check_password_confirm'] = 'mdp confirmation';
            }
        } else {
            $erreurs['check_password'] = 'mdp';
        }
        if (empty($erreurs)) {
            $validation = true;
            $user->setPassword(password_hash($user->getPassword(), PASSWORD_DEFAULT));
            $this->addUser($user);
        } else {
            $validation = false;
        }
        echo json_encode(array('validation' => $validation, 'erreurs' => $erreurs));
    }

    public function existEmail($email){
        return true;
    }
}
