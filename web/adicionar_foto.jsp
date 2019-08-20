<%@page import="MODEL.Usuario"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>AVA Modelismo</title>


        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/barra.png"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">

        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/styles.css">

        <style type="text/css">
            #upload_btn:hover{
                background-color: gray;
                cursor: pointer;
            }

            #upload_btn{
                background-color: #050366;
            }

            #divImagem:active{
                color: black;
            }

            .menu:hover{
                font-size: 45px;
                color: red; 
            }

            .menu:active{
                color: black;
            }

            .fa{
                font-size: 40px; 
                color: #050366; 
                margin: 10px
            }

            textarea {
                border: 3px solid #0000009e;
            }

            #upload_file{width:0.1px;height:0.1px;opacity:0;overflow:hidden;position:absolute;z-index:-1;}

        </style>



    </head>

    <body style="background-image: url(https://www.dnoticias.pt/binrepository/768x433/0c1/768d432/none/11506/HORF/image_content_2211031_20190514083935.jpg); background-size: cover">

        <form method="post" accept-charset="iso-8859-1" enctype="multipart/form-data">
            <input type="file" id="upload_file" name="upload_file" accept="image/*" />

            <div id="divImagem" class="col-md-12" style=" padding-top: 10px; background-color: #0000009e">
                <center>

                    <label id="upload_btn" for="upload_file" style="color: white; font-size: 20px; padding: 10px; border-radius: 10px"><i style="color: white; font-size: 20px" class="fa fa-camera-retro"></i> Carregar imagem</label>
                    <br/>
                    <img style="margin-bottom: 4px" id="preview" width="50%" />
                </center>
            </div>
            <div style="margin-top: 30px" class="col-md-12">
                <center>
                    <textarea maxlength="150" style="width: 100%; margin-bottom: 90px" placeholder="Deixa aqui sua mensagem..." id="comentario" name="comentario" rows="3"></textarea>
                </center>
            </div>
            <nav style="background-color: #f5f5f5" class="navbar navbar-light navbar-expand fixed-bottom">
                <div class="collapse navbar-collapse" id="navcol-1" style="height: 80px">
                    <ul class="nav navbar-nav mx-auto">
                        <li class="nav-item animated fadeInLeftBig" role="presentation"><a class="nav-link" href="pagina_principal.jsp"><i class="fa fa-undo menu"></i></a></li>
                        <li class="nav-item animated fadeInLeftBig" role="presentation"><a id="btnUpload" class="nav-link" onclick="uploadImagem()"><i class="fa fa-send menu"></i></a></li>
                    </ul>
                </div>
            </nav>
        </form>

        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>

        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
        <script src="js/upload.js?version=2"></script>


        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>

        <script type="text/javascript">
                            function readURL(input) {
                                if (input.files && input.files[0]) {
                                    var reader = new FileReader();

                                    reader.onload = function (e) {
                                        $('#preview').attr('src', e.target.result);
                                    }

                                    reader.readAsDataURL(input.files[0]);
                                }
                            }

                            $("#upload_file").change(function () {
                                readURL(this);
                            });
        </script>



    </body>

</html>