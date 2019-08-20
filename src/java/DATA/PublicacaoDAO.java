/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DATA;

import MODEL.FotosPublicacao;
import UTIL.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Jonatas Teodoro
 */
public class PublicacaoDAO extends Conexao {

    public PublicacaoDAO() throws Exception {
    }

    public String buscarNomeFoto() {
        String retorno = "";
        try {
            String sql = "select nextval('seq_img_publicacao') as nmimg";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                retorno = String.valueOf(rs.getInt("nmimg"));
            }
        } catch (Exception ex) {
            System.out.println("Erro ao buscarNomeFoto!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public boolean salvarDadosPublicacao(FotosPublicacao obj) {
        boolean retorno = false;
        try {
            String sql = "insert into fotos_publicacao(nome_foto, id_usuario, comentario, foi_publicada) values(?, ?, ?, ?)";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ps.setString(1, obj.getNomeFoto());
            ps.setInt(2, obj.getUsuario().getId());
            ps.setString(3, obj.getComentario());
            ps.setBoolean(4, false);

            retorno = ps.executeUpdate() > 0;
        } catch (Exception ex) {
            System.out.println("Erro ao salvarDadosPublicacao!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }
}
