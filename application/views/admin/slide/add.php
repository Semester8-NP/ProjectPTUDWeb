<!--load file head.php-->
<?php $this->load->view('admin/slide/head', $this->data); ?>

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
    <form class="form" id="form" action="<?php echo admin_url('slide/add') ?>" method="post" enctype="multipart/form-data">
        <fieldset>
            <div class="formRow">
                <label class="formLeft" for="param_name">Tên:<span class="req">*</span></label>
                <div class="formRight">
                        <span class="oneTwo">
                            <input name="name" id="param_name" _autocheck="true" type="text" />
                        </span>
                    <span name="name_autocheck" class="autocheck"></span>
                    <div name="name_error" class="clear error">

                    </div>
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
                <label class="formLeft" for="param_name">Mô tả:</label>
                <div class="formRight">
                        <span class="oneTwo">
                            <input name="info" id="param_info" _autocheck="true" type="text" />
                        </span>
                    <span name="info_autocheck" class="autocheck"></span>
                    <div name="info_error" class="clear error">

                    </div>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <label class="formLeft" for="param_name">Link:</label>
                <div class="formRight">
                        <span class="oneTwo">
                            <input name="link" id="param_link" _autocheck="true" type="text" />
                        </span>
                    <span name="sort_order_autocheck" class="autocheck"></span>
                    <div name="sort_order_error" class="clear error">

                    </div>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formRow">
                <label class="formLeft" for="param_name">Thứ tự hiển thị:</label>
                <div class="formRight">
                        <span class="oneTwo">
                            <input name="sort_order" id="param_sort_order" _autocheck="true" type="text" />
                        </span>
                    <span name="sort_order_autocheck" class="autocheck"></span>
                    <div name="sort_order_error" class="clear error">

                    </div>
                </div>
                <div class="clear"></div>
            </div>

            <div class="formSubmit">
                <input type="submit" value="Thêm mới" class="redB" />
                <input type="reset" value="Hủy bỏ" class="basic" />
            </div>
        </fieldset>
    </form>
</div>
<div class="clear mt30"></div>
