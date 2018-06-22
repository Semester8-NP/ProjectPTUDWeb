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
        $config['per_page']     = 5;                               // số lượng sản phẩm hiển thị trong 1 trang
        $config['uri_segment']  = 5;                                // phân đoạn hiển thị số trang trên url
        $config['last_link']    = 'Cuối';
        $config['next_link']    = '>>';
        $config['prev_link']    = '<<';
        $config['first_link']   = 'Đầu';
        // khởi tạo cấu hình phân trang
        $this->pagination->initialize($config);

        $segment = $this->uri->segment(4);
        $segment = intval($segment);

        $input = array();
        $input['limit'] = array($config['per_page'], $segment);

        // kiểm tra hành động lọc
        $id = $this->input->get('id');
        $id = intval($id);

        $input['where'] = array();
        if ($id > 0){
            $input['where']['id'] = $id;
        }

        $name = $this->input->get('name');
        if ($name){
            $input['like'] = array('name', $name);
        }

        $catalog_id = $this->input->get('catalog');
        $catalog_id = intval($catalog_id);
        if ($catalog_id > 0){
            $input['where']['catalog_id'] = $catalog_id;
        }
        // lấy danh sách sản phẩm
        $list = $this->product_model->get_list($input);
        $this->data['list'] = $list;

        // lấy danh sách danh mục sản phẩm
        $this->load->model('catalog_model');
        $input = array();
        $input['where'] = array('parent_id'=>0);
        $catalog = $this->catalog_model->get_list($input);
        foreach ($catalog as $row){
            $input['where'] = array('parent_id' => $row->id);
            $sub = $this->catalog_model->get_list($input);
            $row->sub = $sub;
        }
        $this->data['catalog'] = $catalog;

        // lấy nội dung biến message
        $message = $this->session->flashdata('message');
        $F_message = $this->session->flashdata('F_message');
        $this->data['message'] = $message;
        $this->data['F_message'] = $F_message;

        // load view của catalog
        $this->data['temp'] = 'admin/product/index';
        $this->load->view('admin/main', $this->data);
    }

    /**
     * Thêm sản phẩm mới
     */
    function add(){

        // lấy danh sách danh mục sản phẩm
        $this->load->model('catalog_model');
        $input = array();
        $input['where'] = array('parent_id'=>0);
        $catalog = $this->catalog_model->get_list($input);
        foreach ($catalog as $row){
            $input['where'] = array('parent_id' => $row->id);
            $sub = $this->catalog_model->get_list($input);
            $row->sub = $sub;
        }
        $this->data['catalog'] = $catalog;

        // load thư viện validate dữ liệu
        $this->load->library('form_validation');
        $this->load->helper('form');

        // nếu có dữ liệu post lên -> kiểm tra
        if($this->input->post()){
            // set_rules('cột trong csdl', 'chú thích', 'tập luật')
            $this->form_validation->set_rules('name', 'Tên sản phẩm', 'required');
            $this->form_validation->set_rules('price', 'Giá sản phẩm', 'required');
            $this->form_validation->set_rules('catalog_id', 'Thể loại', 'required');

            // nhập liệu đúng yêu cầu
            if ($this->form_validation->run()){
                // thêm vào csdl
                $name = $this->input->post('name');
                $catalog_id = $this->input->post('catalog_id');
                $price = $this->input->post('price');
                // xóa dấu ',' của số tiền
                $price = str_replace(',', '', $price);


                // upload ảnh minh họa sản phẩm
                // lấy tên file ảnh minh họa
                $this->load->library('upload_library');
                $upload_path = "./upload/product";          // đường dẫn lưu file ảnh
                $upload_data = $this->upload_library->upload($upload_path, 'image');  // image là name của thẻ input
                //pre($upload_data);
                // upload_data trả về 1 mảng thông tin của file ảnh
                $image_link = '';
                // kiểm tra có tồn tại hình ảnh không qua file_name trong mảng thông tin của file ảnh
                if (isset($upload_data['file_name'])){
                    $image_link = $upload_data['file_name'];
                }

                // upload list ảnh kèm theo sản phẩm
                $image_list = array();
                $image_list = $this->upload_library->upload_file($upload_path, 'image_list'); // image_list là name của thẻ input
                $image_list = json_encode($image_list);

                // giảm giá
                $discount = $this->input->post('discount');
                $discount = str_replace(',','', $discount);

                // bảo hành
                $warranty = $this->input->post('warranty');

                // quà tặng kèm
                $gifts = $this->input->post('gifts');

                // mô tả sản phẩm
                $content = $this->input->post('content');

                $data = array(
                    'name'          => $name,
                    'catalog_id'    => $catalog_id,
                    'price'         => $price,
                    'image_link'    => $image_link,
                    'image_list'    => $image_list,
                    'discount'      => $discount,
                    'warranty'      => $warranty,
                    'gifts'         => $gifts,
                    'content'       => $content,
                    'created'       => now()
                );

                if($this->product_model->create($data)){
                    // tạo thông báo
                    $this->session->set_flashdata('message', 'Thêm sản phẩm mới thành công');
                }else{
                    $this->session->set_flashdata('F_message', 'Thêm sản phẩm không thành công');
                }
                redirect(admin_url('product'));
            }
        }

        // load view
        $this->data['temp'] = 'admin/product/add';
        $this->load->view('admin/main', $this->data);
    }

    function edit(){

        // lấy id của sản phẩm cần sửa
        $id = $this->uri->rsegment(3);
        $product = $this->product_model->get_info($id);
        if (!$product){
            // tạo thông báo
            $this->session->set_flashdata('F_message', 'Sản phẩm không tồn tại');
        }
        $this->data['product'] = $product;

        // lấy danh sách danh mục sản phẩm
        $this->load->model('catalog_model');
        $input = array();
        $input['where'] = array('parent_id'=>0);
        $catalog = $this->catalog_model->get_list($input);
        foreach ($catalog as $row){
            $input['where'] = array('parent_id' => $row->id);
            $sub = $this->catalog_model->get_list($input);
            $row->sub = $sub;
        }
        $this->data['catalog'] = $catalog;

        // load thư viện validate dữ liệu
        $this->load->library('form_validation');
        $this->load->helper('form');

        // nếu có dữ liệu post lên -> kiểm tra
        if($this->input->post()){
            // set_rules('cột trong csdl', 'chú thích', 'tập luật')
            $this->form_validation->set_rules('name', 'Tên sản phẩm', 'required');
            $this->form_validation->set_rules('price', 'Giá sản phẩm', 'required');
            $this->form_validation->set_rules('catalog_id', 'Thể loại', 'required');

            // nhập liệu đúng yêu cầu
            if ($this->form_validation->run()){
                // thêm vào csdl
                $name = $this->input->post('name');
                $catalog_id = $this->input->post('catalog_id');
                $price = $this->input->post('price');
                // xóa dấu ',' của số tiền
                $price = str_replace(',', '', $price);


                // upload ảnh minh họa sản phẩm
                // lấy tên file ảnh minh họa
                $this->load->library('upload_library');
                $upload_path = "./upload/product";          // đường dẫn lưu file ảnh
                $upload_data = $this->upload_library->upload($upload_path, 'image');  // image là name của thẻ input
                //pre($upload_data);
                // upload_data trả về 1 mảng thông tin của file ảnh
                $image_link = '';
                // kiểm tra có tồn tại hình ảnh không qua file_name trong mảng thông tin của file ảnh
                if (isset($upload_data['file_name'])){
                    $image_link = $upload_data['file_name'];
                }

                // upload list ảnh kèm theo sản phẩm
                $image_list = array();
                $image_list = $this->upload_library->upload_file($upload_path, 'image_list'); // image_list là name của thẻ input
                $image_list_json = json_encode($image_list);

                // giảm giá
                $discount = $this->input->post('discount');
                $discount = str_replace(',','', $discount);

                // bảo hành
                $warranty = $this->input->post('warranty');

                // quà tặng kèm
                $gifts = $this->input->post('gifts');

                // mô tả sản phẩm
                $content = $this->input->post('content');

                $data = array(
                    'name'          => $name,
                    'catalog_id'    => $catalog_id,
                    'price'         => $price,
                    'discount'      => $discount,
                    'warranty'      => $warranty,
                    'gifts'         => $gifts,
                    'content'       => $content,
                    // thông số kỹ thuật sản phẩm
                    'screen'        => $this->input->post('screen'),
                    'os'            => $this->input->post('os'),
                    'back_cam'      => $this->input->post('back_cam'),
                    'front_cam'     => $this->input->post('front_cam'),
                    'cpu'           => $this->input->post('cpu'),
                    'ram'           => $this->input->post('ram'),
                    'memory'        => $this->input->post('memory'),
                    'pin'           => $this->input->post('pin'),
                    'sim'           => $this->input->post('sim')
                );

                if ($image_link != ''){
                    $data['image_link'] = $image_link;
                }
                if ($image_list != ''){
                    $data['image_list'] = $image_list_json;
                }

                if($this->product_model->update($id, $data)){
                    // tạo thông báo
                    $this->session->set_flashdata('message', 'Cập nhật sản phẩm thành công');
                }else{
                    $this->session->set_flashdata('F_message', 'Cập nhật sản phẩm không thành công');
                }
                redirect(admin_url('product'));
            }
        }

        // load view
        $this->data['temp'] = 'admin/product/edit';
        $this->load->view('admin/main', $this->data);
    }

    /*
     * Xóa sản phẩm
     */
    function delete(){
        $id = $this->uri->rsegment(3);
        $id = intval($id);

        $product = $this->product_model->get_info($id);
        if (!$product){
            // tạo thông báo
            $this->session->set_flashdata('F_message', 'Sản phẩm không tồn tại');
            redirect(admin_url('product'));
        }

        // xóa sản phẩm
        $this->product_model->delete($id);
        // xóa hình ảnh sản phẩm
        $image_link = './upload/product/'.$product->image_link;
        if (file_exists($image_link)){
            unlink($image_link);
        }
        // xóa các ảnh kèm theo
        $image_list = json_decode($product->image_list);
        if (is_array($image_list)){
            foreach ($image_list as $img){
                $image_link = './upload/product/'.$img;
                if (file_exists($image_link)){
                    unlink($image_link);
                }
            }
        }

        $this->session->set_flashdata('message', 'Xóa sản phẩm thành công');
        redirect(admin_url('product'));
    }
}