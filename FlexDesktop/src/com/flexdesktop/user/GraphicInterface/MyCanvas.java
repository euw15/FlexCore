/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.flexdesktop.user.GraphicInterface;

import java.awt.Graphics;
import java.awt.Toolkit;
import javax.swing.JComponent;

/**
 *
 * @author Jason
 */
class MyCanvas extends JComponent {

    @Override
    public void paint(Graphics g) {
        java.awt.Image img1 = Toolkit.getDefaultToolkit().getImage("C:/Users/Jason/Documents/GitHub/FlexCore/FlexDesktop/src/com/flexdesktop/user/Images/hecho.png");
        System.out.println("Entro al paint de myCanvas");
        int width = img1.getWidth(this);
        int height = img1.getHeight(this);
        System.out.println(width);
        System.out.println(height);

        int scale = 1000;
        int w = scale * width;
        int h = scale * height;
        // explicitly specify width (w) and height (h)
        g.drawImage(img1, 10, 10, (int) w, (int) h, this);

    }



}
