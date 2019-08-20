/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROL;

import DATA.RecuperacaoDAO;
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
@WebServlet(name = "RecuperarSenha", urlPatterns = {"/RecuperarSenha"})
public class RecuperarSenha extends HttpServlet {

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

            String requisicao = request.getParameter("req");

            dao = new RecuperacaoDAO();
            int idUsuario = dao.buscarIdUsuarioRequisicao(requisicao);

            request.setAttribute("idUsuario", idUsuario);

            // Ver se existe requisição
            dao = new RecuperacaoDAO();
            if (dao.verificarRequisicao(requisicao)) {
                //Exite requisição
                dao = new RecuperacaoDAO();
                dao.excluirRequisicoes(idUsuario);
                request.setAttribute("idUsuario", idUsuario);
                request.getRequestDispatcher("alterar_senha_recuperacao.jsp").forward(request, response);

            } else {
                //Não existe requisição
                request.setAttribute("mensagem", "Esta requisição expirou!");
                request.getRequestDispatcher("final_cadastro.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            System.out.println("Erro ao RecuperarSenha!Erro: " + ex.getMessage());
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
