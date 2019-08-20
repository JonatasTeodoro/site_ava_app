/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL;

/**
 *
 * @author Jonatas Teodoro
 */
public class FotosPublicacao {

    private int id;
    private String nomeFoto;
    private Usuario usuario;
    private String comentario;

    public FotosPublicacao(int id, String nomeFoto, Usuario usuario, String comentario) {
        this.id = id;
        this.nomeFoto = nomeFoto;
        this.usuario = usuario;
        this.comentario = comentario;
    }

    public FotosPublicacao() {
        id = 0;
        nomeFoto = new String();
        usuario = new Usuario();
        comentario = new String();
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the nomeFoto
     */
    public String getNomeFoto() {
        return nomeFoto;
    }

    /**
     * @param nomeFoto the nomeFoto to set
     */
    public void setNomeFoto(String nomeFoto) {
        this.nomeFoto = nomeFoto;
    }

    /**
     * @return the usuario
     */
    public Usuario getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the comentario
     */
    public String getComentario() {
        return comentario;
    }

    /**
     * @param comentario the comentario to set
     */
    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

}
