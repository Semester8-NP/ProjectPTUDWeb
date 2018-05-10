<?php
/**
 * Created by PhpStorm.
 * User: nIddy
 * Date: 10/05/2018
 * Time: 2:06 CH
 */

Class MY_Controller extends CI_Controller{
    public function __construct()
    {
        // kế thừa từ CI_Controller
        parent::__construct();

        $controller = $this->uri->segment(1);
        switch ($controller){
            case 'admin' :
                {
                    // xử lí ở trang admin
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

    }
}