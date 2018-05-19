<?php
/**
 * Created by PhpStorm.
 * User: nIddy
 * Date: 10/05/2018
 * Time: 2:06 CH
 */

Class MY_Controller extends CI_Controller{

    public $data = array();

    public function __construct()
    {
        // kế thừa từ CI_Controller
        parent::__construct();

        $controller = $this->uri->segment(1);
        switch ($controller){
            case 'admin' :
                {
                    // xử lí ở trang admin
                    $this->load->helper('admin');
                    $this->_check_login();
                    break;
                }
            default :
                {
                    // xử lí ở trang ngoài

                }
        }
    }

    private function _check_login(){
        $controller = $this->uri->rsegment('1');
        $controller = strtolower($controller);

        $login = $this->session->userdata('login');
        // nếu chưa đăng nhập mà truy cập vào controller khác
        if (!$login && $controller != 'login'){
            redirect(admin_url('login')); // => trả về trang login
        }
        // nếu đã đăng nhập mà truy cập vào controller login
        if ($login && $controller == 'login'){
            redirect(admin_url('home')); // => trả về trang chủ
        }
    }
}