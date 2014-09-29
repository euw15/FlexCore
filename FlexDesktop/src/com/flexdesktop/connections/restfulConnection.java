/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.flexdesktop.connections;

import java.io.DataInputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Daniel
 */
public class restfulConnection {
    
   public  ArrayList<ArrayList<String>> parseJSON(String RESTfull_URL, ArrayList<String> columnasTabla) {
        try {
            URL url;
            URLConnection urlConnection;
            DataInputStream readString;
            url = new URL(RESTfull_URL);
            urlConnection = url.openConnection();
            urlConnection.setDoInput(true);
            urlConnection.setUseCaches(false);
            readString = new DataInputStream(urlConnection.getInputStream());
            String s;

            String getRequest = "";
            while ((s = readString.readLine()) != null) {
                getRequest += s;
            }
            readString.close();
            if (!"".equals(getRequest)) {
                return completeArray(getRequest, columnasTabla);
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public  ArrayList<ArrayList<String>> completeArray(String getRequest, ArrayList<String> columnasTabla) {
        ArrayList<ArrayList<String>> outJson = new ArrayList<>();
        try {
            getRequest = "{data:" + getRequest + "}";
            JSONObject jsnobject = new JSONObject(getRequest);
            JSONArray jsonArray = jsnobject.getJSONArray("data");
            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject explrObject = jsonArray.getJSONObject(i);
                ArrayList<String> aux = new ArrayList<>();
                for (int j = 0; j < columnasTabla.size(); j++) {
                    aux.add(explrObject.get(columnasTabla.get(j)).toString());
                }
                outJson.add(aux);
            }
            soutMatrix(outJson);
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return outJson;
    }

    public  void soutMatrix(ArrayList<ArrayList<String>> outJson) {
        for (ArrayList<String> outJson1 : outJson) {
            for (int j = 0; j < outJson1.size(); j++) {
                System.out.println(outJson1.get(j));
            }
        }
    }
}

/*
 ArrayList<String> columnas_tabla = new ArrayList<>();
        columnas_tabla.add("CIF");
        columnas_tabla.add("idTipoCliente");
        parseJSON("http://localhost:52003/api/cbclient/getclient",columnas_tabla);
*/