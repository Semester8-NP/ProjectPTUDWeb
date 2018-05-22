<?php
/**
 * Created by PhpStorm.
 * User: nIddy
 * Date: 22/05/2018
 * Time: 2:20 CH
 */

class Product extends MY_Controller{
    public function __construct()
    {
        parent::__construct();
        // load file model
        $this->load->model('product_model');
    }

    /**
     * Hiển thị danh sách sản phẩm
     */
    function index(){
        // lấy tổng số lượng sản phẩm
        $total_rows = $this->product_model->get_total();
        $this->data['total_rows'] = $total_rows;

        // load thư viện phân trang
        $this->load->library('pagination');
        // cấu hình phân trang
        $config = array();
        $config['total_rows']   = $total_rows;                      // tổng tất cả các sản phẩm trên website
        $config['base_url']     = admin_url('product/index');   // link hiển thị danh sách sản phẩm
        $config['per_page']     = 10;                               // số lượng sản phẩm hiển thị trong 1 trang
        $config['uri_segment']  = 3;                                // phân đoạn hiển thị số trang trên url
        $config['next_link']    = 'trang sau';
        $config['prev_link']    = 'trang trước';
        // khởi tạo cấu hình phân trang
        $this->pagination->initialize($config);

        // lấy nội dung biến message
        $message = $this->session->flashdata('message');
        $this->data['message'] = $message;

        // load view của catalog
        $this->data['temp'] = 'admin/product/index';
        $this->load->view('admin/main', $this->data);
    }
}