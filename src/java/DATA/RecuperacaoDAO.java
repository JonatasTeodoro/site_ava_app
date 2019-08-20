/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DATA;

import UTIL.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Jonatas Teodoro
 */
public class RecuperacaoDAO extends Conexao {

    public RecuperacaoDAO() throws Exception {
    }

    public int buscarIdUsuario(String email) {
        int idUsuario = 0;
        try {
            String sql = "select id_usuario from usuario where email=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                idUsuario = rs.getInt("id_usuario");
            }
        } catch (Exception ex) {
            System.out.println("Erro ao buscarIdUsuario!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return idUsuario;
        }
    }

    public int buscarIdRequisicao() {
        int id = 0;
        try {
            String sql = "select nextval('seq_requisicao_senha') as sequencia";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt("sequencia");
            }
        } catch (Exception ex) {
            System.out.println("Erro ao buscarIdRequisicao!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return id;
        }
    }

    public boolean cadastrarRequisicao(String idReq, int idUsuario) {
        boolean retorno = false;
        try {
            String sql = "insert into recuperacao_senha (id, id_usuario) values (?, ?)";
            PreparedStatement ps = getConexao().prepareStatement(sql);
            ps.setString(1, idReq);
            ps.setInt(2, idUsuario);

            retorno = ps.executeUpdate() > 0;
        } catch (Exception ex) {
            System.out.println("Erro ao cadastrarRequisicao!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public int buscarIdUsuarioRequisicao(String requisicao) {
        int id = 0;
        try {
            String sql = "select * from recuperacao_senha where id=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);
            ps.setString(1, requisicao);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt("id_usuario");
            }
        } catch (Exception ex) {
            System.out.println("Erro ao buscarIdUsuarioRequisicao!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return id;
        }
    }

    public boolean verificarRequisicao(String requisicao) {
        boolean retorno = false;
        try {
            String sql = "select count(*) as quantidade from recuperacao_senha where id=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);
            ps.setString(1, requisicao);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                retorno = rs.getInt("quantidade") > 0;
            }
        } catch (Exception ex) {
            System.out.println("Erro ao verificarRequisicao!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public boolean excluirRequisicoes(int id) {
        boolean retorno = false;
        try {
            String sql = "delete from recuperacao_senha where id_usuario=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);
            ps.setInt(1, id);

            retorno = ps.executeUpdate() > 0;
        } catch (Exception ex) {
            System.out.println("Erro ao excluirRequisicoes!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public boolean alterarSenha(int id, String senha) {
        boolean retorno = false;
        try {
            String sql = "update usuario set senha=? where id_usuario=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);
            ps.setString(1, senha);
            ps.setInt(2, id);

            retorno = ps.executeUpdate() > 0;
        } catch (Exception ex) {
            System.out.println("Erro ao alterarSenha!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }
}
