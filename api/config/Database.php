<?php

namespace api\config;

class Database {
    private \MySQLi $connection;

    public function __construct() {
        $this->connection = new \MySQLi(HOST, USERNAME, PASSWORD, DATABASE);

        if ($this->connection->connect_error) {
            die("Connection failed: " . $this->connection->connect_error);
        }

        $this->connection->set_charset("utf8mb4");
    }

    public function execute(string $query)
    {
        return $this->connection->query($query);
    }

    public function escape_string(mixed $sku): string
    {
        return $this->connection->escape_string($sku);
    }
}
