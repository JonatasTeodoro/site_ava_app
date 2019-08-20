<%@page import="UTIL.ManipulaDatas"%>
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

        <!--Upload foto -->
        <link rel="stylesheet" href="js/recorte-foto/cropper.css">

        <style type="text/css">
            i:hover{
                font-size: 45px;
                color: red; 
            }

            i:active{
                color: black;
            }

            .fa{
                font-size: 40px; 
                color: #050366; 
                margin: 10px
            }

        </style>



    </head>



    <body>

        <%
            Usuario usuario = (Usuario) session.getAttribute("autenticado");

            if (usuario == null || usuario.getId() == 0) {
                response.sendRedirect("index.jsp");
                usuario = new Usuario();
            }

        %>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div style="margin-top: 30px">
                        <center><h4>Editar Senha</h4></center>
                    </div>

                    <form id="formAlterarSenha" method="POST" onsubmit="return validarTrocaDeSenha()" action="AlterarSenhaUsuario" accept-charset="iso-8859-1" style="padding-top: 0" class="login100-form validate-form">

                        <input type="hidden" id="id_usuario" name="id_usuario" value="<%=usuario.getId()%>">

                        <div style="margin-bottom: 40px" class="wrap-input100 validate-input m-b-26" data-validate="E-mail obrigatório">
                            <span class="label-input100">Senha atual</span>
                            <input autocomplete="off" class="input100" type="password" name="atual" id="atual" placeholder="Senha atual">
                            <span class="focus-input100"></span>
                        </div> 

                        <div style="margin-bottom: 40px" class="wrap-input100 validate-input m-b-26" data-validate="E-mail obrigatório">
                            <span class="label-input100">Nova senha</span>
                            <input autocomplete="off" class="input100" type="password" name="nova" id="nova" placeholder="Nova senha">
                            <span class="focus-input100"></span>
                        </div> 

                        <div style="margin-bottom: 40px" class="wrap-input100 validate-input m-b-26" data-validate="E-mail obrigatório">
                            <span class="label-input100">Repetir</span>
                            <input autocomplete="off" class="input100" type="password" name="repete" id="repete" placeholder="Repetir senha">
                            <span class="focus-input100"></span>
                        </div> 

                        <nav style="background-color: #f5f5f5" class="navbar navbar-light navbar-expand fixed-bottom">
                            <div class="collapse navbar-collapse" id="navcol-1" style="height: 80px">
                                <ul class="nav navbar-nav mx-auto">
                                    <li class="nav-item animated fadeInLeftBig" role="presentation"><a class="nav-link" href="editar_cadastro.jsp"><i class="fa fa-undo"></i></a></li>
                                    <li class="nav-item animated fadeInLeftBig" role="presentation" onclick="validarTrocaDeSenha()"><a class="nav-link" ><i class="fa fa-save"></i></a></li>
                                </ul>
                            </div>
                        </nav>

                    </form>
                </div>
            </div>
        </div>


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

        <script src="js/valida_troca_senha.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
    </body>

</html>