<?php

namespace App\Controller;

use Twig\Loader\FilesystemLoader as TwigLoader;
use Twig\Environment as TwigEnvironment;

/**
 * Managing twig controller
 */
class Controller
{
    /**
     * directory of the templates
     *
     * @var string
     */
    protected $_path;

    /**
     * directory of the cache
     *
     * @var string
     */
    protected $_cache;

    public function __construct()
    {
        $this->_path = dirname(dirname(__FILE__)) . '/resources/views';

        // $this->_cache = dirname(dirname(dirname(__FILE__))).'/cache';
        $this->_cache = false;
    }

    /**
     * Load & render template
     *
     * @param string $name name of the template
     * @param array $options options to the template
     * @return void
     */
    public function render($name, $options = [])
    {
        $twig = new TwigEnvironment(new TwigLoader($this->_path), [$this->_cache]);

        echo $twig->load($name.'.html.twig')->render($options);
    }
}
