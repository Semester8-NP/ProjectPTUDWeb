<html>
    <head>
        <?php $this->load->view('site/head'); ?>
    </head>

    <body>
        <?php
            $this->load->view('site/header');
            $this->load->view('site/navbar');
            $this->load->view($temp);
            $this->load->view('site/footer');
        ?>
    </body>

</html>