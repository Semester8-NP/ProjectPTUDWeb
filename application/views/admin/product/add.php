<!--load file head.php-->
<?php $this->load->view('admin/product/head', $this->data); ?>

<div class="line"></div>

<script type="text/javascript">
    (function($)
    {
        $(document).ready(function()
        {
            var main = $('#form');

            // Tabs
            main.contentTabs();
        });
    })(jQuery);
</script>

<!-- Main content wrapper -->
<div class="wrapper">

    <!-- Form -->
    <form class="form" id="form" action="<?php echo admin_url('product/add') ?>" method="post" enctype="multipart/form-data">
        <fieldset>
            <div class="widget">
                <div class="title">
                    <img src="<?php echo assets_url('admin/') ?>images/icons/dark/add.png" class="titleIcon" />
                    <h6>Thêm mới Sản phẩm</h6>
                </div>

                <ul class="tabs">
                    <li><a href="#tab1">Thông tin chung</a></li>
                    <li><a href="#tab2">Bài viết</a></li>
                    <li><a href="#tab3">Thông số kỹ thuật</a></li>

                </ul>

                <div class="tab_container">
                    <div id='tab1' class="tab_content pd0">
                        <div class="formRow">
                            <label class="formLeft" for="param_name">Tên:<span class="req">*</span></label>
                            <div class="formRight">
                                <span class="oneTwo">
                                    <input name="name" id="param_name" _autocheck="true" type="text" />
                                </span>
                                <span name="name_autocheck" class="autocheck"></span>
                                <div name="name_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>

                        <div class="formRow">
                            <label class="formLeft">Hình ảnh:<span class="req">*</span></label>
                            <div class="formRight">
                                <div class="left">
                                    <input type="file"  id="image" name="image"  >
                                </div>
                                <div name="image_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>

                        <div class="formRow">
                            <label class="formLeft">Ảnh kèm theo:</label>
                            <div class="formRight">
                                <div class="left">
                                    <input type="file"  id="image_list" name="image_list[]" multiple>
                                </div>
                                <div name="image_list_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>

                        <!-- Price -->
                        <div class="formRow">
                            <label class="formLeft" for="param_price">
                                Giá :
                                <span class="req">*</span>
                            </label>
                            <div class="formRight">
		<span class="oneTwo">
			<input name="price"  style='width:100px' id="param_price" class="format_number" _autocheck="true" type="text" />
			<img class='tipS' title='Giá bán sử dụng để giao dịch' style='margin-bottom:-8px'  src='<?php echo assets_url('admin/') ?>crown/images/icons/notifications/information.png'/>
		</span>
                                <span name="price_autocheck" class="autocheck"></span>
                                <div name="price_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>

                        <!-- Price -->
                        <div class="formRow">
                            <label class="formLeft" for="param_discount">
                                Giảm giá (VNĐ)
                                <span></span>:
                            </label>
                            <div class="formRight">
		<span>
			<input name="discount"  style='width:100px' id="param_discount" class="format_number"  type="text" />
			<img class='tipS' title='Phần trăm giảm giá' style='margin-bottom:-8px'  src='<?php echo assets_url('admin/') ?>crown/images/icons/notifications/information.png'/>
		</span>
                                <span name="discount_autocheck" class="autocheck"></span>
                                <div name="discount_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>


                        <div class="formRow">
                            <label class="formLeft" for="param_cat">Thể loại:<span class="req">*</span></label>
                            <div class="formRight">
                                <select name="catalog_id" class="left">
                                    <option value=""></option>
                                    <!-- kiem tra danh muc co danh muc con hay khong -->
                                    <?php foreach ($catalog as $row): ?>
                                        <?php if ($row->sub>1): ?>
                                            <optgroup label="<?php echo $row->name ?>">
                                                <?php foreach ($row->sub as $sub): ?>
                                                    <option value="<?php echo $sub->id ?>" >
                                                        <?php echo $sub->name ?>
                                                    </option>
                                                <?php endforeach; ?>
                                            </optgroup>
                                        <?php else: ?>
                                            <option value="<?php echo $row->id ?>" >
                                                <?php echo $row->name ?>
                                            </option>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                </select>
                                <span name="cat_autocheck" class="autocheck"></span>
                                <div name="cat_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>


                        <!-- warranty -->
                        <div class="formRow">
                            <label class="formLeft" for="param_warranty">
                                Bảo hành :
                            </label>
                            <div class="formRight">
                                <span class="oneFour">
                                    <input name="warranty" id="param_warranty"  type="text" />
                                </span>
                                <span name="warranty_autocheck" class="autocheck"></span>
                                <div name="warranty_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>

                        <div class="formRow">
                            <label class="formLeft" for="param_sale">Tặng quà:</label>
                            <div class="formRight">
                                <span class="oneTwo">
                                    <textarea name="gifts" id="param_gifts" rows="4" cols=""></textarea
                                </span>
                                <span name="sale_autocheck" class="autocheck"></span>
                                <div name="sale_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>					         <div class="formRow hide"></div>
                    </div>


                    <div id='tab2' class="tab_content pd0">
                        <div class="formRow">
                            <label class="formLeft">Nội dung:</label>
                            <div class="formRight">
                                <textarea name="content" id="param_content" class="editor"></textarea>
                                <div name="content_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="formRow hide"></div>
                    </div>

                    <div id='tab3' class="tab_content pd0">
                        <div class="formRow">
                            <label class="formLeft" for="param_screen">Màn hình:</label>
                            <div class="formRight">
                                <span class="oneTwo">
                                    <input name="screen" id="param_screen" _autocheck="true" type="text" />
                                </span>
                                <span name="screen_autocheck" class="autocheck"></span>
                                <div name="screen_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="formRow">
                            <label class="formLeft" for="param_os">Hệ điều hành:</label>
                            <div class="formRight">
                                <span class="oneTwo">
                                    <input name="os" id="param_os" _autocheck="true" type="text" />
                                </span>
                                <span name="os_autocheck" class="autocheck"></span>
                                <div name="os_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="formRow">
                            <label class="formLeft" for="param_back_cam">Camera sau:</label>
                            <div class="formRight">
                                <span class="oneTwo">
                                    <input name="back_cam" id="param_back_cam" _autocheck="true" type="text" />
                                </span>
                                <span name="back_cam_autocheck" class="autocheck"></span>
                                <div name="back_cam_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="formRow">
                            <label class="formLeft" for="param_front_cam">Camera trước:</label>
                            <div class="formRight">
                                <span class="oneTwo">
                                    <input name="front_cam" id="param_front_cam" _autocheck="true" type="text" />
                                </span>
                                <span name="front_cam_autocheck" class="autocheck"></span>
                                <div name="front_cam_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="formRow">
                            <label class="formLeft" for="param_cpu">CPU:</label>
                            <div class="formRight">
                                <span class="oneTwo">
                                    <input name="cpu" id="param_cpu" _autocheck="true" type="text" />
                                </span>
                                <span name="cpu_autocheck" class="autocheck"></span>
                                <div name="cpu_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="formRow">
                            <label class="formLeft" for="param_ram">RAM:</label>
                            <div class="formRight">
                                <span class="oneTwo">
                                    <input name="ram" id="param_ram" _autocheck="true" type="text" />
                                </span>
                                <span name="ram_autocheck" class="autocheck"></span>
                                <div name="ram_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="formRow">
                            <label class="formLeft" for="param_memory">Bộ nhớ:</label>
                            <div class="formRight">
                                <span class="oneTwo">
                                    <input name="memory" id="param_memory" _autocheck="true" type="text" />
                                </span>
                                <span name="memory_autocheck" class="autocheck"></span>
                                <div name="memory_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="formRow">
                            <label class="formLeft" for="param_pin">Dung lượng pin:</label>
                            <div class="formRight">
                                <span class="oneTwo">
                                    <input name="pin" id="param_pin" _autocheck="true" type="text" />
                                </span>
                                <span name="pin_autocheck" class="autocheck"></span>
                                <div name="pin_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="formRow">
                            <label class="formLeft" for="param_sim">Thẻ SIM:</label>
                            <div class="formRight">
                                <span class="oneTwo">
                                    <input name="sim" id="param_sim" _autocheck="true" type="text" />
                                </span>
                                <span name="sim_autocheck" class="autocheck"></span>
                                <div name="sim_error" class="clear error"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>

                </div><!-- End tab_container-->

                <div class="formSubmit">
                    <input type="submit" value="Thêm mới" class="redB" />
                    <input type="reset" value="Hủy bỏ" class="basic" />
                </div>
                <div class="clear"></div>
            </div>
        </fieldset>
    </form>
</div>
<div class="clear mt30"></div>
