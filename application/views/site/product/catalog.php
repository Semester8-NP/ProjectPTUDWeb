<!-- right -->
<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
    <div class="panel panel-default">
        <div class="panel-body normal-product">
            <!-- show all product of catalog -->
            <?php foreach ($list as $row): ?>
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
        <ul class="pagination">
            <?php echo $this->pagination->create_links(); ?>
        </ul>
    </div>

</div>
<!-- the end of right -->