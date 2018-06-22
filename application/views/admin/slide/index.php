<!--load file head.php-->
<?php $this->load->view('admin/slide/head', $this->data); ?>

<div class="line"></div>

<div class="wrapper" id="main_slide">
    <?php $this->load->view('admin/message', $this->data); ?>
    <div class="widget">

        <div class="title">
            <h6>
                Danh sách slide			</h6>
            <div class="num f12">Số lượng: <b><?php echo $total_rows ?></b></div>
        </div>

        <table cellpadding="0" cellspacing="0" width="100%" class="sTable mTable myTable" id="checkAll">

            <thead>
            <tr>
                <td style="width:60px;">Mã số</td>
                <td>Slide</td>
                <td>Tiêu đề</td>
                <td style="width:75px;">Thứ tự</td>
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
                            <img src="<?php echo base_url('upload/slide/'.$row->image_link); ?>" height="50">
                            <div class="clear"></div>
                        </div>
                    </td>

                    <td>
                        <a href="slide/view/9.html" class="tipS" title="" target="_blank">
                            <b><?php echo $row->name ?></b>
                        </a>
                    </td>

                    <td><?php echo $row->sort_order ?></td>

                    <td class="option textC">
                        <a  href="<?php echo $row->link ?>" target='_blank' class='tipS' title="Xem chi tiết slide">
                            <img src="<?php echo assets_url('admin/') ?>images/icons/color/view.png" />
                        </a>
                        <a href="<?php echo admin_url('slide/edit/'.$row->id) ?>" title="Chỉnh sửa" class="tipS">
                            <img src="<?php echo assets_url('admin/') ?>images/icons/color/edit.png" />
                        </a>

                        <a href="<?php echo admin_url('slide/delete/'.$row->id) ?>" title="Xóa" class="tipS verify_action" >
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