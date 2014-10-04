/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.flexdesktop.user.GraphicInterface;

import com.flexdesktop.connections.restfulConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

/**
 *
 * @author Jason
 */
public class GraphicInterface {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws MalformedURLException {

        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (ClassNotFoundException | InstantiationException |
                IllegalAccessException | UnsupportedLookAndFeelException e) {
        }

        Frame a = new Frame();
        a.setLocationRelativeTo(null);
        a.setVisible(true);   
//        ArrayList<String> columnas_tabla = new ArrayList<>();
//        columnas_tabla.add("CIF");
//        columnas_tabla.add("cedula");
       // "CIF","apellido","cedula","direccion","nombre","telefono"

//        URL b = new URL("/api/cbclient/getClienteJuridicoPorConcepto?concepto=Nombre&dato=Jason");
        //restfulConnection.soutMatrix(restfulConnection.getRESTful("http://localhost:52003/api/cbclient/getClienteJuridicoPorConcepto?concepto=Nombre&dato=Jason", columnas_tabla));
//        restfulConnection.postRESTful("http://localhost:52003/api/cbclient/getClienteFisicoPorConcepto?concepto=Nombre&dato=Daniel", "");
        

    }

}
