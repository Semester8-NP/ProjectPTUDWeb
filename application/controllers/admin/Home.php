<?php
/**
 * Created by PhpStorm.
 * User: nIddy
 * Date: 11/05/2018
 * Time: 2:24 CH
 */

class Home extends MY_Controller{
    function index(){
        $this->data['temp'] = 'admin/home/index';
        $this->load->view('admin/main', $this->data);
    }
}