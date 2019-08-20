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
import UTIL.ManipulaDatas;
import UTIL.ManipulaImagem;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jonatas Teodoro
 */
@WebServlet(name = "CadastrarNovoUsuario", urlPatterns = {"/CadastrarNovoUsuario"})
public class CadastrarNovoUsuario extends HttpServlet {

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
            ConfiguracaoDAO confdao;
            UsuarioDAO dao;
            ManipulaImagem manipulaimagem = new ManipulaImagem();
            Criptografia criptografia = new Criptografia();
            ManipulaDatas manipuladatas = new ManipulaDatas();

            String fotoPerfil = request.getParameter("64imagem");
            String nome = request.getParameter("nome");
            String cidade = request.getParameter("cidade");
            String telefone = request.getParameter("telefone");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            Usuario obj = new Usuario();
            obj.setNome(nome);
            obj.setCidade(cidade);
            obj.setTelefone(telefone);
            obj.setEmail(email);
            obj.setSenha(criptografia.converterMD5(senha));
            obj.setDataCadastro(new Date());

            if (!fotoPerfil.equals("")) {
                confdao = new ConfiguracaoDAO();
                Configuracao conf = confdao.buscarConfiguracao();

                dao = new UsuarioDAO();
                String nomeFoto = criptografia.converterMD5(dao.buscarSeqImagemPerfil()) + ".jpg";

                manipulaimagem.base64ToImagem(fotoPerfil, conf.getLocalImagemPerfil() + File.separator + nomeFoto);

                obj.setImagemPerfil(nomeFoto);
            }

            //Busca as configurações
            ConfiguracaoDAO confDao;
            confDao = new ConfiguracaoDAO();
            Configuracao conf = confDao.buscarConfiguracao();
            ManipulaArquivos manipula = new ManipulaArquivos();

            dao = new UsuarioDAO();
            if (dao.CadastrarUsuario(obj)) {

                if (!obj.getImagemPerfil().equals("")) {

                    //Determina de onde o avatar vem e para onde vai
                    String origem = conf.getLocalImagemPerfil() + File.separator + obj.getImagemPerfil();
                    String destino = request.getServletContext().getRealPath("/Documentos/avatar/" + obj.getImagemPerfil()).replace("\\build", "");

                    File origemAvatar = new File(origem);
                    File destinoAvatar = new File(destino);

                    //Copia o avatar para a pasta no servidor
                    manipula.copia(origemAvatar, destinoAvatar);
                }
                request.setAttribute("mensagem", "Cadastrado com sucesso!");
                request.getRequestDispatcher("final_cadastro.jsp").forward(request, response);
            } else {
                //Erro ao cadastrar
                request.setAttribute("mensagem", "Erro ao cadastrar!");
                request.getRequestDispatcher("final_cadastro.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            System.out.println("Erro ao cadastrar novo usuário!Erro: " + ex.getMessage());
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
