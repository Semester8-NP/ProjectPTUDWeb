<html>
    <head>
        <?php $this->load->view('site/head'); ?>
    </head>

    <body>
        <div class="wrapper">
<!--            navigation bar-->
            <?php
                $this->load->view('site/navbar');
            ?>
<!--            content-->
            <div class="container">
                <?php
                    $this->load->view('site/left');
                    $this->load->view($temp);
                ?>
            </div>
<!--            footer-->
            <?php
                $this->load->view('site/footer');
            ?>
        </div>
    </body>

</html>