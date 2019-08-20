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

        <input type="hidden" id="mensagem" name="mensagem" value="${mensagem}">

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div style="margin-top: 30px">
                        <center><h4>Editar cadastro</h4></center>
                    </div>



                    <div class="form-group" style="margin-top: 30px">

                        <section class="panel" style="margin: 0">
                            <div class="thumb-info mb-md">
                                <center>
                                    <label class="label" data-toggle="tooltip" title="Coloque sua foto">
                                        <%if (usuario.getImagemPerfil().equals("")) {%>
                                        <img onmousemove="document.getElementById('avatar').style.cursor = 'pointer'" style="height: 210px; border-radius: 360px" class="img-responsive" id="avatar" src="images/Untitled - 1.jpg" alt="avatar">
                                        <%} else {%>
                                        <img onmousemove="document.getElementById('avatar').style.cursor = 'pointer'" style="height: 210px; border-radius: 360px" class="img-responsive" id="avatar" src="Documentos/avatar/<%=usuario.getImagemPerfil()%>" alt="avatar">
                                        <%}%>
                                        <input type="file" class="sr-only" id="input" name="image" accept="image/*">

                                    </label>
                                </center>

                                <!--<img src="assets/images/Untitled - 1.jpg" class="rounded img-responsive" alt="John Doe">-->
                            </div>


                            <div class="alert" role="alert"></div>
                            <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                                <div  class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="img-container">
                                                <center>
                                                    <img class="img-responsive" id="image">
                                                </center>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                            <button type="button" class="btn btn-primary" id="crop">Cortar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                    <form id="formEditarUsuario" method="POST" onsubmit="return false" action="EditarUsuario" accept-charset="iso-8859-1" style="padding-top: 0" class="login100-form validate-form">
                        <input type="hidden" id="64imagem" name="64imagem">
                        <input type="hidden" id="emailAtual" name="emailAtual" value="<%=usuario.getEmail()%>">
                        <input type="hidden" id="idUsuario" name="idUsuario" value="<%=usuario.getId()%>">
                        <div class="wrap-input100 validate-input m-b-26" data-validate="Nome obrigatório">
                            <span class="label-input100">Nome</span>
                            <input autocomplete="off" class="input100" value="<%=usuario.getNome()%>" type="text" name="nome" id="nome" placeholder="Nome completo">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-26" data-validate="Cidade obrigatória">
                            <span class="label-input100">Cidade</span>
                            <input value="<%=usuario.getCidade()%>" inputmode="text" autocomplete="off" class="input100" type="text" name="cidade" id="cidade" placeholder="Cidade">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-26" data-validate="CPF obrigatório">
                            <span class="label-input100">Telefone</span>
                            <input inputmode="numeric"  value="<%=usuario.getTelefone()%>" autocomplete="off" class="input100" type="text" name="telefone" id="telefone" placeholder="Entre com seu Telefone">
                            <span class="focus-input100"></span>
                        </div>

                        <div style="margin-bottom: 40px" class="wrap-input100 validate-input m-b-26" data-validate="E-mail obrigatório">
                            <span class="label-input100">Email</span>
                            <input autocomplete="off" value="<%=usuario.getEmail()%>" class="input100" type="email" name="email" id="email" placeholder="Entre com seu e-mail">
                            <span class="focus-input100"></span>
                        </div> 

                        <nav style="background-color: #f5f5f5" class="navbar navbar-light navbar-expand fixed-bottom">
                            <div class="collapse navbar-collapse" id="navcol-1" style="height: 80px">
                                <ul class="nav navbar-nav mx-auto">
                                    <li class="nav-item animated fadeInLeftBig" role="presentation"><a id="btnVoltar" class="nav-link" href="pagina_principal.jsp"><i class="fa fa-undo"></i></a></li>
                                    <li class="nav-item animated fadeInLeftBig" role="presentation"><a id="btnSalvar" class="nav-link" onclick="validarEditarCadastro()" ><i class="fa fa-save"></i></a></li>
                                    <li class="nav-item animated fadeInLeftBig" role="presentation"><a id="btnSenha" class="nav-link" href="editar_senha.jsp"><i class="fa fa-key"></i></a></li>
                                </ul>
                            </div>
                        </nav>

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

        <script src="js/valida_editar_cadastro.js?version=2"></script>

        <script src="js/recorte-foto/cropper.js"></script>
        <script src="js/recorte-foto-usuario.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
    </body>

</html>