<!-- navigation bar -->
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="<?php echo base_url(); ?>"><img src="<?php echo assets_url('site/') ?>img/LOGO.png" class="logo">&nbsp;</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <?php if (is_array($catalog_list)): ?>
                <?php foreach ($catalog_list as $row): ?>
                    <li class="dropdown">
                        <a href="<?php echo base_url('product/catalog/'.$row->id)?>" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" >
                            <?php echo $row->name ?>
                        </a>
                        <?php if (!empty($row->sub)): ?>
                        <!-- Lấy danh sách danh mục con -->
                        <ul class="dropdown-menu" role="menu">
                            <?php foreach ($row->sub as $sub): ?>
                            <li>
                                <a href="<?php echo base_url('product/catalog/'.$sub->id)?>">
                                    <?php echo $sub->name; ?>
                                </a>
                            </li>
                            <?php endforeach; ?>
                        </ul>
                        <?php endif; ?>
                    </li>
                <?php endforeach; ?>
                <?php endif; ?>
            </ul>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Tài khoản &nbsp;<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Đăng nhập</a></li>
                        <li><a href="#">Quên mật khẩu</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li class="divider"></li>
                        <li><a href="#">separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- the end of navigation bar -->