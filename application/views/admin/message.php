<?php if(isset($message) && $message):?>
    <div class="nNote nInformation hideit">
        <p><strong>Thông báo: </strong><?php echo $message?></p>
    </div>
<?php endif;?>

<?php if(isset($F_message) && $F_message):?>
    <div class="nNote nFailure hideit">
        <p><strong>Thông báo: </strong><?php echo $F_message?></p>
    </div>
<?php endif;?>
