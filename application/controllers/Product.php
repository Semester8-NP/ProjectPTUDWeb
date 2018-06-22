<?php
/**
 * Created by PhpStorm.
 * User: nIddy
 * Date: 09/06/2018
 * Time: 4:24 CH
 */

class Product extends MY_Controller{
    public function __construct()
    {
        parent::__construct();
        // model sản phẩm
        $this->load->model('product_model');
    }

    /**
     * hiển thị danh sách danh sản phẩm theo danh mục
     */
    function catalog(){
        // lấy id danh mục
        $id = intval($this->uri->rsegment(3));
        // lấy thông tin của danh mục
        $this->load->model('catalog_model');
        $catalog = $this->catalog_model->get_info($id);
        if (!$catalog){
            redirect();
        }
        $this->data['catalog'] = $catalog;
        $input = array();

        // kiểm tra có phải danh mục cha không
        if($catalog->parent_id == 0) {
            $input_catalog = array();
            $input_catalog['where']  = array('parent_id' => $id);
            $catalog_subs = $this->catalog_model->get_list($input_catalog);
            if(!empty($catalog_subs)) //neu danh muc hien tai co danh muc con
            {
                $catalog_subs_id = array();
                foreach ($catalog_subs as $sub)
                {
                    $catalog_subs_id[] = $sub->id;
                }
                //lay tat ca san pham thuoc cac danh mục con do
                $this->db->where_in('catalog_id', $catalog_subs_id);

            }else{
                $input['where'] = array('catalog_id' => $id);
            }
        }else{
            $input['where'] = array('catalog_id' => $id);
        }

        // lấy tổng số lượng sản phẩm
        $total_rows = $this->product_model->get_total($input);
        $this->data['total_rows'] = $total_rows;

        // load thư viện phân trang
        $this->load->library('pagination');
        // cấu hình phân trang
        $config = array();
        $config['total_rows']   = $total_rows;                          // tổng tất cả các sản phẩm trên website
        $config['base_url']     = base_url('product/catalog/'.$id); // link hiển thị danh sách sản phẩm
        $config['per_page']     = 16;                                    // số lượng sản phẩm hiển thị trong 1 trang
        $config['uri_segment']  = 4;                                    // phân đoạn hiển thị số trang trên url
        $config['last_link']    = 'Cuối';
        $config['next_link']    = '>>';
        $config['prev_link']    = '<<';
        $config['first_link']   = 'Đầu';
        // khởi tạo cấu hình phân trang
        $this->pagination->initialize($config);

        $segment = $this->uri->segment(4);
        $segment = intval($segment);

        $input['limit'] = array($config['per_page'], $segment);

        // lấy danh sách sản phẩm thuộc danh mục
        $list = $this->product_model->get_list($input);
        $this->data['list'] = $list;

        // hiển thị ra view
        $this->data['temp'] = 'site/product/catalog';
        $this->load->view('site/layout', $this->data);
    }

    /**
     * Xem chi tiết sản phẩm
     */
    function view(){

    }
}