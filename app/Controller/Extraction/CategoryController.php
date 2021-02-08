<?php

namespace App\Controller\Extraction;

use App\Models\Database\Database;

class CategoryController
{

    /**
     * Get all categories
     *
     * @return collection
     */
    public function getAll()
    {
        $query = "SELECT c_id, c_name FROM ws_categories";
        $response = Database::executeSql($query);

        return $response->fetchAll(\PDO::FETCH_ASSOC);
    }

    /**
     * Get category's name from id
     *
     * @param integer $id
     * @return string
     */
    public function getName($id)
    {
        $query = "SELECT c_name FROM ws_categories WHERE c_id = :id";
        $response = Database::executeSql($query, ['id' => [\PDO::PARAM_INT => $id]]);
        $result = $response->fetch(\PDO::FETCH_ASSOC);

        return $result['c_name'];
    }
}
