<?php
class db {

    public $TABLE;
    static $mysqli;

    function db() {
        $this->TABLE = array();
        
        // database
        $DB['host'] = 'localhost';
        $DB['user'] = 'root';
        $DB['pass'] = 'urframes';
        $DB['name'] = 'dashboard';

        // enable database connection
        self::$mysqli = new mysqli($DB['host'], $DB['user'], $DB['pass'], $DB['name']);

        // check connection
        if ($this->db_sql_object()->connect_errno) {
            echo "Failed to connect to MySQL: " . $this->db_sql_object()->connect_error;
            exit();
        }
        
        // connection was successful
        // activate explicit a UTF-8 Connection
        $this->db_sql_object()->query('SET NAMES \'utf8\'');
    }

    // initialize db tables
    function initTables() {
        $this->TABLE['firm']    = 'tb_firm';
        $this->TABLE['contrib'] = 'tb_contributor';
        $this->TABLE['project'] = 'tb_project';
        $this->TABLE['task']    = 'tb_task';
        $this->TABLE['sticker'] = 'tb_sticker';
        $this->TABLE['cal']     = 'tb_calendar';
        $this->TABLE['contact'] = 'tb_contact';

    }
    
    function db_sql_object() {
        return self::$mysqli;
    }

    function db_error() {
        return mysql_error();
    }

    function db_fetch_array($query) {
        if (strlen($query) == 0) {
            return FALSE;
        }

        $db_query = $this->db_sql_object()->query($query);
        $result = array();
        
        if (!is_object($db_query)) {
        	return FALSE;
        }
        
        while ($row = $db_query->fetch_array(MYSQLI_ASSOC)) {
            $result[] = $row;
        }
        return $result;
    }
    
    function db_num_rows($query) {        
        if (strlen($query) == 0) {
            return FALSE;
        }

        $db_query = $this->db_sql_object()->query($query);
        
        if (!is_object($db_query)) {
            return FALSE;
        }
        return $db_query->num_rows;
    }
    
    function close() {
        $this->db_sql_object()->close();
    }
}
?>