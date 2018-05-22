<?php
/**
 * Created by PhpStorm.
 * User: nIddy
 * Date: 20/05/2018
 * Time: 11:41 SA
 */

class Catalog extends MY_Controller{
    function __construct()
    {
        parent::__construct();
        $this->load->model('catalog_model');
    }

    /*
     * lấy danh sách danh mục sản phẩm
     */
    function index(){
        $list = $this->catalog_model->get_list();
        $this->data['list'] = $list;

        // lấy nội dung biến message
        $message = $this->session->flashdata('message');
        $this->data['message'] = $message;

        // load view của catalog
        $this->data['temp'] = 'admin/catalog/index';
        $this->load->view('admin/main', $this->data);
    }

    /**
     * Thêm mới danh mục sản phẩm
     */
    function add(){
        // load thư viện validate dữ liệu
        $this->load->library('form_validation');
        $this->load->helper('form');

        // nếu có dữ liệu post lên -> kiểm tra
        if($this->input->post()){
            // set_rules('cột trong csdl', 'chú thích', 'tập luật')
            $this->form_validation->set_rules('name', 'Tên danh mục', 'required');

            // nhập liệu đúng yêu cầu
            if ($this->form_validation->run()){
                // thêm vào csdl
                $name = $this->input->post('name');
                $parent_id = $this->input->post('parent_id');
                $sort_order = $this->input->post('sort_order');

                $data = array(
                    'name'          => $name,
                    'parent_id'     => $parent_id,
                    'sort_order'    => intval($sort_order)
                );

                if($this->catalog_model->create($data)){
                    // tạo thông báo
                    $this->session->set_flashdata('message', 'Thêm danh mục mới thành công');
                }else{
                    $this->session->set_flashdata('message', 'Thêm danh mục không thành công');
                }
                redirect(admin_url('catalog'));
            }
        }

        // lấy danh sách danh mục cha
        $input = array();
        $input['where'] = array('parent_id' => 0);
        $list = $this->catalog_model->get_list($input);
        $this->data['list'] = $list;

        $this->data['temp'] = 'admin/catalog/add';
        $this->load->view('admin/main', $this->data);
    }

    /**
     * Chỉnh sửa danh mục sản phẩm
     */
    function edit(){
        // lấy id cần sửa
        $id = $this->uri->rsegment('3'); //id cần sửa ở phân đoạn 3 của link ".../admin/segment1/segment2/segment3"
        $info = $this->catalog_model->get_info($id);
        if(!$info){
            // nếu không có id cần sửa, chuyển về trang danh sách
            // tạo thông báo
            $this->session->set_flashdata('message', 'danh mục không tồn tại');
            redirect(admin_url('catalog'));
        }
        $this->data['info'] = $info;
        $id = intval($id);

        // load thư viện validate dữ liệu
        $this->load->library('form_validation');
        $this->load->helper('form');

        // nếu có dữ liệu post lên -> kiểm tra
        if($this->input->post()){
            // set_rules('cột trong csdl', 'chú thích', 'tập luật')
            $this->form_validation->set_rules('name', 'Tên danh mục', 'required');

            // nhập liệu đúng yêu cầu
            if ($this->form_validation->run()){
                // thêm vào csdl
                $name = $this->input->post('name');
                $parent_id = $this->input->post('parent_id');
                $sort_order = $this->input->post('sort_order');

                $data = array(
                    'name'          => $name,
                    'parent_id'     => $parent_id,
                    'sort_order'    => intval($sort_order)
                );

                if($this->catalog_model->update($id, $data)){
                    // tạo thông báo
                    $this->session->set_flashdata('message', 'Cập nhật danh mục thành công');
                }else{
                    $this->session->set_flashdata('message', 'Cập nhật danh mục không thành công');
                }
                redirect(admin_url('catalog'));
            }
        }

        // lấy danh sách danh mục cha
        $input = array();
        $input['where'] = array('parent_id' => 0);
        $list = $this->catalog_model->get_list($input);
        $this->data['list'] = $list;

        $this->data['temp'] = 'admin/catalog/edit';
        $this->load->view('admin/main', $this->data);
    }

    /**
     * Xóa danh mục
     */
    function delete(){
        // lấy id cần xóa
        $id = $this->uri->rsegment('3');
        $id = intval($id);

        // lấy thông tin cần xóa
        $info = $this->catalog_model->get_info($id);
        // kiểm tra thông tin cần xóa, nếu không có thì trả về trang danh sách
        if (!$info){
            $this->session->set_flashdata('message', 'danh mục không tồn tại');
            redirect(admin_url('catalog'));
        }

        // xóa
        $this->catalog_model->delete($id);

        $this->session->set_flashdata('message', 'Xóa danh mục thành công');
        redirect(admin_url('catalog'));
    }
}