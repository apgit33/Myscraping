<?php

namespace App\Controller\Extraction;

use App\Controller\Controller;
use App\Controller\Data\TypeController;
use App\Models\Database\Database;
use App\Models\Extraction\Extraction;
use PDO;

use \Respect\Validation\Validator as v;

class ExtractionController extends Controller
{

    /**
     * Get all extraction
     *
     * @return collection
     */
    public static function getAll()
    {
        $query = "SELECT * FROM ws_scraps WHERE s_user_id=:id";
        $data = [
            'id' => [
                PDO::PARAM_INT => unserialize($_SESSION['user'])->getId()
            ]
        ];

        $response = Database::executeSql($query, $data);

        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function show($id)
    {
        $query = "SELECT * FROM ws_scraps WHERE s_user_id=:user AND s_id=:id";
        $data = [
            'user' => [
                PDO::PARAM_INT => unserialize($_SESSION['user'])->getId()
            ],
            'id' => [
                PDO::PARAM_INT => $id
            ],
        ];

        $response = Database::executeSql($query, $data);

        return $response->fetchAll(PDO::FETCH_ASSOC);
    }

    public function register()
    {
        $this->render('form_extract', [
            'SERVER_URI' => SERVER_URI,
            'user' => $_SESSION['user'],
            'categories' => CategoryController::getAll(),
            'types' => TypeController::getAll()
        ]);
    }

    public function checkForm()
    {
        $erreurs =[];
        $scrap = new Extraction();
        if (!v::alpha('-')->length(2, 45)->validate($_POST['s_site'])) $erreurs['check_site'] = 'check site';
        
        // var_dump(empty($erreurs));
        if(empty($erreurs)) {
            $this->add($scrap);
        }
        echo json_encode(array('validation' => empty($erreurs), 'erreurs' => $erreurs));

    }

    public function add(Extraction $scrap) {
        $query = "INSERT INTO ws_scraps (s_title, s_site, s_periodicity, s_date, s_dataset, s_user_id, s_category_id) VALUES (:t,:s,:p,:d,:ds,:u,:c)";
        $datas = [
            't' => [
                PDO::PARAM_STR => $scrap->getTitle()
            ],
            's' => [
                PDO::PARAM_STR => $scrap->getSite()
            ],
            'p' => [
                PDO::PARAM_STR => $scrap->getPeriodicity()
            ],
            'd' => [
                PDO::PARAM_STR => $scrap->getDate()
            ],
            'ds' => [
                PDO::PARAM_STR => $scrap->getDataset()
            ],
            'u' => [
                PDO::PARAM_STR => (unserialize($_SESSION['user']))->getId()
            ],
            'c' => [
                PDO::PARAM_STR => 
            ],
        ];
        Database::executeSql($query,$datas);
    }


}
