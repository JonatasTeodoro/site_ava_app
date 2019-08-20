/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UTIL;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author Jonatas Teodoro
 */
public class ManipulaImagem {

    public String base64ToImagem(String base64String, String nomeImagem) throws Exception {
        String[] strings = base64String.split(",");
        byte[] data = DatatypeConverter.parseBase64Binary(strings[1]);
        String path = nomeImagem;
        File file = new File(path);
        try (OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(file))) {
            outputStream.write(data);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "jpg";
    }
}
