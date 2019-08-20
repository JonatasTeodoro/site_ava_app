<%@page import="UTIL.ManipulaDatas"%>
<%@page import="MODEL.Usuario"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Recuperar senha</title>


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

        <!--Upload foto -->
        <link rel="stylesheet" href="js/recorte-foto/cropper.css">



    </head>



    <body>

        <input type="hidden" id="mensagem" name="mensagem" value="${mensagem}">

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div style="margin-top: 30px">
                        <center><h4>Recuperação de senha</h4></center>
                    </div>
                    <form id="formEditarUsuario" method="POST" onsubmit="return validarRecuperacao()" action="EnviarEmailRecuperarSenhaUsuario" accept-charset="iso-8859-1" style="padding-top: 0" class="login100-form validate-form">
                        <div class="wrap-input100 validate-input m-b-26" data-validate="Nome obrigatório">
                            <span class="label-input100">E-mail</span>
                            <input autocomplete="off" class="input100" type="email" name="email" id="email" placeholder="E-mail">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="col-md-12">
                            <center>
                                <div class="col-md-8">
                                    <button id="btnSubmit" type="submit" class="btn btn-success btn-block">Recuperar</button>
                                    <a href="index.jsp"><button style="margin-top: 3px" type="button" class="btn btn-info btn-block"><i class="fa fa-undo"></i> Voltar</button></a>
                                </div>
                            </center>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            var msg = document.getElementById("mensagem").value;
            if (msg != "" && msg != null) {
                alert(msg);
            }
        </script>

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

        <script src="js/validar_recuperacao_senha.js"></script>

        <script src="js/recorte-foto/cropper.js"></script>
        <script src="js/recorte-foto-usuario.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
    </body>

</html>