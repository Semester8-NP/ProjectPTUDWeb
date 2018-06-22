<!-- advertise slide -->
<div id="carousel-id" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carousel-id" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-id" data-slide-to="1" class=""></li>
        <li data-target="#carousel-id" data-slide-to="2" class=""></li>
    </ol>
    <div class="carousel-inner">
        <?php foreach ($slide_list as $row): ?>
        <div class="item <?php echo ($row->sort_order == '1')?'active':''; ?>">
            <a href="<?php echo $row->link ?>">
                <img alt="<?php echo $row->name ?>" src="<?php echo base_url('upload/slide/').$row->image_link ?> " class="slide-size">
            </a>
        </div>
        <?php endforeach; ?>
    </div>
    <a class="left carousel-control" href="#carousel-id" data-slide="prev"></a>
    <a class="right carousel-control" href="#carousel-id" data-slide="next"></a>
</div>
<!-- the end of advertise slide -->