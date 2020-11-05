<?php

namespace purchases\common\models;

use data\model\model;
use data\model\modelInterface;

class assets extends model implements modelInterface
{
    public $table = 'assets';
    public $key   = 'asset_id';
    public $dicionary = "SELECT asset_id as value, consumer_id as label FROM assets;";

    /**
     * Evento construtor da classe
     */
    public function __construct()
    {
        parent::__construct($this->getTable(), $this->getKey());
    }

    /**
     * Get the value of table
     */ 
    public function getTable()
    {
        return $this->table;
    }

    /**
     * Get the value of key
     */ 
    public function getKey()
    {
        return $this->key;
    }
}
?>