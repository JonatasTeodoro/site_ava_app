<%@page import="MODEL.Usuario"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Contagem</title>

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



    </head>

    <body style="background-image: url(https://i.ibb.co/0fhvmPY/fundo.jpg); background-size: cover;">


        <div style="position: relative;
             top: 50%;
             transform: translateY(-50%); " class="col-md-12">
            <center><div class="col-md-6 animated fadeInDownBig">
                    <img width="100%" src="images/Logotipo.png">
                    <table class="table table-dark">
                        <thead>
                            <tr style="text-align: center">
                                <th scope="col">Dias</th>
                                <th scope="col">Horas</th>
                                <th scope="col">Minutos</th>
                                <th scope="col">Segundos</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr style="text-align: center; font-size: xx-large">
                                <td id="dia"></td>
                                <td id="hora"></td>
                                <td id="minuto"></td>
                                <td id="segundo"></td>
                            </tr>
                        </tbody>
                    </table>
                    <a href="https://goo.gl/maps/HLPT7zuFatNAJQyp7"><button class="btn btn-info"><i class="fa fa-map-marker"></i> Localização</button></a>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal"><i class="fas fa-dollar-sign"></i> Inscreva-se</button>
                </div>
            </center>
        </div>









        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">INSCRIÇÃO AVAFEST 2019</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                    </div>
                    <div id="telaModal" style="overflow: scroll;" class="modal-body">
                        <p>O acesso ao evento será gratuito para as áreas de visitantes, lojas e praça de alimentação. </p>
                        <p>Áreas de box e pistas somente para inscritos no evento</p>
                        <label style="color: red">*** Não aceitamos devoluções de inscrições efetuadas.</label>
                        <label><b>Pilotos Inscritos terão direito a:</b></label>
                        <p>- Identificação para acesso às áreas de box, pista, aviões.</p>
                        <p>- Ticket para participação nos sorteios de brindes.</p>
                        <p>- Voar no evento junto a demais pilotos convidados</p>
                        <p>- Acesso a banheiros exclusivos</p>
                        <p>- Acesso a área de camping com iluminação, energia, água, chuveiro quente.</p>
                        <p>- Estacionamento exclusivo com acomodações para carreta.</p>
                        <h6 style="color: #F9C700">INSCRIÇÕES ANTECIPADAS R$ 85,00 ATÉ O DIA 01/09/2019 APÓS SOMENTE NO LOCAL A R$ 100,00, PREÇO ÚNICO PILOTO OU ACOMPANHANTE. </h6>
                        <p>Crianças até 10 anos acompanhados de seus responsáveis não pagam</p>
                        <center><a href="https://pag.ae/7UZjzfKKs"><button class="btn btn-info">Efetuar compra</button></a></center>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
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
        <script src="js/contagem_regressiva.js?version=10"></script>


        <script type="text/javascript">
            function alteraTamanhoDiv() {
                try {
                    var windowHeight = window.innerHeight;

                    var umquarto = windowHeight * 0.6;

                    document.getElementById("telaModal").style.height = umquarto + "px";

                } catch (error) {
                    alert("Erro!" + error);
                }
            }

            alteraTamanhoDiv();
        </script>
    </body>

</html>