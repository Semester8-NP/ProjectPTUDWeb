<?php
/**
 * Created by PhpStorm.
 * User: nIddy
 * Date: 08/05/2018
 * Time: 9:33 SA
 */
function assets_url($url = ''){
    return base_url('assets/'.$url);
}

function pre($list, $exit = true){
    echo '<pre>';
    print_r($list);
    if(exit){
        die();
    }
}