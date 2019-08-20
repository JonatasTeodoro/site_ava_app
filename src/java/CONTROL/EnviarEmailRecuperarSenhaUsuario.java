/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROL;

import DATA.RecuperacaoDAO;
import UTIL.Criptografia;
import UTIL.EnviarEmail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jonatas Teodoro
 */
@WebServlet(name = "EnviarEmailRecuperarSenhaUsuario", urlPatterns = {"/EnviarEmailRecuperarSenhaUsuario"})
public class EnviarEmailRecuperarSenhaUsuario extends HttpServlet {

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

            RecuperacaoDAO dao;
            EnviarEmail enviar = new EnviarEmail();
            Criptografia cripto = new Criptografia();

            String email = request.getParameter("email");

            dao = new RecuperacaoDAO();
            int id = dao.buscarIdUsuario(email);

            if (id != 0) {

                String url = String.valueOf(request.getRequestURL());
                url = url.replaceAll("EnviarEmailRecuperarSenhaUsuario", "");

                dao = new RecuperacaoDAO();

                String requisicao = cripto.converterMD5(String.valueOf(dao.buscarIdRequisicao()));

                dao = new RecuperacaoDAO();
                if (dao.cadastrarRequisicao(requisicao, id)) {

                    enviar.enviarRecuperacaoSenha(url + "RecuperarSenha?req=" + requisicao, email);
                    
                    request.setAttribute("mensagem", "Enviamos um e-mail para você");
                    
                }else{
                    request.setAttribute("mensagem", "Não foi possível enviar um e-mail para você");
                }
                
                request.getRequestDispatcher("final_cadastro.jsp").forward(request, response);

            }

        } catch (Exception ex) {
            System.out.println("Erro ao enviar email de recuperação de senha!Erro: " + ex.getMessage());
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
