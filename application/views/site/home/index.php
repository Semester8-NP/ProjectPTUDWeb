
<!-- right -->
<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">

    <!-- slide-->
    <?php $this->load->view('site/slide', $this->data); ?>

    <!-- divider line -->
    <div class="dividerline" style="margin: 15px; height: 2px;"></div>

    <!-- promotion product -->
    <div class="panel panel-default">
        <div class="panel-body promotion">
            <h4 class="col-md-12"><strong>Sản phẩm mới nhất</strong></h4>
            <?php foreach ($product_newest as $row): ?>
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 promotion-item">
                <a href="#" class="thumbnail">
                    <img src="<?php echo base_url('upload/product/').$row->image_link ?>" alt="<?php echo $row->name?>">
                    <div class="caption">
                        <h4><?php echo $row->name?></h4>
                        <strong> Giá:
                            <?php if ($row->discount > 0): ?>
                                <?php $new_price = $row->price - $row->discount; ?>
                                <b style="color: #9a161a"><?php echo number_format($new_price); ?>VNĐ</b>
                                <p style="text-decoration:line-through; margin-left: 30px;"><?php echo number_format($row->price) ?>VNĐ</p>
                            <?php else: ?>
                                <p style="color: #9a161a"><?php echo number_format($row->price) ?>VNĐ</p>
                            <?php endif; ?>
                        </strong>
                    </div>
                </a>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
    <!-- the end of promotion product -->

    <!-- product -->
    <div class="panel panel-primary">
        <div class="panel-heading">
            <a href="#">
                <h3 class="panel-title">
                    <strong>Điện thoại</strong>
                </h3>
            </a>
        </div>
        <div class="panel-body normal-product">
            <?php foreach ($phone_list as $row): ?>
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 normal-product-item">
                <a href="#" class="thumbnail">
                    <img src="<?php echo base_url('upload/product/').$row->image_link ?>" alt="<?php echo $row->name?>">
                    <div class="caption">
                        <h4><?php echo $row->name?></h4>
                        <strong> Giá:
                            <?php if ($row->discount > 0): ?>
                                <?php $new_price = $row->price - $row->discount; ?>
                                <b style="color: #9a161a"><?php echo number_format($new_price); ?>VNĐ</b>
                                <p style="text-decoration:line-through; margin-left: 30px;"><?php echo number_format($row->price) ?>VNĐ</p>
                            <?php else: ?>
                                <p style="color: #9a161a"><?php echo number_format($row->price) ?>VNĐ</p>
                            <?php endif; ?>
                        </strong>
                    </div>
                </a>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
    <!-- the end of product -->

</div>
<!-- the end of right -->