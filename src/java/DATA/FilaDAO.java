/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DATA;

import MODEL.Fila;
import MODEL.Usuario;
import UTIL.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Jonatas Teodoro
 */
public class FilaDAO extends Conexao {

    public FilaDAO() throws Exception {
    }

    public ArrayList<Fila> buscarFila(String tipo) {
        ArrayList<Fila> fila = new ArrayList<>();
        Fila obj;
        try {
            String sql = "select * from fila fil left join usuario usua on fil.id_usuario = usua.id_usuario where tipo like ? order by atual desc, id_fila limit 4";
            PreparedStatement ps = getConexao().prepareStatement(sql);
            ps.setString(1, "%"+tipo+"%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                obj = new Fila();
                obj.setIdFila(rs.getInt("id_fila"));
                obj.setAtual(rs.getBoolean("atual"));
                obj.setNome(rs.getString("nome"));
                obj.setTipo(rs.getString("tipo"));
                fila.add(obj);
            }
        } catch (Exception ex) {
            System.out.println("Erro ao buscarFila!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return fila;
        }
    }
    
    public int buscarParamFila() {
        int retorno = 0;
        try {
            String sql = "select * from param_fila";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                retorno = rs.getInt("tipo_atual");
            }
        } catch (Exception ex) {
            System.out.println("Erro ao buscarParamFila!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public int buscarPosicao(int id, String tipo) {
        int retorno = 0;
        try {
            String sql = "select * from fila fil left join usuario usua on fil.id_usuario = usua.id_usuario where tipo like ? order by atual desc, id_fila";
            PreparedStatement ps = getConexao().prepareStatement(sql);
            ps.setString(1, "%"+tipo+"%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getInt("id_usuario") == id) {
                    break;
                }
                retorno++;
            }
        } catch (Exception ex) {
            System.out.println("Erro ao buscarFila!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }
    
    public boolean verificarSeTemVoo(int id, String tipo) {
        boolean retorno = false;
        try {
            String sql = "select count(*) as quantidade from fila where id_usuario=? and tipo like ?";
            PreparedStatement ps = getConexao().prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, "%"+tipo+"%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                retorno = rs.getInt("quantidade")>0;
            }
        } catch (Exception ex) {
            System.out.println("Erro ao verificarSeTemVoo!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public int buscarQuantidadeFila() {
        int retorno = 0;
        try {
            String sql = "select count(*) as quantidade from fila";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                retorno = rs.getInt("quantidade");
            }
        } catch (Exception ex) {
            System.out.println("Erro ao buscarQuantidadeFila!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }

    public boolean agendar(Usuario obj, String tipo) {
        boolean retorno = false;
        try {
            String sql = "insert into fila(nome, atual, id_usuario, tipo) values(?, ?, ?, ?)";
            PreparedStatement ps = getConexao().prepareStatement(sql);

            ps.setString(1, obj.getNome());
            ps.setBoolean(2, false);
            ps.setInt(3, obj.getId());
            ps.setString(4, tipo);

            retorno = ps.executeUpdate() > 0;

        } catch (Exception ex) {
            System.out.println("Erro ao agendar!Erro: " + ex.getMessage());
        } finally {
            fechaConexao();
            return retorno;
        }
    }
}
