<?php
/**
 * Created by PhpStorm.
 * User: nIddy
 * Date: 15/05/2018
 * Time: 3:01 CH
 */
// tạo ra các link trong admin
function admin_url($url = ''){
    return base_url('admin/'.$url);
}