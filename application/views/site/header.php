<!--/**-->
<!-- * Created by PhpStorm.-->
<!-- * User: nIddy-->
<!-- * Date: 09/05/2018-->
<!-- * Time: 7:30 CH-->
<!-- */-->

<header>
    <div class="container">
        <!-- logo -->
        <div class="col-md-4 col-sm-12">
            <a href="index.php">
                <img src="<?php echo assets_url() ?>site/img/LOGO.png">
            </a>
        </div>

        <!-- space -->
        <div class="col-md-4"></div>
        <!-- account -->
        <div class="col-md-4 col-sm-6">
            <div class="dropdown margintop10 text-right">
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        Tài khoản&nbsp;
                        <span class="glyphicon glyphicon-user"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="index.php?xem=dangnhap">Đăng nhập</a></li>
                        <li><a href="index.php?xem=dangky">Đăng ký</a></li>
                        <li><a href="index.php?xem=quenmatkhau">Quên mật khẩu</a></li>
                        <li><a href="index.php?xem=giohang">Giỏ hàng</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>