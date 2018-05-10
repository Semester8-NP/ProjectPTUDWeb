<!--/**-->
<!-- * Created by PhpStorm.-->
<!-- * User: nIddy-->
<!-- * Date: 09/05/2018-->
<!-- * Time: 7:35 CH-->
<!-- */-->

<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- Home button -->
            <a class="navbar-brand" href="index.php"><span class="glyphicon glyphicon-home"> Home</span></a>
        </div>

        <!-- navigation links -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li><a href="#">Tin tức</a></li>
                <li><a href="index.php?xem=dienthoai">Điện thoại</a></li>
                <li><a href="index.php?xem=maytinhbang">Máy tính bảng</a></li>
                <li><a href="index.php?xem=laptop">Laptop</a></li>
                <li><a href="index.php?xem=phukien">Phụ kiện</a></li>
            </ul>
            <!-- search box -->
            <form class="navbar-form navbar-left" role="search">
                <div class="input-group stylish-input-group input-append">
                    <input type="text" class="form-control"  placeholder="Search" >
                    <span class="input-group-addon">
                       		<button type="submit">
                           		<span class="glyphicon glyphicon-search"></span>
                       		</button>
                   		</span>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="index.php?xem=lienhe">Liên hệ</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>