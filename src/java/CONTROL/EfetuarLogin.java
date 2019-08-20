/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROL;

import DATA.ConfiguracaoDAO;
import DATA.UsuarioDAO;
import MODEL.Configuracao;
import MODEL.Usuario;
import UTIL.Criptografia;
import UTIL.ManipulaArquivos;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jonatas Teodoro
 */
@WebServlet(name = "EfetuarLogin", urlPatterns = {"/EfetuarLogin"})
public class EfetuarLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            Criptografia criptografia = new Criptografia();
            String email = "";
            String senha = "";

            //Recebe e-mail e senha
            email = request.getParameter("usuario");
            senha = criptografia.converterMD5(request.getParameter("senha"));


            //Busca os dados do usuário
            UsuarioDAO dao;
            dao = new UsuarioDAO();
            Usuario user = dao.buscarUsuario(email, senha);

            //Cria uma sessão
            HttpSession sessao = request.getSession();
            sessao.setAttribute("autenticado", user);

            //Busca as configurações
            ConfiguracaoDAO confDao;
            confDao = new ConfiguracaoDAO();
            Configuracao conf = confDao.buscarConfiguracao();
            ManipulaArquivos manipula = new ManipulaArquivos();

            if (!user.getImagemPerfil().equals("")) {

                //Determina de onde o avatar vem e para onde vai
                String origem = conf.getLocalImagemPerfil() + File.separator + user.getImagemPerfil();
                String destino = request.getServletContext().getRealPath("/Documentos/avatar/" + user.getImagemPerfil()).replace("\\build", "");

                File origemAvatar = new File(origem);
                File destinoAvatar = new File(destino);

                //Copia o avatar para a pasta no servidor
                manipula.copia(origemAvatar, destinoAvatar);
            }

            //Chama a tela principal
            request.getRequestDispatcher("pagina_principal.jsp").forward(request, response);

        } catch (Exception ex) {
            System.out.println("Erro ao efetuar login!Erro: " + ex.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
