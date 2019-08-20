/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UTIL;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.HtmlEmail;

/**
 *
 * @author Jonatas Teodoro
 */
public class EnviarEmail {
    String login = "avaaeromodelismo@gmail.com", senha = "02654560";

    public void enviarRecuperacaoSenha(String url, String endereco) throws Exception {

        HtmlEmail email = new HtmlEmail();
        email.setSSLOnConnect(true);
        email.setHostName("smtp.gmail.com");
        email.setSslSmtpPort("465");
        email.setAuthenticator(new DefaultAuthenticator(login, senha));

        email.setFrom(login, "AVA MODELISMO");
        email.setDebug(true);
        email.setSubject("RECUPERAÇÃO DE SENHA");

        StringBuilder builder = new StringBuilder();

        builder.append("<!DOCTYPE html>\n"
                + "<html lang=\"pt-br\">\n"
                + "    <head>\n"
                + "        <meta charset=\"utf-8\">\n"
                + "        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
                + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
                + "        <title>Recuperação</title>\n"
                + "\n"
                + "        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n"
                + "    </head>\n"
                + "    <body>\n"
                + "        <div class=\"row\">\n"
                + "            <div class=\"col-md-12\"><center>\n"
                + "             <div class=\"col-md-4\">\n"
                + "                 <img width=\"70%\" src=\"https://imgbbb.com/images/2019/08/13/Logotipo.png\" alt=\"AVA_LOGOTIPO.jpg\" />\n"
                + "             </div>\n"
                + "            </center></div>\n"
                + "        </div>\n"
                + "        \n"
                + "        <div class=\"row\">\n"
                + "            <div class=\"col-md-4\"></div>\n"
                + "            <div class=\"col-md-4\"><center>\n"
                + "                <h3 style=\"color: blue\" class=\"text-center\">Recuperação de senha AVA Aeromodelismo</h3>\n"
                + "                <h4 class=\"text-center\">Para alterar sua senha <a style=\"color: red\" href=\""+url+"\">CLIQUE AQUI</a></h4>\n"
                + "            </div></center>\n"
                + "            <div class=\"col-md-4\"></div>\n"
                + "        </div>\n"
                + "        <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n"
                + "        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n"
                + "        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\n"
                + "    </body>\n"
                + "</html>");

        email.setHtmlMsg(builder.toString());
        email.addTo(endereco);
        email.send();

    }
}
