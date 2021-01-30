<?php

namespace App\Models\Database;

use PDO;
use PDOException;

/**
 * Managing access to the Database
 */
class Database
{

    const NAME = 'web_scraping'; // Name of the database
    const HOST = 'localhost'; // ip of the database
    const USER = 'root'; // user access
    const PWD = ''; // user's password

    /**
     * Connect to the database
     *
     * @return object PDO instance
     * ou
     * @return string error message
     */
    private static function connect()
    {
        try {
            $db = new PDO("mysql:hote=" . SELF::HOST . ";dbname=" . SELF::NAME, SELF::USER, SELF::PWD, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
        } catch (PDOException $e) {
            $msg = 'ERREUR PDO dans ' . $e->getFile() . ' Ligne.' . $e->getLine() . ' : <br>' . $e->getMessage();
            die($msg);
        }
        return $db;
    }

    /**
     * Execute prepared statement
     *
     * @param string $query - query to execute
     * @param array $array - value and type to bind
     * 
     * @return object PDO statement
     */
    public static function executeSql(string $query, $array = [])
    {
        $co = SELF::connect();
        $sth = $co->prepare($query);
        foreach ($array as $key => $vals) {
            foreach ($vals as $type => &$val) {
                $sth->bindParam(":$key", $val, $type);
            }
        }
        $sth->execute();

        return $sth;
    }
}
