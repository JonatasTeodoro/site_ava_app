/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROL;

import DATA.ConfiguracaoDAO;
import DATA.PublicacaoDAO;
import MODEL.Configuracao;
import MODEL.FotosPublicacao;
import MODEL.Usuario;
import UTIL.Criptografia;
import UTIL.ManipulaArquivos;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Jonatas Teodoro
 */
@WebServlet(name = "EnviarImagem", urlPatterns = {"/EnviarImagem"})
public class EnviarImagem extends HttpServlet {

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

            Criptografia cri = new Criptografia();

            ManipulaArquivos arq = new ManipulaArquivos();

            HttpSession sessao = request.getSession();
            Usuario user = (Usuario) sessao.getAttribute("autenticado");

            PublicacaoDAO pub;
            pub = new PublicacaoDAO();
            String nomeImagem = cri.converterMD5(pub.buscarNomeFoto()) + ".jpg";

            ConfiguracaoDAO conf;
            conf = new ConfiguracaoDAO();
            Configuracao configuracao = conf.buscarConfiguracao();

            String comentario = "";

            String localServer = request.getServletContext().getRealPath("/fotos/").replace("\\build", "");
            localServer = localServer.replace("\\br.com.avamodelismo.app", "\\br.com.avamodelismo.monitor");

            //Aqui
            if (ServletFileUpload.isMultipartContent(request)) {

                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                for (FileItem item : multiparts) {

                    if (item.getFieldName().equals("comentario")) {
                        comentario = cri.hexToAscii(item.getString());
                    }

                    if (!item.isFormField()) {

                        item.write(new File(configuracao.getLocalImagemPublicacao() + File.separator + nomeImagem));

                    }

                }
            }

            FotosPublicacao obj = new FotosPublicacao();
            obj.setComentario(comentario);
            obj.setNomeFoto(nomeImagem);

            Usuario usu = new Usuario();
            usu.setId(user.getId());

            obj.setUsuario(usu);

            pub = new PublicacaoDAO();
            pub.salvarDadosPublicacao(obj);

            arq.copia(new File(configuracao.getLocalImagemPublicacao() + File.separator + nomeImagem), new File(localServer + nomeImagem));

        } catch (Exception ex) {
            System.out.println("Erro! " + ex.getMessage());
        }
    }

    public static String convertUTF8toISO(String str) {
        String ret = null;
        try {
            ret = new String(str.getBytes("ISO-8859-1"), "UTF-8");
        } catch (java.io.UnsupportedEncodingException e) {
            return null;
        }
        return ret;
    }

    public Date converterDataLocal(String data) throws ParseException {
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        if (data == null || data.trim().equals("")) {
            return null;
        } else {
            Date date = fmt.parse(data);
            return date;
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
