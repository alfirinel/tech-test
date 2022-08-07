<?php

namespace app\models;

class Table
{
    protected $db;

    /**
     * @throws \Exception
     */
    public function __construct()
    {
        $this->db = new \mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
        if ($this->db->connect_errno !== 0) {
            throw new \Exception('mysql error : ' . $this->db->connect_error);
        }
    }

    /**
     *  Select table 'requests' values
     * @return array
     */
    public function all($dateAt, $dateTo): array
    {
        $sql = "SELECT requests.id as id, requests.agent_id as agent_id, requests.disconnect as disconnected, requests.verification_cheapening as verification_cheapening, requests.technical_issue as technical_issue, requests.other as other, requests.total as total, agents.name as name, agents.surname as surname FROM requests INNER JOIN agents ON requests.agent_id = agents.id where created_at between '$dateAt' and '$dateTo'";
        $result = $this->db->query($sql);
        return $result->fetch_all(MYSQLI_ASSOC);
    }
}