<?php
/**
 * Created by PhpStorm.
 * User: P
 * Date: 3/21/2018
 * Time: 10:19 AM
 */

class Home extends CI_Controller {
    function index(){
        $this->load->view('user/home');
    }
} 