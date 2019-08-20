<!DOCTYPE html>
<html lang="en">
    <head>
        <title>AVA Modelismo</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <!--===============================================================================================-->

    </head>
    <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-form-title" style="background-image: url(images/banner_index.jpg);">
                    </div>

                    <form action="EfetuarLogin" onsubmit="return verificarLoginSenha()" method="POST" accept-charset="iso-8859-1" class="login100-form validate-form">
                        <div class="wrap-input100 validate-input m-b-26" data-validate="E-mail requerido">
                            <span class="label-input100">E-mail</span>
                            <input autocomplete="off" class="input100" type="email" name="usuario" id="usuario" placeholder="Entre com seu e-mail">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-18" data-validate = "Senha requerida">
                            <span class="label-input100">Senha</span>
                            <input autocomplete="off" class="input100" type="password" name="senha" id="senha" placeholder="Entre com sua senha">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="flex-sb-m w-full p-b-30">

                            <div>
                                <a href="recuperar_senha.jsp" class="txt1">
                                    Esqueceu sua senha?
                                </a>
                            </div>
                        </div>

                        <div class="container-login100-form-btn">
                            <div class="col-md-12">
                                <center>
                                    <div class="col-md-12">
                                        <button id="btnLogar" style="margin: 3px" class="btn btn-success btnEntrar btn-block">
                                            <i class="fa fa-sign-in-alt"></i> Entrar
                                        </button>
                                    </div>
                                    <div class="col-md-12">
                                        <a href="novo_cadastro.jsp"><button type="button" style="margin: 3px" class="btn btn-info btn-block">
                                                <i class="fa fa-plane"></i> Cadastrar
                                            </button></a>
                                    </div>
                                </center>
                            </div>

                        </div>

                    </form>
                </div>
            </div>
        </div>

        <!--===============================================================================================-->
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
        <script src="js/validar_login.js"></script>

    </body>
</html>