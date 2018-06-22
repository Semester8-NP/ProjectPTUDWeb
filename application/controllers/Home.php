<?php
/**
 * Created by PhpStorm.
 * User: P
 * Date: 3/21/2018
 * Time: 10:19 AM
 */

class Home extends MY_Controller {
    /**
     *
     */
    function index(){

        // slide
        $this->load->model('slide_model');
        $slide_list = $this->slide_model->get_list();
        $this->data['slide_list'] = $slide_list;

        $this->load->model('product_model');
        // sản phẩm mới nhất
        $input = array();
        $input['limit'] = array(4,0);
        $product_newest = $this->product_model->get_list($input);
        $this->data['product_newest'] = $product_newest;

        // lấy catalog
        $catalog = $this->catalog_model->get_info(0);

        // sản phẩm điện thoại
//        $cata = array();
//        $cata['where'] = array('parent_id' => 1);
//        $catalog_l = $this->catalog_model->get_list($cata);
//        foreach ($catalog_l as $cat) {
//            $id_dienthoai[] = $cat->id;
//            foreach ($id_dienthoai as $dienthoai){
//                $phone = array();
//                $phone['where'] = array('catalog_id' => $dienthoai);
//                $phone_list = $this->product_model->get_list($phone);
//                $this->data['phone_list'] = $phone_list;
//            }
//        }
//        $n = count($id_dienthoai);
//        for ($i=0; $i<$n; $i++){
//            if ($all_product->catalog_id == $id_dienthoai){
//                $phone['where'] = array('catalog_id' => $id_dienthoai);
//                $phone_list = $this->product_model->get_list($phone);
//            }
//        }
//        pre($all_product);

        $this->data['temp'] = 'site/home/index';
        $this->load->view('site/layout', $this->data);
    }
} 