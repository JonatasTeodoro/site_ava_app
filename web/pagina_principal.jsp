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

    <body style="background-image: url(https://www.dnoticias.pt/binrepository/768x433/0c1/768d432/none/11506/HORF/image_content_2211031_20190514083935.jpg); background-size: cover">

        <%
            Usuario usuario = (Usuario) session.getAttribute("autenticado");

            if (usuario == null || usuario.getId() == 0) {
                response.sendRedirect("index.jsp");
                usuario = new Usuario();
            }


        %>

        <input type="hidden" id="url_imagem_perfil" value="<%=usuario.getImagemPerfil()%>">

        <div style="padding-top: 10px" class="col-md-12">
            <center><div class="col-md-6 animated fadeInDownBig">
                    <img width="100%" src="images/Logotipo.png">
                    <h1 style="margin-top: 20px; font-family: monospace"><b>BEM-VINDO <%=usuario.getNome().split(" ")[0]%>!</b></h1>
                </div></center>
            <div>
                <center>
                    <%if (!usuario.getImagemPerfil().equals("")) {%>
                    <img style="height: 150px; border-radius: 360px; display: block" class="img-responsive animated fadeInDownBig" id="imgPerfilUsuario" src="Documentos/avatar/<%=usuario.getImagemPerfil()%>" alt="avatar">
                    <img style="height: 50px; border-radius: 360px; display: none" class="img-responsive animated fadeInDownBig" id="imgTempUsuario" src="images/Carregando_imagem.gif" alt="avatar">
                    <%}%>
                </center>
            </div>
        </div>
                
        <nav style="background-color: #f5f5f5" class="navbar navbar-light navbar-expand fixed-bottom">
            <div class="collapse navbar-collapse" id="navcol-1" style="height: 80px">
                <ul class="nav navbar-nav mx-auto">
                    <li class="nav-item animated fadeInLeftBig" role="presentation"><a class="nav-link" href="adicionar_foto.jsp"><i class="fa fa-camera-retro"></i></a></li>
                    <li class="nav-item animated fadeInLeftBig" role="presentation"><a class="nav-link" href="opcoes_fila.jsp"><i class="fa fa-plane"></i></a></li>
                    <li class="nav-item animated fadeInLeftBig" role="presentation"><a class="nav-link" href="editar_cadastro.jsp"><i class="fa fa-user"></i></a></li>
                    <li class="nav-item animated fadeInLeftBig" role="presentation"><a class="nav-link" href="EncerrarSessao"><i class="fa fa-sign-out-alt"></i></a></li>
                </ul>
            </div>
        </nav>

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
        <script src="js/carrega_foto_perfil.js"></script>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
    </body>

</html>