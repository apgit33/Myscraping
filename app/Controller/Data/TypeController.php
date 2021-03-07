<?php

namespace App\Controller\Data;

use App\Models\Database\Database;

class TypeController
{
    public static function getAll()
    {
        $query = "SELECT dt_id, dt_name FROM ws_datas_type";
        $response = Database::executeSql($query);

        return $response->fetchAll(\PDO::FETCH_ASSOC);
    }
    
}
