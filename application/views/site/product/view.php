<!-- right -->
<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
    <!-- product details -->
    <div class="panel panel-default">
        <div class="panel-body">
            <!-- preview picture -->
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <h3 class="product-title">
                        <?php echo $product->name ?>
                    </h3>
                    <div class="dividerline"></div>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="thumbnail">
                        <img src="<?php echo base_url('upload/product/'.$product->image_link)?>" alt="<?php echo $product->name ?>">
                    </div>
                </div>
                <!-- details -->
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <strong>Giá: </strong>
                    <?php if ($product->discount > 0): ?>
                        <?php $new_price = $product->price - $product->discount; ?>
                        <b class="price" "><?php echo number_format($new_price); ?>VNĐ</b>
                        <p class="old_price"><?php echo number_format($product->price) ?>VNĐ</p>
                    <?php else: ?>
                        <p class="price"><?php echo number_format($product->price) ?>VNĐ</p>
                    <?php endif; ?>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th colspan="2">Thông số kỹ thuật</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Màn hình</td>
                            <td><?php echo $product->screen ?></td>
                        </tr>
                        <tr>
                            <td>Hệ điều hành</td>
                            <td><?php echo $product->screen ?></td>
                        </tr>
                        <tr>
                            <td>Camare sau</td>
                            <td><?php echo $product->back_cam ?></td>
                        </tr>
                        <tr>
                            <td>Camare trước</td>
                            <td><?php echo $product->front_cam ?></td>
                        </tr>
                        <tr>
                            <td>CPU</td>
                            <td><?php echo $product->cpu ?></td>
                        </tr>
                        <tr>
                            <td>RAM</td>
                            <td><?php echo $product->ram ?></td>
                        </tr>
                        <tr>
                            <td>Bộ nhớ</td>
                            <td><?php echo $product->memory ?></td>
                        </tr>
                        <tr>
                            <td>Pin</td>
                            <td><?php echo $product->pin ?></td>
                        </tr>
                        <tr>
                            <td>SIM</td>
                            <td><?php echo $product->sim ?></td>
                        </tr>
                        </tbody>
                    </table>
                    <a href="#" class="btn btn-primary">Thêm vào giỏ</a>
                </div>
            </div>

            <!-- description -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#intro" data-toggle="tab" aria-expanded="true">Giới thiệu</a></li>
                <li class=""><a href="#system" data-toggle="tab" aria-expanded="false">Cấu hình</a></li>
                <li class=""><a href="#design" data-toggle="tab" aria-expanded="false">Thiết kế</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade active in" id="intro">
                    <?php echo $product->content ?>
                </div>
                <div class="tab-pane fade" id="system">
                    <p>Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco
                        ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>
                </div>
                <div class="tab-pane fade" id="design">
                    <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee.
                        Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>
                </div>
            </div>
            <!-- the end of description -->
        </div>
    </div>
    <!-- the end of product details -->

</div>
<!-- the end of right -->