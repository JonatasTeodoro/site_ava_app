/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DATA;

import MODEL.Usuario;
import UTIL.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Jonatas Teodoro
 */
public class UsuarioDAO extends Conexao {

    public UsuarioDAO() throws Exception {
    }

    public boolean CadastrarUsuario(Usuario obj) {
        boolean retorno = false;
        try {
            String sql = "insert into usuario (nome, senha, email, cidade, telefone, data_cadastro, img_perfil) values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = getConexao().prepareStatement(sql);
            ps.setString(1, obj.getNome());
            ps.setString(2, obj.getSenha());
            ps.setString(3, obj.getEmail());
            ps.setString(4, obj.getCidade());
            ps.setString(5, obj.getTelefone());
            ps.setDate(6, new java.sql.Date(obj.getDataCadastro().getTime()));
            ps.setString(7, obj.getImagemPerfil());

            retorno = ps.executeUpdate() > 0;
        } catch (Exception ex) {
            System.out.println("Erro ao cadastrar usuário!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public String BuscarImagemUsuario(int id) {
        String retorno = "";
        try {
            String sql = "select img_perfil from usuario where id_usuario=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                retorno = rs.getString("img_perfil");
            }

        } catch (Exception ex) {
            System.out.println("Erro ao buscar imagem do usuário!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public boolean verificaEmailExistente(String email) {
        boolean retorno = false;
        try {
            String sql = "select count(*) as quantidade from usuario where email=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                retorno = rs.getInt("quantidade") > 0;
            }

        } catch (Exception ex) {
            System.out.println("Erro no banco para verificar Email existente!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public boolean verificaSenhaAtual(String senha, int id) {
        boolean retorno = false;
        try {
            String sql = "select senha from usuario where id_usuario=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("senha").equals(senha)) {
                    retorno = true;
                }
            }

        } catch (Exception ex) {
            System.out.println("Erro no banco para verificar Email existente!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public boolean alteraSenhaUsuario(String senha, int id) {
        boolean retorno = false;
        try {
            String sql = "update usuario set senha=? where id_usuario=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ps.setString(1, senha);
            ps.setInt(2, id);

            retorno = ps.executeUpdate() > 0;

        } catch (Exception ex) {
            System.out.println("Erro ao editar senha no banco!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public boolean verificaCpfExistente(String cpf) {
        boolean retorno = false;
        try {
            String sql = "select count(*) as quantidade from usuario where cpf=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ps.setString(1, cpf);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                retorno = rs.getInt("quantidade") > 0;
            }

        } catch (Exception ex) {
            System.out.println("Erro no banco para verificar CPF existente!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public String buscarSeqImagemPerfil() {
        String retorno = "";
        try {
            String sql = "select nextval('seq_imgperfil') as sequencia";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                retorno = String.valueOf(rs.getInt("sequencia"));
            }

        } catch (Exception ex) {
            System.out.println("Erro no banco para verificar CPF existente!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public boolean verificaLoginSenha(String email, String senha) {
        boolean retorno = false;
        try {
            String sql = "select count(*) as quantidade from usuario where email=? and senha=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, senha);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                retorno = rs.getInt("quantidade") > 0;
            }

        } catch (Exception ex) {
            System.out.println("Erro no banco para verificar Email existente!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public Usuario buscarUsuario(String email, String senha) {
        Usuario obj = new Usuario();
        try {
            String sql = "select * from usuario where email=? and senha=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, senha);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                obj.setNome(rs.getString("nome"));
                obj.setId(rs.getInt("id_usuario"));
                obj.setEmail(rs.getString("email"));
                obj.setCidade(rs.getString("cidade"));
                obj.setTelefone(rs.getString("telefone"));
                obj.setDataCadastro(rs.getDate("data_cadastro"));
                obj.setImagemPerfil(rs.getString("img_perfil"));
            }

        } catch (Exception ex) {
            System.out.println("Erro no banco ao buscar usuário!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return obj;
        }
    }

    public boolean editarCadastro(Usuario obj) {
        boolean retorno = false;
        try {
            String sql = "update usuario set nome=?, email=?, img_perfil=?, cidade=?, telefone=? where id_usuario=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ps.setString(1, obj.getNome());
            ps.setString(2, obj.getEmail());
            ps.setString(3, obj.getImagemPerfil());
            ps.setString(4, obj.getCidade());
            ps.setString(5, obj.getTelefone());
            ps.setInt(6, obj.getId());

            retorno = ps.executeUpdate() > 0;

        } catch (Exception ex) {
            System.out.println("Erro no banco ao editar usuário!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }
}
