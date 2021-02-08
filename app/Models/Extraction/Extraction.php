<?php

namespace App\Models\Extraction;

use DateTime;

/**
 * Extraction class
 * 
 * @author Paturot A. <adrienpaturot@yahoo.fr>
 */
class Extraction {
    
    /**
     * The id of the extraction.
     *
     * @var integer
     */
    protected $_id;

    /**
     * The title of the extraction.
     *
     * @var string
     */
    private $_title;

    /**
     * The web site of the extraction.
     *
     * @var string
     */
    private $_site;

    /**
     * The periodicity of the extraction.
     *
     * @var string
     */
    private $_periodicity;

    /**
     * The creation date of the extraction.
     *
     * @var DateTime
     */
    private $_date;

    /**
     * Dataset or not.
     *
     * @var boolean
     */
    private $_dataset = false;

    public function __construct()
    {
        $this->_date = new DateTime('NOW');
    }


    /**
     * Get the id of the extraction.
     *
     * @return  integer
     */ 
    public function getId()
    {
        return $this->_id;
    }

    /**
     * Get the title of the extraction.
     *
     * @return  string
     */ 
    public function getTitle()
    {
        return $this->_title;
    }

    /**
     * Set the title of the extraction.
     *
     * @param  string  $_title  The title of the extraction.
     *
     * @return  self
     */ 
    public function setTitle(string $_title)
    {
        $this->_title = $_title;

        return $this;
    }

    /**
     * Get the web site of the extraction.
     *
     * @return  string
     */ 
    public function getSite()
    {
        return $this->_site;
    }

    /**
     * Set the web site of the extraction.
     *
     * @param  string  $_site  The web site of the extraction.
     *
     * @return  self
     */ 
    public function setSite(string $_site)
    {
        $this->_site = $_site;

        return $this;
    }

    /**
     * Get the periodicity of the extraction.
     *
     * @return  string
     */ 
    public function getPeriodicity()
    {
        return $this->_periodicity;
    }

    /**
     * Set the periodicity of the extraction.
     *
     * @param  string  $_periodicity  The periodicity of the extraction.
     *
     * @return  self
     */ 
    public function setPeriodicity(string $_periodicity)
    {
        $this->_periodicity = $_periodicity;

        return $this;
    }

    
}