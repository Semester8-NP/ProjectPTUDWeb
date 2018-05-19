<?php
/**
 * Created by PhpStorm.
 * User: nIddy
 * Date: 10/05/2018
 * Time: 2:08 CH
 */

class Login extends MY_Controller{
    function index(){
        $this->load->library('form_validation');
        $this->load->helper('form');

        if ($this->input->post()){
            $this->form_validation->set_rules('login', 'login', 'callback_check_login');
            if ($this->form_validation->run()){
                $this->session->set_userdata('login', true);

                redirect(admin_url('home'));
            }
        }

        // http://localhost/ProjectPTUDWeb/admin/login
        $this->load->view('admin/login/index');
    }

    /**
     * kiểm tra username &  password đúng không => trả về true or false
     */
    function check_login(){
        $username = $this->input->post('username');
        $password = $this->input->post('password');
        $password = md5($password);

        $this->load->model('admin_model');
        $where = array('username' => $username, 'password' => $password);

        if ($this->admin_model->check_exists($where)){
            return true;
        }
        $this->form_validation->set_message(__FUNCTION__, 'Tên đăng nhập hoặc mật khẩu không chính xác');
        return false;
    }
}