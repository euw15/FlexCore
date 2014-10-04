/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.flexdesktop.connections;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
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
public  class restfulConnection {

    public static ArrayList<ArrayList<String>> getRESTful(String RESTfull_URL, ArrayList<String> columnasTabla) {
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
            Logger.getLogger(com.flexdesktop.connections.restfulConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ArrayList<ArrayList<String>> completeArray(String getRequest, ArrayList<String> columnasTabla) {
        ArrayList<ArrayList<String>> outJson = new ArrayList<>();
        try {
            getRequest = "{data:" + getRequest + "}";            
            JSONObject jsnobject = new JSONObject(getRequest);
            JSONArray jsonArray = jsnobject.getJSONArray("data");
            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject explrObject = jsonArray.getJSONObject(i);
                ArrayList<String> aux = new ArrayList<>();
                for (int j = 0; j < columnasTabla.size(); j++) {
                    try {
                        aux.add(explrObject.get(columnasTabla.get(j)).toString());
                    } catch (Exception ex) {
                        System.out.println("getRESTful-completeArray-columnasTabla tiene nombres que no calzan con los obtenidos del rest");
                    }
                }
                outJson.add(aux);
            }
            soutMatrix(outJson);
        } catch (Exception ex) {
            Logger.getLogger(com.flexdesktop.connections.restfulConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return outJson;
    }

    public static void soutMatrix(ArrayList<ArrayList<String>> outJson) {
        for (ArrayList<String> outJson1 : outJson) {
            for (int j = 0; j < outJson1.size(); j++) {
                System.out.println(outJson1.get(j));
            }
        }
    }

    public static void postRequest(HttpURLConnection connection, String data) {
        DataOutputStream wr = null;
        try {
            wr = new DataOutputStream(connection.getOutputStream());
            wr.writeBytes(data);
            wr.flush();
            wr.close();
        } catch (IOException ex) {
            Logger.getLogger(com.flexdesktop.connections.restfulConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static String postResponse(HttpURLConnection connection) {
        try {
            InputStream is = connection.getInputStream();
            BufferedReader rd = new BufferedReader(new InputStreamReader(is));
            String line;
            StringBuffer response = new StringBuffer();
            while ((line = rd.readLine()) != null) {
                response.append(line);
                response.append('\r');
            }
            rd.close();
            return response.toString();
        } catch (IOException ex) {
            Logger.getLogger(com.flexdesktop.connections.restfulConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "fail";
    }

    public static String postRESTful(String RESTfull_URL, String data) {
        String state = "";
        try {
            URL url = new URL(RESTfull_URL);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setUseCaches(false);
            connection.setDoInput(true);
            connection.setDoOutput(true);

            //Send request
            postRequest(connection, data);
            //Get Response
            state = postResponse(connection);

            if (connection != null) {
                connection.disconnect();
            }
        } catch (Exception ex) {
            Logger.getLogger(com.flexdesktop.connections.restfulConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(state);
        return state;
    }
}

/*
 ArrayList<String> columnas_tabla = new ArrayList<>();
 columnas_tabla.add("CIF");
 columnas_tabla.add("idTipoCliente");
 getRESTful("http://localhost:52003/api/cbclient/getclient",columnas_tabla);

 postRESTful("http://localhost:52003//api/cbimage/insertImage?clientAccount=fdg", getStringBytesImage("url"));
 getRESTful("http://localhost:52003/api/cbimage/getImage?ID=21", columnas_tabla)
 */
