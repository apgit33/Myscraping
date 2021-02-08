<?php

namespace App\Controller\Extraction;

use App\Models\Database\Database;

class ExtractionController extends Database{
    
    /**
     * Get all extraction
     *
     * @return collection
     */
    public function getAll()
    {
        $query = "SELECT * FROM ws_scraps WHERE s_user_id=2";
        $response = Database::executeSql($query);

        return $response->fetchAll(\PDO::FETCH_ASSOC);
    }
    
}