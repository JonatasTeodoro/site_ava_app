<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Novo cadastro</title>
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
        <!--Upload foto -->
        <link rel="stylesheet" href="js/recorte-foto/cropper.css">

    </head>
    <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-form-title" style="background-image: url(images/banner_index.jpg);">
                    </div>

                    <div style="margin-top: 30px">
                        <center><h2>Seja bem-vindo piloto!</h2></center>
                    </div>

                    <div style="margin-top: 30px">
                        <center><h4>Novo cadastro</h4></center>
                    </div>



                    <div class="form-group" style="margin-top: 30px">

                        <section class="panel" style="margin: 0">
                            <div class="thumb-info mb-md">
                                <label class="label" data-toggle="tooltip" title="Coloque sua foto">
                                    <center>
                                        <img onmousemove="document.getElementById('avatar').style.cursor = 'pointer'" style="height: 210px; border-radius: 360px" class="img-responsive" id="avatar" src="images/Untitled - 1.jpg" alt="avatar">
                                        <input type="file" class="sr-only" id="input" name="image" accept="image/*">
                                    </center>
                                </label>

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
                    <form id="formNovoUsuario" method="POST" onsubmit="return validarNovoCadastro()" action="CadastrarNovoUsuario" accept-charset="iso-8859-1" style="padding-top: 0" class="login100-form validate-form">
                        <input type="hidden" id="64imagem" name="64imagem">
                        <div class="wrap-input100 validate-input m-b-26" data-validate="Nome obrigatório">
                            <span class="label-input100">Nome</span>
                            <input autocomplete="off" class="input100" type="text" name="nome" id="nome" placeholder="Nome completo">
                            <span class="focus-input100"></span>
                        </div>


                        <div class="wrap-input100 validate-input m-b-26" data-validate="Telefone obrigatório">
                            <span class="label-input100">Telefone</span>
                            <input inputmode="numeric" autocomplete="off" class="input100" type="text" name="telefone" id="telefone" placeholder="Entre com seu Telefone">
                            <span class="focus-input100"></span>
                        </div>
                        
                        <div class="wrap-input100 validate-input m-b-26" data-validate="Cidade obrigatória">
                            <span class="label-input100">Cidade</span>
                            <input inputmode="text" autocomplete="off" class="input100" type="text" name="cidade" id="cidade" placeholder="Entre com sua cidade">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-26" data-validate="E-mail obrigatório">
                            <span class="label-input100">Email</span>
                            <input autocomplete="off" class="input100" type="email" name="email" id="email" placeholder="Entre com seu e-mail">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-18" data-validate = "Senha obrigatória">
                            <span class="label-input100">Senha</span>
                            <input onkeyup="verificaForca(this.value)" autocomplete="off" class="input100" type="password" name="senha" id="senha" placeholder="Entre com sua senha">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 m-b-18">
                            <div class="progress">
                                <div id="forcaSenha" class="progress-bar" role="progressbar"
                                     aria-valuemin="0" aria-valuemax="100" style="width:100%; background-color: white">
                                </div>
                            </div>
                        </div>

                        <div class="wrap-input100 validate-input m-b-18" data-validate = "Senha obrigatória">
                            <span class="label-input100">Repetir senha</span>
                            <input autocomplete="off" class="input100" type="password" name="repetirSenha" id="repetirSenha" placeholder="Repetir senha">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="container-login100-form-btn">
                            <div class="col-md-12">
                                <center>
                                    <div class="col-md-12">
                                        <button type="submit" id="btnCadastrar" style="margin-top: 30px" class="btn btn-success btn-block">
                                            <i class="fa fa-save"></i> Cadastrar
                                        </button>
                                    </div>
                                    <div class="col-md-12">
                                        <a href="index.jsp">
                                            <button type="button" style="margin-top: 3px" class="btn btn-info btn-block">
                                               <i class="fa fa-undo"></i> Voltar
                                            </button>
                                        </a>
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

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>

        <script type="text/javascript" src="js/manipula-senhas.js"></script>
        <script type="text/javascript" src="js/valida-cadastro-usuario.js?version=3"></script>

        <script src="js/recorte-foto/cropper.js"></script>
        <script src="js/recorte-foto-usuario.js"></script>



    </body>
</html>