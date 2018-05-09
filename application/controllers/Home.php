<?php
/**
 * Created by PhpStorm.
 * User: P
 * Date: 3/21/2018
 * Time: 10:19 AM
 */

class Home extends CI_Controller {
    function index(){
        $data = array();
        $data['temp'] = 'site/home/index';
        $this->load->view('site/layout', $data);
    }
} 