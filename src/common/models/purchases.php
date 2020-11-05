<?php

namespace purchases\common\models;

use data\model\model;
use data\model\modelInterface;

class purchases extends model implements modelInterface
{
    public $table = 'purchases';
    public $key   = 'purchase_id';
    public $dicionary = "SELECT purchase_id as value, consumer_id as label FROM purchases;";

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