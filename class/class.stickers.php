<?php
class firm extends db {

    function firm() {
        parent::initTables();
    }

    function read($id = 0, $order = 'firm_name ASC') {
        if (!is_numeric($id)) {
            return FALSE;
        }

        if ($id) $id = "WHERE firm_id = '" . $id . "'";
        else $id = "";

        $query = "SELECT * FROM " . $this->TABLE['sticker'] . " "
                . "$id ORDER BY $order";

        return parent::db_fetch_array($query);
    }

    function readDistinct($field_name) {
        if (!is_string($field_name)) {
            return FALSE;
        }

        $query = "SELECT DISTINCT $field_name FROM " . $this->TABLE['sticker'] . " "
                . "ORDER BY $field_name ASC";

        return parent::db_fetch_array($query);
    }

    function add($name, $email, $website, $addr_street, $addr_zip, $addr_city, $addr_country) {
        if (!is_string($name) || !is_string($addr_country)) {
            return FALSE;
        }

        $query = "INSERT INTO " . $this->TABLE['sticker'] . "(firm_name, firm_email, firm_web, firm_addr_street, firm_addr_zipcode,
            firm_addr_city, firm_addr_country) "
                . "VALUES('" . $name . "', '" . $email . "', '" . $website . "', '" . $addr_street . "', '" . $addr_zip . "',
                    '" . $addr_city . "', '" . $addr_country . "')";
        parent::db_sql_object()->query($query);
        return TRUE;
    }

    function update($id, $name, $email, $website, $addr_street, $addr_zip, $addr_city, $addr_country) {
        if (!is_numeric($id) || !is_string($name) || !is_string($addr_country)) {
            return FALSE;
        }

        $query = "UPDATE " . $this->TABLE['sticker'] . " "
                . "SET firm_name = '" . $name . "',"
                . "    firm_email = '" . $email . "',"
                . "    firm_web = '" . $website . "',"
                . "    firm_addr_street = '" . $addr_street . "', "
                . "    firm_addr_zipcode = '" . $addr_zip . "', "
                . "    firm_addr_city = '" . $addr_city . "', "
                . "    firm_addr_country = '" . $addr_country . "' "
                . "WHERE firm_id = '" . $id . "'";
        parent::db_sql_object()->query($query);

        return TRUE;
    }

    function delete($id) {
        if (!is_numeric($id)) {
            return FALSE;
        }

        $query = "DELETE FROM " . $this->TABLE['sticker'] . " "
                . "WHERE firm_id = '" . $id . "'";
        parent::db_sql_object()->query($query);
        return TRUE;
    }
}
?>