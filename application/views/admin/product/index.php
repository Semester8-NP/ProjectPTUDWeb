<!--load file head.php-->
<?php $this->load->view('admin/product/head', $this->data); ?>

<div class="line"></div>

<div class="wrapper" id="main_product">
    <?php $this->load->view('admin/message', $this->data); ?>
    <div class="widget">

        <div class="title">
            <h6>
                Danh sách sản phẩm			</h6>
            <div class="num f12">Số lượng: <b><?php echo $total_rows ?></b></div>
        </div>

        <table cellpadding="0" cellspacing="0" width="100%" class="sTable mTable myTable" id="checkAll">

            <thead class="filter"><tr><td colspan="6">
                    <form class="list_filter form" action="<?php admin_url('product') ?>" method="get">
                        <table cellpadding="0" cellspacing="0" width="80%"><tbody>

                            <tr>
                                <td class="label" style="width:40px;"><label for="filter_id">Mã số</label></td>
                                <td class="item"><input name="id" value="<?php echo $this->input->get('id'); ?>" id="filter_id" type="text" style="width:55px;" /></td>

                                <td class="label" style="width:40px;"><label for="filter_id">Tên</label></td>
                                <td class="item" style="width:155px;" ><input name="name" value="<?php echo $this->input->get('name'); ?>" id="filter_iname" type="text" style="width:155px;" /></td>

                                <td class="label" style="width:60px;"><label for="filter_status">Thể loại</label></td>
                                <td class="item">
                                    <select name="catalog">
                                        <option value=""></option>
                                        <!-- kiem tra danh muc co danh muc con hay khong -->
                                        <?php foreach ($catalog as $row): ?>
                                        <?php if ($row->sub>1): ?>
                                        <optgroup label="<?php echo $row->name ?>">
                                            <?php foreach ($row->sub as $sub): ?>
                                            <option value="<?php echo $sub->id ?>" <?php echo ($this->input->get('catalog_id') == $sub->id)?'selected':''; ?> >
                                                <?php echo $sub->name ?>
                                            </option>
                                            <?php endforeach; ?>
                                        </optgroup>
                                        <?php else: ?>
                                            <option value="<?php echo $row->id ?>" <?php echo ($this->input->get('catalog_id') == $sub->id)?'selected':''; ?> >
                                                <?php echo $row->name ?>
                                            </option>
                                        <?php endif; ?>
                                        <?php endforeach; ?>
                                    </select>
                                </td>

                                <td style='width:150px'>
                                    <input type="submit" class="button blueB" value="Lọc" />
                                    <input type="reset" class="basic" value="Reset" onclick="window.location.href = '<?php admin_url('product'); ?>'; ">
                                </td>

                            </tr>
                            </tbody></table>
                    </form>
                </td></tr></thead>

            <thead>
            <tr>
                <td style="width:60px;">Mã số</td>
                <td>Tên</td>
                <td>Giá</td>
                <td style="width:75px;">Ngày tạo</td>
                <td style="width:120px;">Hành động</td>
            </tr>
            </thead>

            <tbody class="list_item">
                <?php foreach ($list as $row): ?>
                <tr class='row_<?php echo $row->id; ?>'>

                    <td class="textC">
                        <?php echo $row->id ?>
                    </td>

                    <td>
                        <div class="image_thumb">
                            <img src="<?php echo base_url('upload/product/'.$row->image_link); ?>" height="50">
                            <div class="clear"></div>
                        </div>

                        <a href="product/view/9.html" class="tipS" title="" target="_blank">
                            <b><?php echo $row->name ?></b>
                        </a>

                        <div class="f11" >
                            Đã bán: <?php echo $row->buyed ?>					  | Xem: <?php echo $row->view ?>					</div>

                    </td>

                    <td class="textR">
                        <?php if ($row->discount > 0): ?>
                        <?php $new_price = $row->price - $row->discount; ?>
                        <b style="color: #9a161a"><?php echo number_format($new_price); ?>VNĐ</b>
                        <p style="text-decoration:line-through"><?php echo number_format($row->price) ?>VNĐ</p>
                        <?php else: ?>
                        <p style="color: #9a161a"><?php echo number_format($row->price) ?>VNĐ</p>
                        <?php endif; ?>
                    </td>


                    <td class="textC">
                        <?php echo get_date($row->created) ?>
                    </td>

                    <td class="option textC">
                        <a  href="product/view/9.html" target='_blank' class='tipS' title="Xem chi tiết sản phẩm">
                            <img src="<?php echo assets_url('admin/') ?>images/icons/color/view.png" />
                        </a>
                        <a href="<?php echo admin_url('product/edit/'.$row->id) ?>" title="Chỉnh sửa" class="tipS">
                            <img src="<?php echo assets_url('admin/') ?>images/icons/color/edit.png" />
                        </a>

                        <a href="<?php echo admin_url('product/delete/'.$row->id) ?>" title="Xóa" class="tipS verify_action" >
                            <img src="<?php echo assets_url('admin/') ?>images/icons/color/delete.png" />
                        </a>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>

        </table>
    </div>

</div>

<div class="clear mt30"></div>