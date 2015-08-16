<?php
class contributor extends db {

    function contributor() {
        parent::initTables();
    }

    function read($id = 0, $order = 'cont_name ASC, firm_name ASC') {
        if (!is_numeric($id)) {
            return FALSE;
        }

        if ($id) $id = "AND cont_id = '" . $id . "'";
        else $id = "";

        $query = "SELECT cont.*, firm.firm_id, firm.firm_name "
            . "FROM " . $this->TABLE['contrib'] . " cont, " . $this->TABLE['firm'] . " firm "
            . "WHERE cont.cont_firm_id = firm.firm_id $id ORDER BY $order";

        return parent::db_fetch_array($query);
    }

    function readDistinct($field_name) {
        if (!is_string($field_name)) {
            return FALSE;
        }

        $query = "SELECT DISTINCT $field_name FROM " . $this->TABLE['contrib'] . " "
                . "ORDER BY $field_name ASC";

        return parent::db_fetch_array($query);
    }

    function add($firm_id, $name, $email, $role) {
        if (!is_numeric($firm_id) || !is_string($name)) {
            return FALSE;
        }

        $query = "INSERT INTO " . $this->TABLE['contrib'] . "(cont_firm_id, cont_name, cont_email, cont_role) "
                . "VALUES('" . $firm_id . "', '" . $name . "', '" . $email . "', '" . $role . "')";
        parent::db_sql_object()->query($query);
        return TRUE;
    }

    function update($id, $firm_id, $name, $email, $role) {
        if (!is_numeric($id) || !is_numeric($firm_id) || !is_string($name)) {
            return FALSE;
        }

        $query = "UPDATE " . $this->TABLE['contrib'] . " "
                . "SET cont_firm_id = '" . $firm_id . "',"
                . "    cont_name = '" . $name . "',"
                . "    cont_email = '" . $email . "',"
                . "    cont_role = '" . $role . "' "
                . "WHERE cont_id = '" . $id . "'";
        parent::db_sql_object()->query($query);

        return TRUE;
    }

    function delete($id) {
        if (!is_numeric($id)) {
            return FALSE;
        }

        $query = "DELETE FROM " . $this->TABLE['contrib'] . " WHERE cont_id = '" . $id . "'";
        parent::db_sql_object()->query($query);
        return TRUE;
    }
}
?>