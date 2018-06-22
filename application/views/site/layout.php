<html>
    <head>
        <?php $this->load->view('site/head'); ?>
    </head>

    <body>
        <div class="wrapper">
<!--            navigation bar-->
            <?php
                $this->load->view('site/navbar', $this->data);
            ?>
<!--            content-->
            <div class="container">
                <?php
                    $this->load->view('site/left', $this->data);
                    $this->load->view($temp, $this->data);
                ?>
            </div>
<!--            footer-->
            <?php
                $this->load->view('site/footer', $this->data);
            ?>
        </div>
    </body>

</html>