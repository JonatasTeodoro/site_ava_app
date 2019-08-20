<%@page import="MODEL.Usuario"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Fila</title>


        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/barra.png"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <script src="https://kit.fontawesome.com/946a1a1c44.js"></script>
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
            a:link{
                text-decoration: none;
            }
        </style>

        <style type="text/css">
            i:hover{
                font-size: 45px;
                color: red; 
            }

            i:active{
                color: black;
            }
            button:hover{
                color: red;
            }

            button:active{
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

        <div style="margin-top: 30px" class="col-md-12">
            <center>
                <div class="col-md-5">
                    <button class="btn btn-success btn-block" style="font-size: 30px" data-toggle="modal" data-target="#myModal"><i class="fa fa-clipboard"></i> AGENDAR</button>
                </div>
            </center>
        </div>

        <div style="margin-top: 30px" class="col-md-12">
            <center>
                <div class="col-md-5">
                    <a href="fila_espera.jsp"><button style="font-size: 30px; background-color: #326690" class="btn btn-info btn-block"><i class="fa fa-list"></i> FILA</button></a>
                </div>
            </center>
        </div>

        <nav style="background-color: #f5f5f5" class="navbar navbar-light navbar-expand fixed-bottom">
            <div class="collapse navbar-collapse" id="navcol-1" style="height: 80px">
                <ul class="nav navbar-nav mx-auto">
                    <li class="nav-item animated fadeInLeftBig" role="presentation"><a class="nav-link" href="pagina_principal.jsp"><i class="fa fa-undo menu"></i></a></li>
                </ul>
            </div>
        </nav>












        <!-- MODAL  -->
        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Agendar</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="col-sm-12">
                            <div class="col-sm-12"><button onclick="agendar(0)" class="btn btn-block btn-info"><i class="fa fa-plane"></i> AVIÃO</button></div>
                            <div style="margin-top: 5px" class="col-sm-12"><button onclick="agendar(1)" class="btn btn-block btn-warning"><i class="fa fa-helicopter"></i> HELICÓPTERO</button></div>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Sair</button>
                    </div>

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
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
        <script src="js/valida_agendar.js?version=18"></script>


        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>



    </body>

</html>