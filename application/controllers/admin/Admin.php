<?php
/**
 * Created by PhpStorm.
 * User: nIddy
 * Date: 14/05/2018
 * Time: 10:23 SA
 */
class Admin extends MY_Controller{
    function __construct()
    {
        parent:: __construct();
        $this->load->model('admin_model');
    }

    /**
     * lấy danh sách admin
     */
    function index(){
        $input = array();
        $list = $this->admin_model->get_list($input);
        $this->data['list'] = $list;

        $total = $this->admin_model->get_total();
        $this->data['total'] = $total;

        // lấy nội dung biến message
        $message = $this->session->flashdata('message');
        $this->data['message'] = $message;

        $this->data['temp'] = 'admin/admin/index';
        $this->load->view('admin/main', $this->data);
    }

    /**
     * kiểm tra username tồn tại chưa
    */
    function check_username(){
        $username = $this->input->post('username');
        $where = array('username' => $username);
        if($this->admin_model->check_exists($where)){
            // thông báo lỗi trùng username
            $this->form_validation->set_message(__FUNCTION__, 'Tài khoản đã tồn tại.');
            return false;
        }else{
            return true;
        }
    }

    /**
     * Thêm quản trị mới
     */
    function add(){
        $this->load->library('form_validation');
        $this->load->helper('form');

        // nếu có dữ liệu post lên -> kiểm tra
        if($this->input->post()){
            // set_rules('cột trong csdl', 'chú thích', 'tập luật')
            $this->form_validation->set_rules('name', 'Họ Tên', 'required|min_length[8]');
            $this->form_validation->set_rules('username', 'tên đăng nhập', 'required|callback_check_username');
            $this->form_validation->set_rules('password', 'mật khẩu', 'required|min_length[6]');
            $this->form_validation->set_rules('re_password', 'nhập lại mật khẩu', 'matches[password]');

            // nhập liệu đúng yêu cầu
            if ($this->form_validation->run()){
                // thêm vào csdl
                $name = $this->input->post('name');
                $username = $this->input->post('username');
                $password = $this->input->post('password');

                $data = array(
                    'name' => $name,
                    'username' => $username,
                    'password' => md5('$password')
                );
                if($this->admin_model->create($data)){
                    // tạo thông báo
                    $this->session->set_flashdata('message', 'Thêm admin mới thành công');
                }else{
                    $this->session->set_flashdata('message', 'Thêm admin không thành công');
                }
                redirect(admin_url('admin '));
            }
        }

        $this->data['temp'] = 'admin/admin/add';
        $this->load->view('admin/main', $this->data);
    }

    /**
     * Chỉnh sửa thông tin admin
     */
    function edit(){
        // lấy id admin cần sửa
        $id = $this->uri->rsegment('3');
        $id = intval($id);

        $this->load->library('form_validation');
        $this->load->helper('form');

        // lấy thông tin admin cần sửa
        $info = $this->admin_model->get_info($id);
        if (!$info){
            $this->session->set_flashdata('message', 'admin không tồn tại');
            redirect(admin_url('admin'));
        }
        $this->data['info'] = $info;

        if ($this->input->post()){
            // set_rules('cột trong csdl', 'chú thích', 'tập luật')
            $this->form_validation->set_rules('name', 'Họ Tên', 'required|min_length[8]');
            $this->form_validation->set_rules('username', 'tên đăng nhập', 'required|callback_check_username');

            $password = $this->input->post('password');
            if($password){
                $this->form_validation->set_rules('password', 'mật khẩu', 'required|min_length[6]');
                $this->form_validation->set_rules('re_password', 'nhập lại mật khẩu', 'matches[password]');
            }
            if ($this->form_validation->run()){
                // thêm vào csdl
                $name = $this->input->post('name');
                $username = $this->input->post('username');

                $data = array(
                    'name' => $name,
                    'username' => $username,
                );

                // nếu có thay đổi mật khẩu thì đưa $password vào array data
                if ($password){
                    $data['password'] = md5($password);
                }

                if($this->admin_model->update($id, $data)){
                    // tạo thông báo
                    $this->session->set_flashdata('message', 'Cập nhật thông tin thành công');
                }else{
                    $this->session->set_flashdata('message', 'Cập nhật thông tin không thành công');
                }
                redirect(admin_url('admin'));
            }
        }

        $this->data['temp'] = 'admin/admin/edit';
        $this->load->view('admin/main', $this->data);
    }

    /**
     * Xóa admin
     */
    function delete(){
        // lấy id admin cần xóa
        $id = $this->uri->rsegment('3');
        $id = intval($id);

        // lấy thông tin admin cần sửa
        $info = $this->admin_model->get_info($id);
        if (!$info){
            $this->session->set_flashdata('message', 'admin không tồn tại');
            redirect(admin_url('admin'));
        }

        // xóa
        $this->admin_model->delete($id);

        $this->session->set_flashdata('message', 'Xóa admin thành công');
        redirect(admin_url('admin'));
    }

    /**
     * Đăng xuất
     */
    function logout(){
        if ($this->session->userdata('login')){
            $this->session->unset_userdata('login');
        }
        redirect(admin_url('login'));
    }
}