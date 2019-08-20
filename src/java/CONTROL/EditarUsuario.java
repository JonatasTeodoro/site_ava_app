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
import UTIL.ManipulaImagem;
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
@WebServlet(name = "EditarUsuario", urlPatterns = {"/EditarUsuario"})
public class EditarUsuario extends HttpServlet {

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
            ManipulaArquivos manipula = new ManipulaArquivos();

            String nome = request.getParameter("nome");
            String telefone = request.getParameter("telefone");
            String cidade = request.getParameter("cidade");
            String email = request.getParameter("email");
            String imagem = request.getParameter("64imagem");
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

            Usuario obj = new Usuario();
            obj.setNome(nome);
            obj.setCidade(cidade);
            obj.setTelefone(telefone);
            obj.setEmail(email);
            obj.setId(idUsuario);
            dao = new UsuarioDAO();
            obj.setImagemPerfil(dao.BuscarImagemUsuario(idUsuario));

            if (!imagem.equals("")) {

                confdao = new ConfiguracaoDAO();
                Configuracao conf = confdao.buscarConfiguracao();
                dao = new UsuarioDAO();
                String imgAtual = dao.BuscarImagemUsuario(idUsuario);
                if (!imgAtual.equals("")) {
                    //Já tem uma imagem
                    new File(conf.getLocalImagemPerfil() + File.separator + imgAtual).delete();
                    new File(request.getServletContext().getRealPath("/Documentos/avatar/" + imgAtual).replace("\\build", "")).delete();
                }

                dao = new UsuarioDAO();
                String nomeFoto = criptografia.converterMD5(dao.buscarSeqImagemPerfil()) + ".jpg";
                obj.setImagemPerfil(nomeFoto);
                manipulaimagem.base64ToImagem(imagem, conf.getLocalImagemPerfil() + File.separator + nomeFoto);

                //Determina de onde o avatar vem e para onde vai
                String origem = conf.getLocalImagemPerfil() + File.separator + obj.getImagemPerfil();
                String destino = request.getServletContext().getRealPath("/Documentos/avatar/" + obj.getImagemPerfil()).replace("\\build", "");

                File origemAvatar = new File(origem);
                File destinoAvatar = new File(destino);

                //Copia o avatar para a pasta no servidor
                manipula.copia(origemAvatar, destinoAvatar);
            }

            dao = new UsuarioDAO();
            if (dao.editarCadastro(obj)) {
                HttpSession sessao = request.getSession();
                Usuario sess = (Usuario) sessao.getAttribute("autenticado");
                sess.setNome(nome);
                sess.setEmail(email);
                sess.setCidade(cidade);
                sess.setTelefone(telefone);
                sess.setImagemPerfil(obj.getImagemPerfil());
                sessao.setAttribute("autenticado", sess);
                Thread.sleep(5000);

                request.setAttribute("mensagem", "Editado com sucesso!");
                request.getRequestDispatcher("editar_cadastro.jsp").forward(request, response);
            } else {
                request.setAttribute("mensagem", "Erro ao editar!");
                request.getRequestDispatcher("editar_cadastro.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            System.out.println("Erro ao editar usuário!Erro: " + ex.getMessage());
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
