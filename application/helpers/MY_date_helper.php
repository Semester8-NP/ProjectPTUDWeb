<?php
/**
 * Created by PhpStorm.
 * User: nIddy
 * Date: 06/06/2018
 * Time: 2:05 CH
 */

/*
 * Lấy ngày - kiểu int
 * time:        kiểu int - thời gian hiển thị ngày tháng năm
 * full_time :  cho biết có hiển thị giờ phút giây không
 */
function get_date($time, $full_time = false){
    $format = '%d-%m-%Y';
    if ($full_time){
        $format = $format.' - %H:%i:%s';
    }
    $date = mdate($format, $time);
    return $date;
}