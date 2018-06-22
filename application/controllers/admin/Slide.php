<?php
/**
 * Created by PhpStorm.
 * User: nIddy
 * Date: 22/05/2018
 * Time: 2:20 CH
 */

class Slide extends MY_Controller{
    public function __construct()
    {
        parent::__construct();
        // load file model
        $this->load->model('slide_model');
    }

    /**
     * Hiển thị danh sách slide
     */
    function index(){
        // lấy tổng số lượng slide
        $total_rows = $this->slide_model->get_total();
        $this->data['total_rows'] = $total_rows;

        $input = array();

        // lấy danh sách slide
        $list = $this->slide_model->get_list($input);
        $this->data['list'] = $list;

        // lấy nội dung biến message
        $message = $this->session->flashdata('message');
        $F_message = $this->session->flashdata('F_message');
        $this->data['message'] = $message;
        $this->data['F_message'] = $F_message;

        // load view của catalog
        $this->data['temp'] = 'admin/slide/index';
        $this->load->view('admin/main', $this->data);
    }

    /**
     * Thêm slide mới
     */
    function add(){

        // load thư viện validate dữ liệu
        $this->load->library('form_validation');
        $this->load->helper('form');

        // nếu có dữ liệu post lên -> kiểm tra
        if($this->input->post()){
            // set_rules('cột trong csdl', 'chú thích', 'tập luật')
            $this->form_validation->set_rules('name', 'Tên slide', 'required');

            // nhập liệu đúng yêu cầu
            if ($this->form_validation->run()){
                // upload ảnh minh họa slide
                // lấy tên file ảnh minh họa
                $this->load->library('upload_library');
                $upload_path = "./upload/slide";          // đường dẫn lưu file ảnh
                $upload_data = $this->upload_library->upload($upload_path, 'image');  // image là name của thẻ input
                // pre($upload_data);
                // upload_data trả về 1 mảng thông tin của file ảnh
                $image_link = '';
                // kiểm tra có tồn tại hình ảnh không qua file_name trong mảng thông tin của file ảnh
                if (isset($upload_data['file_name'])){
                    $image_link = $upload_data['file_name'];
                }

                // tên slide
                $name = $this->input->post('name');

                // link của slide
                $link = $this->input->post('link');

                // thông tin slide
                $info = $this->input->post('info');

                // thứ tự hiển thị slide
                $sort_order = $this->input->post('sort_order');

                $data = array(
                    'name'          => $name,
                    'link'          => $link,
                    'info'          => $info,
                    'sort_order'    => $sort_order,
                    'image_link'    => $image_link
                );

                if($this->slide_model->create($data)){
                    // tạo thông báo
                    $this->session->set_flashdata('message', 'Thêm slide mới thành công');
                }else{
                    $this->session->set_flashdata('F_message', 'Thêm slide không thành công');
                }
                redirect(admin_url('slide'));
            }
        }

        // load view
        $this->data['temp'] = 'admin/slide/add';
        $this->load->view('admin/main', $this->data);
    }

    function edit(){

        // lấy id của slide cần sửa
        $id = $this->uri->rsegment(3);
        $slide = $this->slide_model->get_info($id);
        if (!$slide){
            // tạo thông báo
            $this->session->set_flashdata('F_message', 'slide không tồn tại');
        }
        $this->data['slide'] = $slide;

        // load thư viện validate dữ liệu
        $this->load->library('form_validation');
        $this->load->helper('form');

        // nếu có dữ liệu post lên -> kiểm tra
        if($this->input->post()){
            // set_rules('cột trong csdl', 'chú thích', 'tập luật')
            $this->form_validation->set_rules('name', 'Tên slide', 'required');

            // nhập liệu đúng yêu cầu
            if ($this->form_validation->run()){

                // upload ảnh slide
                // lấy tên file ảnh
                $this->load->library('upload_library');
                $upload_path = "./upload/slide";          // đường dẫn lưu file ảnh
                $upload_data = $this->upload_library->upload($upload_path, 'image');  // image là name của thẻ input
                //pre($upload_data);
                // upload_data trả về 1 mảng thông tin của file ảnh
                $image_link = '';
                // kiểm tra có tồn tại hình ảnh không qua file_name trong mảng thông tin của file ảnh
                if (isset($upload_data['file_name'])){
                    $image_link = $upload_data['file_name'];
                }

                // tên slide
                $name = $this->input->post('name');

                // link của slide
                $link = $this->input->post('link');

                // thông tin slide
                $info = $this->input->post('info');

                // thứ tự hiển thị slide
                $sort_order = $this->input->post('sort_order');

                $data = array(
                    'name'          => $name,
                    'link'          => $link,
                    'info'          => $info,
                    'sort_order'    => $sort_order
                );

                if ($image_link != ''){
                    $data['image_link'] = $image_link;
                }

                // thực hiện update
                if($this->slide_model->update($id, $data)){
                    // tạo thông báo
                    $this->session->set_flashdata('message', 'Cập nhật slide mới thành công');
                }else{
                    $this->session->set_flashdata('F_message', 'Cập nhật slide không thành công');
                }
                redirect(admin_url('slide'));
            }
        }

        // load view
        $this->data['temp'] = 'admin/slide/edit';
        $this->load->view('admin/main', $this->data);
    }

    /*
     * Xóa slide
     */
    function delete(){
        $id = $this->uri->rsegment(3);
        $id = intval($id);

        $slide = $this->slide_model->get_info($id);
        if (!$slide){
            // tạo thông báo
            $this->session->set_flashdata('F_message', 'slide không tồn tại');
            redirect(admin_url('slide'));
        }

        // xóa slide
        $this->slide_model->delete($id);
        // xóa hình ảnh slide
        $image_link = './upload/slide/'.$slide->image_link;
        if (file_exists($image_link)){
            unlink($image_link);
        }

        $this->session->set_flashdata('message', 'Xóa slide thành công');
        redirect(admin_url('slide'));
    }
}