<?php

namespace App\Controller\Extraction;

use App\Controller\Controller;
use App\Models\Database\Database;
use PDO;

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
}
