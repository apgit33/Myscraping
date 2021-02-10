<?php

namespace App\Models\User;

use JsonSerializable;

/**
 * User class
 * 
 * @author Paturot A. <adrienpaturot@yahoo.fr>
 */
class User
{

    /**
     * The id of the user.
     *
     * @var integer
     */
    private $_id;

    /**
     * The first name of the user.
     *
     * @var string
     */
    private $_firstName;

    /**
     * The last name of the user.
     *
     * @var string
     */
    private $_lastName;

    /**
     * The phone number of the user.
     *
     * @var string
     */
    private $_phone;

    /**
     * The email of the user.
     *
     * @var string
     */
    private $_email;

    /**
     * The password of the user.
     *
     * @var string
     */
    private $_password;

    /**
     * User validated or not.
     *
     * @var boolean
     */
    private $_validate = false;

    /**
     * The validation string of the user.
     *
     * @var string
     */
    private $_validation;

    /**
     * Get the id of the user.
     *
     * @return  integer
     */
    public function getId()
    {
        return $this->_id;
    }

    /**
     * Set the id of the user.
     *
     * @param  integer  $_id  The id of the user.
     *
     * @return  self
     */ 
    public function set_u_id($_id)
    {
        $this->_id = $_id;

        return $this;
    }

    /**
     * Get the first name of the user.
     *
     * @return  string
     */
    public function getFirstName()
    {
        return $this->_firstName;
    }

    /**
     * Set the first name of the user.
     *
     * @param  string  $_firstName  The first name of the user.
     *
     * @return  self
     */
    public function set_u_first_name(string $_firstName)
    {
        $this->_firstName = $_firstName;

        return $this;
    }

    /**
     * Get the last name of the user.
     *
     * @return  string
     */
    public function getLastName()
    {
        return $this->_lastName;
    }

    /**
     * Set the last name of the user.
     *
     * @param  string  $_lastName  The last name of the user.
     *
     * @return  self
     */
    public function set_u_last_name(string $_lastName)
    {
        $this->_lastName = $_lastName;

        return $this;
    }

    /**
     * Get the phone number of the user.
     *
     * @return  string
     */
    public function getPhone()
    {
        return $this->_phone;
    }

    /**
     * Set the phone number of the user.
     *
     * @param  string  $_phone  The phone number of the user.
     *
     * @return  self
     */
    public function set_u_phone(string $_phone)
    {
        $this->_phone = $_phone;

        return $this;
    }

    /**
     * Get the email of the user.
     *
     * @return  string
     */
    public function getEmail()
    {
        return $this->_email;
    }

    /**
     * Set the email of the user.
     *
     * @param  string  $_email  The email of the user.
     *
     * @return  self
     */
    public function set_u_email(string $_email)
    {
        $this->_email = $_email;

        return $this;
    }

    /**
     * Get the password of the user.
     *
     * @return  string
     */
    public function getPassword()
    {
        return $this->_password;
    }

    /**
     * Set the password of the user.
     *
     * @param  string  $_password  The password of the user.
     *
     * @return  self
     */
    public function set_u_password(string $_password)
    {
        $this->_password = $_password;

        return $this;
    }

    /**
     * Set user validated or not.
     *
     * @param  boolean  $_validate  User validated or not.
     *
     * @return  self
     */
    public function set_u_validate(bool $_validate)
    {
        $this->_validate = $_validate;

        return $this;
    }

    /**
     * Get the validation of the user.
     *
     * @return  string
     */
    public function getValidation()
    {
        return $this->_validation;
    }

    /**
     * Set the validation of the user.
     *
     * @param  string  $_validation  The validation of the user.
     *
     * @return  self
     */
    public function set_u_validation(string $_validation)
    {
        $this->_validation = $_validation;

        return $this;
    }

    /**
     * Get the full name of the user.
     *
     * @return  string
     */
    public function getFullName()
    {
        return $this->_firstName . " " . $this->_lastName;
    }

    /**
     * User is validated or not ?
     *
     * @return  boolean
     */
    public function isValidate()
    {
        return $this->_validate;
    }

    public function hydrate(array $data)
    {
        foreach ($data as $key => $value)
        {
            $method = 'set_'.$key;
            // var_dump($method);
            if(method_exists($this, $method))
            {
                $this->$method($value);
            }    
        }
    }
}
