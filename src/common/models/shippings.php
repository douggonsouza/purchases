<?php

namespace purchases\common\models;

use data\model\model;
use data\model\modelInterface;

class shippings extends model implements modelInterface
{
    public $table = 'shippings';
    public $key   = 'shipping_id';
    public $dicionary = "SELECT shipping_id as value, consumer_id as label FROM shippings;";

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