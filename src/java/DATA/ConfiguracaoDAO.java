/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DATA;

import MODEL.Configuracao;
import UTIL.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Jonatas Teodoro
 */
public class ConfiguracaoDAO extends Conexao {

    public ConfiguracaoDAO() throws Exception {
    }

    public Configuracao buscarConfiguracao() {
        Configuracao obj = new Configuracao();
        try {
            String sql = "select * from configuracoes";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                obj.setLocalImagemPerfil(rs.getString("local_img_perfil"));
                obj.setLocalImagemPublicacao(rs.getString("local_img_publicacao"));
            }
        } catch (Exception ex) {
            System.out.println("Erro ao cadastrar usuário!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return obj;
        }
    }
}
