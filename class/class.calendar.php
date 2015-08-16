<?php
class calendar extends db {

    function calendar() {
        parent::initTables();
    }

    function read($id = 0, $order = 'cal_id DESC') {
        if (!is_numeric($id)) {
            return FALSE;
        }

        if ($id) $id = "WHERE cal_id = '" . $id . "'";
        else $id = "";

        $query = "SELECT * FROM " . $this->TABLE['cal'] . " "
                . "$id ORDER BY $order";

        return parent::db_fetch_array($query);
    }

    function readDistinct($field_name) {
        if (!is_string($field_name)) {
            return FALSE;
        }

        $query = "SELECT DISTINCT $field_name FROM " . $this->TABLE['cal'] . " "
                . "ORDER BY $field_name ASC";

        return parent::db_fetch_array($query);
    }

    function add($date, $name, $text, $place) {
        if (!is_string($name)) {
            return FALSE;
        }

        $query = "INSERT INTO " . $this->TABLE['cal'] . "(cal_date, cal_name, cal_text, cal_place) "
                . "VALUES('" . $date . "', '" . $name . "', '" . $text . "', '" . $place . "')";
        parent::db_sql_object()->query($query);
        return TRUE;
    }

    function update($id, $date, $name, $text, $place) {
        if (!is_numeric($id) || !is_string($name)) {
            return FALSE;
        }

        $query = "UPDATE " . $this->TABLE['cal'] . " "
                . "SET cal_date = '" . $date . "',"
                . "    cal_name = '" . $name . "',"
                . "    cal_text = '" . $text . "',"
                . "    cal_place = '" . $place . "' "
                . "WHERE cal_id = '" . $id . "'";
        parent::db_sql_object()->query($query);

        return TRUE;
    }

    function delete($id) {
        if (!is_numeric($id)) {
            return FALSE;
        }

        $query = "DELETE FROM " . $this->TABLE['cal'] . " "
                . "WHERE firm_id = '" . $id . "'";
        parent::db_sql_object()->query($query);
        return TRUE;
    }
}
?>