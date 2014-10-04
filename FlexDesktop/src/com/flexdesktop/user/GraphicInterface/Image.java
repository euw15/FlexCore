/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.flexdesktop.user.GraphicInterface;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

/**
 *
 * @author Daniel
 */
public class Image {

    public static String getStringBytesImage(String path) {
        String base64String = "";
        try {
            File file = new File("C:\\Users\\Jason\\Pictures\\Fondos2\\Image3.jpg");
            // File file = new File(path);            
            FileInputStream fis = new FileInputStream(file);
            ByteArrayOutputStream byteOuputStream = new ByteArrayOutputStream();
            byte[] byteArrayBuffer = new byte[1024];
            try {
                for (int readNum; (readNum = fis.read(byteArrayBuffer)) != -1;) {
                    byteOuputStream.write(byteArrayBuffer, 0, readNum);
                }
            } catch (Exception ex) {
                System.out.println(ex);
            }
            byteOuputStream.flush();
            base64String = Base64.getEncoder().encodeToString(byteOuputStream.toByteArray());
            byteOuputStream.close();
        } catch (IOException ex) {
            Logger.getLogger(com.flexdesktop.user.GraphicInterface.Image.class.getName()).log(Level.SEVERE, null, ex);
        }
        return base64String;
    }

    public static java.awt.Image generateImage(String base64String) {
        try {
            byte[] bytes = Base64.getDecoder().decode(base64String);
            ByteArrayInputStream bis = new ByteArrayInputStream(bytes);
            Iterator<?> readers = ImageIO.getImageReadersByFormatName("jpg");
            ImageReader reader = (ImageReader) readers.next();
            Object source = bis;
            ImageInputStream iis = ImageIO.createImageInputStream(source);
            reader.setInput(iis, true);
            ImageReadParam param = reader.getDefaultReadParam();
            java.awt.Image image = reader.read(0, param);
            BufferedImage bufferedImage = new BufferedImage(image.getWidth(null), image.getHeight(null), BufferedImage.TYPE_INT_RGB);
            Graphics2D g2 = bufferedImage.createGraphics();
            g2.drawImage(image, null, null);
            //g2.drawImage(image, 25, 25,null); 
            image = image.getScaledInstance(160, 135, 10);
            return image;
        } catch (Exception ex) {
            Logger.getLogger(com.flexdesktop.user.GraphicInterface.Image.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

 // File imageFile = new File("C:\\Users\\Daniel\\Desktop\\image.jpg");
//  ImageIO.write(bufferedImage, "jpg", imageFile);
//  System.out.println(imageFile.getPath());

/*
 ArrayList<String> columnas_tabla = new ArrayList<>();       
 columnas_tabla.add("string64Image");
       
 ImageIcon icon = new ImageIcon( ConnectionJavaRESTful.generateImage(ConnectionJavaRESTful.
 getRESTful("http://localhost:52003/api/cbimage/getImage?ID=21", columnas_tabla).get(0).get(0)));
 label.setIcon(icon);
 label.setSize(100, 100);
 */
