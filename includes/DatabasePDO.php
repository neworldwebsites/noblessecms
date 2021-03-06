<?php

class DatabasePDO
{
    public static $dbConnect = '';

    public static $error = '';

    public static $insertID = 0;

    public static $protocol = 'mysql';

    private static $runQuery = 'no';

    public static function connect()
    {
        global $db;

        self::$protocol = $db['protocol'];

        $conn = new PDO($db['protocol'] . ':host=' . $db['dbhost'] . ';dbname=' . $db['dbname'], $db['dbuser'], $db['dbpass']);

        self::$dbConnect = $conn;

        return $conn;

    }

    public static function query($queryStr = '')
    {

        self::$runQuery = 'no';

        $row = self::$dbConnect->query($queryStr);

        return $row;

    }

    public static function exec($queryStr = '')
    {

        self::$runQuery = 'no';

        self::$dbConnect->exec($queryStr);

    }

    public static function fetch_assoc($queryDB)
    {
        if (self::$runQuery == 'no') {
            $queryDB->execute();
            $queryDB->setFetchMode(PDO::FETCH_ASSOC);
        }

        self::$runQuery = 'yes';

        $row = $queryDB->fetch();

        return $row;
    }

    public static function fetch_obj($queryDB)
    {
        if (self::$runQuery == 'no') {
            $queryDB->execute();
            $queryDB->setFetchMode(PDO::FETCH_OBJ);
        }

        self::$runQuery = 'yes';

        $row = $queryDB->fetch();

        return $row;
    }

    public static function insert_id($objectStr = '')
    {
        $id = self::$dbConnect->lastInsertId();

        if (is_object($objectStr)) {
            $objectStr($id);
        }

        return $id;
    }

    public static function num_rows($queryDB = '', $objectStr = '')
    {
        $numRows = $queryDB->rowCount();

        if (is_object($objectStr)) {
            $objectStr($numRows);
        }

        return $numRows;

    }

}


?>