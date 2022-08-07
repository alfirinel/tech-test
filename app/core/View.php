<?php

namespace app\core;

class View
{
    /**
     * @var string|mixed
     */
    protected string $template = 'index';

    /**
     * @param $template
     */
    public function __construct($template = null)
    {
        if ($template !== null) {
            $this->template = $template;
        }
    }

    /**
     * @param string $page
     * @param array $data
     */
    public function render(string $page, array $data = [])
    {
        extract($data);
        include_once VIEWS_FOLDER . $this->template . '.php';
    }
}