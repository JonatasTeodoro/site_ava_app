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
public class Configuracao {

    private String localImagemPerfil;
    private String localImagemPublicacao;

    public Configuracao(String localImagemPerfil, String localImagemPublicacao) {
        this.localImagemPerfil = localImagemPerfil;
        this.localImagemPublicacao = localImagemPublicacao;
    }

    public Configuracao() {
        localImagemPerfil = new String();
        localImagemPublicacao = new String();
    }

    /**
     * @return the localImagemPerfil
     */
    public String getLocalImagemPerfil() {
        return localImagemPerfil;
    }

    /**
     * @param localImagemPerfil the localImagemPerfil to set
     */
    public void setLocalImagemPerfil(String localImagemPerfil) {
        this.localImagemPerfil = localImagemPerfil;
    }

    /**
     * @return the localImagemPublicacao
     */
    public String getLocalImagemPublicacao() {
        return localImagemPublicacao;
    }

    /**
     * @param localImagemPublicacao the localImagemPublicacao to set
     */
    public void setLocalImagemPublicacao(String localImagemPublicacao) {
        this.localImagemPublicacao = localImagemPublicacao;
    }

}
