<?php

namespace app\controllers;

use app\core\Route;
use app\core\View;
use app\models\Table;

class Index
{

    /**
     * @var View
     */
    protected $view;

    /**
     * @var Table
     */
    protected $model;

    /*
     * model constructor
     */
    public function __construct()
    {
        $this->view = new View();
        $this->model = new Table();
    }

    /*
     * Display values on the page
     */
    public function index()
    {
        $date_at = strtotime($_POST['dateAt']);
        $new_date_at = date('Y-m-d',  $date_at);
        $date_to = strtotime($_POST['dateTo']);
        $new_date_to = date('Y-m-d',  $date_to);

        $this->view->render('index',
            [
                'values' => $this->model->all($new_date_at, $new_date_to),
                'dateAt' => $new_date_at,
                'dateTo' => $new_date_to,
            ]);
    }
}