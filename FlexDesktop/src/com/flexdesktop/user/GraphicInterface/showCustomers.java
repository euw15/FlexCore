/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.flexdesktop.user.GraphicInterface;

import com.flexdesktop.user.Error.InfError;

import java.awt.Point;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.swing.DefaultListModel;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.RowSorter;
import javax.swing.SortOrder;
import javax.swing.Timer;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

/**
 *
 * @author Melvin
 */
public class showCustomers extends javax.swing.JDialog {

    /**
     * Creates new form EditRoutes
     *
     * @param parent
     * @param modal
     */
    private final String[] ColumName = {"Cedula", "Nombre", "Apellido"};

    Object data2[][] = {{"503890620", "Jason", "Salazar"},
    {"3564874", "Daniel", "Canessa"}, {"2548745", "Edwar", "Umana"},
    {"245784", "Melvin", "Guitierrez"}, {"503890620", "Jason", "Salazar"},
    {"3564874", "Daniel", "Canessa"}, {"2548745", "Edwar", "Umana"},
    {"245784", "Melvin", "Guitierrez"}, {"503890620", "Jason", "Salazar"},
    {"3564874", "Daniel", "Canessa"}, {"2548745", "Edwar", "Umana"},
    {"245784", "Melvin", "Guitierrez"}, {"503890620", "Jason", "Salazar"},
    {"3564874", "Daniel", "Canessa"}, {"2548745", "Edwar", "Umana"},
    {"245784", "Melvin", "Guitierrez"}, {"503890620", "Jason", "Salazar"},
    {"3564874", "Daniel", "Canessa"}, {"2548745", "Edwar", "Umana"}};
    private int numeroDePaginas = 0;
    private int paginalActual = 1;
    

    public showCustomers(java.awt.Frame parent, boolean modal) {

        super(parent, modal);
        initComponents();
        setLocationRelativeTo(parent);

        upDateCostumers();

        //****************
        setNumeroDePaginas(6);
        initPaginacion();
        //*****************

    }

    public void showDialog(String panel) {

        final Timer timer = new Timer(30, null);
        timer.setRepeats(true);
        timer.addActionListener(new ActionListener() {
            private float opacity = 0;

            @Override
            public void actionPerformed(ActionEvent e) {
                opacity += 0.15f;
                setOpacity(Math.min(opacity, 1));
                if (opacity >= 1) {
                    timer.stop();
                }
            }
        });
        setOpacity(0);
        timer.start();

        // setVisiblePanel(panel);
        setVisible(true);

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        ListadoClt = new javax.swing.JPanel();
        jButton5 = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jButton6 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable_Generica = new javax.swing.JTable();
        TextField_Buscador = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabelPag3 = new javax.swing.JLabel();
        jLabelPag4 = new javax.swing.JLabel();
        jLabelPag5 = new javax.swing.JLabel();
        jLabelPuntos = new javax.swing.JLabel();
        jLabelUltimoPag = new javax.swing.JLabel();
        jLabelPag2 = new javax.swing.JLabel();
        jLabelPag1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setMaximumSize(new java.awt.Dimension(760, 550));
        setMinimumSize(new java.awt.Dimension(760, 550));
        setUndecorated(true);

        ListadoClt.setBackground(new java.awt.Color(255, 255, 255));
        ListadoClt.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        ListadoClt.setMaximumSize(new java.awt.Dimension(700, 500));
        ListadoClt.setMinimumSize(new java.awt.Dimension(700, 500));
        ListadoClt.setPreferredSize(new java.awt.Dimension(700, 500));
        ListadoClt.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
            public void mouseDragged(java.awt.event.MouseEvent evt) {
                ListadoCltMouseDragged(evt);
            }
        });
        ListadoClt.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                ListadoCltMousePressed(evt);
            }
        });

        jButton5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/atras.png"))); // NOI18N
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });

        jLabel3.setBackground(new java.awt.Color(255, 255, 255));
        jLabel3.setFont(new java.awt.Font("Khmer UI", 0, 13)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(102, 102, 102));
        jLabel3.setText("Datos De Cliente");

        jLabel8.setFont(new java.awt.Font("Khmer UI", 0, 18)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(102, 102, 102));
        jLabel8.setText("Lista de Clientes");

        jButton6.setBackground(new java.awt.Color(255, 255, 255));
        jButton6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/close2.png"))); // NOI18N
        jButton6.setContentAreaFilled(false);
        jButton6.setFocusable(false);
        jButton6.setOpaque(true);
        jButton6.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/close2_roller.png"))); // NOI18N
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });

        jTable_Generica.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        jTable_Generica.setFillsViewportHeight(true);
        jTable_Generica.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable_GenericaMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable_Generica);

        TextField_Buscador.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                TextField_BuscadorActionPerformed(evt);
            }
        });

        jLabel1.setText("Buscar:");

        jLabel4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/System/Images/Buttons/watchBtt.png"))); // NOI18N
        jLabel4.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel4.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel4MouseClicked(evt);
            }
        });

        jLabel5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/System/Images/Buttons/editBtt.png"))); // NOI18N
        jLabel5.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel5.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel5MouseClicked(evt);
            }
        });

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/back.png"))); // NOI18N
        jLabel2.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                jLabel2MouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                jLabel2MouseExited(evt);
            }
        });

        jLabel6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/System/Images/Buttons/trashBtt.png"))); // NOI18N
        jLabel6.setToolTipText("Borrar factura seleccionada");
        jLabel6.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jLabel6.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel6MouseClicked(evt);
            }
        });

        jLabel7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/next.png"))); // NOI18N
        jLabel7.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                jLabel7MouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                jLabel7MouseExited(evt);
            }
        });

        jLabelPag3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/pagina.png"))); // NOI18N
        jLabelPag3.setText("3");
        jLabelPag3.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);

        jLabelPag4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/pagina.png"))); // NOI18N
        jLabelPag4.setText("4");
        jLabelPag4.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);

        jLabelPag5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/pagina.png"))); // NOI18N
        jLabelPag5.setText("5");
        jLabelPag5.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);

        jLabelPuntos.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/PuntosSusp.png"))); // NOI18N

        jLabelUltimoPag.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/pagina.png"))); // NOI18N
        jLabelUltimoPag.setText("6");
        jLabelUltimoPag.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);

        jLabelPag2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/pagina.png"))); // NOI18N
        jLabelPag2.setText("2");
        jLabelPag2.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);

        jLabelPag1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/paginaSelected.png"))); // NOI18N
        jLabelPag1.setText("1");
        jLabelPag1.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);

        javax.swing.GroupLayout ListadoCltLayout = new javax.swing.GroupLayout(ListadoClt);
        ListadoClt.setLayout(ListadoCltLayout);
        ListadoCltLayout.setHorizontalGroup(
            ListadoCltLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(ListadoCltLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel8)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(20, 20, 20)
                .addComponent(TextField_Buscador, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(115, 115, 115)
                .addComponent(jButton6, javax.swing.GroupLayout.PREFERRED_SIZE, 21, javax.swing.GroupLayout.PREFERRED_SIZE))
            .addGroup(ListadoCltLayout.createSequentialGroup()
                .addGap(13, 13, 13)
                .addGroup(ListadoCltLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(ListadoCltLayout.createSequentialGroup()
                        .addGap(10, 10, 10)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 718, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 336, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(14, Short.MAX_VALUE))
            .addGroup(ListadoCltLayout.createSequentialGroup()
                .addGap(32, 32, 32)
                .addComponent(jLabel5)
                .addGap(33, 33, 33)
                .addComponent(jLabel4)
                .addGap(31, 31, 31)
                .addComponent(jLabel6)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(ListadoCltLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, ListadoCltLayout.createSequentialGroup()
                        .addComponent(jLabelPag1)
                        .addGap(18, 18, 18)
                        .addComponent(jLabelPag2)
                        .addGap(12, 12, 12)
                        .addComponent(jLabelPag3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabelPag4)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabelPag5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabelPuntos)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabelUltimoPag)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel7)
                        .addGap(44, 44, 44))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, ListadoCltLayout.createSequentialGroup()
                        .addComponent(jButton5, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap())))
        );
        ListadoCltLayout.setVerticalGroup(
            ListadoCltLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(ListadoCltLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(ListadoCltLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButton6)
                    .addGroup(ListadoCltLayout.createSequentialGroup()
                        .addGroup(ListadoCltLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(ListadoCltLayout.createSequentialGroup()
                                .addGap(24, 24, 24)
                                .addGroup(ListadoCltLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(TextField_Buscador, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel1))))
                        .addGap(13, 13, 13)
                        .addComponent(jLabel3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 345, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGroup(ListadoCltLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(ListadoCltLayout.createSequentialGroup()
                        .addGap(6, 6, 6)
                        .addComponent(jLabel7)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jButton5, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(ListadoCltLayout.createSequentialGroup()
                        .addGroup(ListadoCltLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(ListadoCltLayout.createSequentialGroup()
                                .addGap(18, 18, 18)
                                .addGroup(ListadoCltLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(jLabel5)
                                    .addComponent(jLabel4)
                                    .addComponent(jLabel6)))
                            .addGroup(ListadoCltLayout.createSequentialGroup()
                                .addGap(25, 25, 25)
                                .addGroup(ListadoCltLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel2)
                                    .addGroup(ListadoCltLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                        .addComponent(jLabelPag2)
                                        .addComponent(jLabelPag3)
                                        .addComponent(jLabelPag4)
                                        .addComponent(jLabelPag5)
                                        .addComponent(jLabelPuntos)
                                        .addComponent(jLabelUltimoPag)
                                        .addComponent(jLabelPag1)))))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(ListadoClt, javax.swing.GroupLayout.PREFERRED_SIZE, 757, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(ListadoClt, javax.swing.GroupLayout.DEFAULT_SIZE, 550, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void ListadoCltMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_ListadoCltMousePressed
        // TODO add your handling code here:
    }//GEN-LAST:event_ListadoCltMousePressed

    private void ListadoCltMouseDragged(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_ListadoCltMouseDragged
        // TODO add your handling code here:
    }//GEN-LAST:event_ListadoCltMouseDragged

    private void jLabel6MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel6MouseClicked

        String[] options = {"Aceptar", "Cancelar"};
        int selection = JOptionPane.showOptionDialog(this,
                "Desea eliminar el Cliente", "¡Atención!", 0, 0,
                null, options, 0);
        if (selection == 0) {
            this.eliminar(this.jTable_Generica);
            this.fillTableCostumer();
        }
    }//GEN-LAST:event_jLabel6MouseClicked

    private void jLabel5MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel5MouseClicked
        //datos de prueba
        String name = "name";
        String lastName = "latsName";
        String ced = "ced";
        List<Object[]> dir = new ArrayList<Object[]>();
        Object dire[] = {"Por ahi"};
        Object dire2[] = {"CuatroFilosDeCuchilloMocho"};
        dir.add(dire);
        dir.add(dire2);
        ////--------------------------------------
        getInformation getInfoPanel = new getInformation(null, true);
        getInfoPanel.setEditableInfoCostumer(name, lastName, ced, dir);
        getInfoPanel.showDialog("RegisterClt");
    }//GEN-LAST:event_jLabel5MouseClicked

    private void jLabel4MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel4MouseClicked

        String ced = jTable_Generica.getValueAt(
                jTable_Generica.getSelectedRow(), 0).toString();

        String name = jTable_Generica.getValueAt(
                jTable_Generica.getSelectedRow(), 1).toString();
        String lastName = jTable_Generica.getValueAt(
                jTable_Generica.getSelectedRow(), 2).toString();

        getInformation getInfoPanel = new getInformation(null, true);
        getInfoPanel.setInfoClt(ced, name, lastName);
        getInfoPanel.showDialog("VerClt");
    }//GEN-LAST:event_jLabel4MouseClicked

    private void TextField_BuscadorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_TextField_BuscadorActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_TextField_BuscadorActionPerformed

    private void jTable_GenericaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable_GenericaMouseClicked
        if (evt.getClickCount() == 2) {
            //            this.jButton_AceptarBusqueda.doClick();
        }
    }//GEN-LAST:event_jTable_GenericaMouseClicked

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        dispose();
    }//GEN-LAST:event_jButton6ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        dispose();
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jLabel7MouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel7MouseEntered
        jLabel7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/nextShadow.png")));
    }//GEN-LAST:event_jLabel7MouseEntered

    private void jLabel7MouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel7MouseExited
        jLabel7.setIcon(new javax.swing.ImageIcon(getClass().
                getResource("/com/flexdesktop/user/Images/next.png")));

    }//GEN-LAST:event_jLabel7MouseExited

    private void jLabel2MouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel2MouseEntered
        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/backShadow.png")));
    }//GEN-LAST:event_jLabel2MouseEntered

    private void jLabel2MouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel2MouseExited
        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/user/Images/back.png")));
    }//GEN-LAST:event_jLabel2MouseExited


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel ListadoClt;
    private javax.swing.JTextField TextField_Buscador;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton6;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabelPag1;
    private javax.swing.JLabel jLabelPag2;
    private javax.swing.JLabel jLabelPag3;
    private javax.swing.JLabel jLabelPag4;
    private javax.swing.JLabel jLabelPag5;
    private javax.swing.JLabel jLabelPuntos;
    private javax.swing.JLabel jLabelUltimoPag;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable_Generica;
    // End of variables declaration//GEN-END:variables

    private void configureTableLook() {
//        DefaultTableCellRenderer centerRender = new DefaultTableCellRenderer();
//        centerRender.setHorizontalAlignment(JLabel.LEFT);
//
//        table.setRowHeight(25);
//        table.getColumnModel().getColumn(0).setPreferredWidth(60);
//
//        table.getColumnModel().getColumn(1).setPreferredWidth(10);
//        table.getColumnModel().getColumn(0).setCellRenderer(centerRender);
//        //  table.getColumnModel().getColumn(1).setCellRenderer(centerRender);
//
//        TableCellRenderer rendererFromHeader = table.getTableHeader().getDefaultRenderer();
//        JLabel headerLabel = (JLabel) rendererFromHeader;
//        headerLabel.setHorizontalAlignment(JLabel.LEFT);
//
//        table.getTableHeader().setFont(new Font("Khmer UI", Font.PLAIN, 14));
//        table.getTableHeader().setForeground(new Color(102, 102, 102));
    }

    private boolean validateUI() {

//        for (int i = 0; i < table.getRowCount() - 1; i++) {
//            boolean parseBoolean = Boolean.parseBoolean(table.getValueAt(i, 1).toString());
//            if (parseBoolean) {
//                return true;
//            }
//        }
        return true;
    }

    private void showPanelOnDialog(javax.swing.JPanel pPanel, javax.swing.JDialog pDialog) {
        pDialog.add(pPanel);
        pPanel.setVisible(true);
        pDialog.setVisible(true);
    }

    private void setVisiblePanel(String panel) {
        removePanels();
        switch (panel) {
//            case "RegisterClt":
//                add(registerClt);
//                registerClt.setVisible(true);
//            case "ConsultarClt":
//                add(ConsultarClt);
//                ConsultarClt.setVisible(true);
        }

    }

    public void removePanels() {
        //registerClt.setVisible(false);
        ListadoClt.setVisible(false);
//        remove(registerClt);
//
//        remove(ConsultarClt);
    }

//    public void completarTablaFacturacion() {
//        //Crea la tabla generica para Facturas
//
//        MyTableModel_FACT model = new MyTableModel_FACT(columnNames, data2, true);
//        this.table1.setModel(
//                model);
////        this.table1.setModel(new Modelo_Facturacion(columnNames, data));
//        //Alinea la primer columna de esta tabla hacia el centro
//        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
//      model.removeRow(1);
//        this.table1.getColumnModel()
//                .getColumn(0).setCellRenderer(centerRenderer);
//    }
//    private void eliminarFila(JTable table) {
//        try {
//            tableModelAddres model = (tableModelAddres) table.getModel();
//            int row = table.getSelectedRow();
//            ///Si se esta escribiendo en la celda para el editor y luego elimina la
//            // fila
//            if (!model.data.isEmpty()) {
//                if (table.isEditing()) {
//                    table.getCellEditor().cancelCellEditing();
//                    table.revalidate();
//                    table.repaint();
//                    table.requestFocus();
//
//                }
//
//                model.removeRow(row);
//                table.changeSelection(row - 1, 0, false, false);
//                table.revalidate();
//                table.repaint();
//                table.requestFocus();
//            }
//            if (model.data.isEmpty()) {
//                model.addRow(1);
//            }
//        } catch (Exception e) {
//        }
//
//    }
    private void addRow(JTable table) {
        try {
            tableModelAddres model = (tableModelAddres) table.getModel();

            ///Si se esta escribiendo en la celda para el editor 
            //y luego elimina la fila
            if (!model.data.isEmpty()) {
                if (table.isEditing()) {
                    table.getCellEditor().cancelCellEditing();
                    table.revalidate();
                    table.repaint();
                    table.requestFocus();

                }
            }
            model.addRow(1);
            table.revalidate();
            table.repaint();
            table.requestFocus();
        } catch (Exception e) {
        }

    }

    public void upDateCostumers() {
//        AdminBD.consultarClientes();
//        data = AdminBD.getData();
//        String[] columnNames = AdminBD.getColumnNames();

        this.jTable_Generica.setModel(new tableModelGeneric(ColumName, data2));
        //Crea el ordenador para la tabla generica
        TableRowSorter<TableModel> ordenador = new TableRowSorter<TableModel>(this.jTable_Generica.getModel());
        this.jTable_Generica.setRowSorter(ordenador);
        Vector<RowSorter.SortKey> qq = new Vector<RowSorter.SortKey>();
        qq.add(new RowSorter.SortKey(0, SortOrder.ASCENDING));
        ordenador.setSortKeys(qq);
        jTable_Generica.requestFocus();
        jTable_Generica.changeSelection(0, 0, false, false);
        /**
         * Agrega el listener al JtextField del buscador *
         */
        this.TextField_Buscador.getDocument().addDocumentListener(new ListenerBuscador(this.TextField_Buscador, ordenador));

    }

    private void eliminar(JTable table) {

        int row = table.getSelectedRow();
        if (row < 0) {

            JOptionPane.showMessageDialog(
                    null,
                    "No ha selecionado un cliente",
                    "Alert!", JOptionPane.ERROR_MESSAGE);
            return;

        }
        String cedula = table.getValueAt(row, 0).toString();

        //Eliminar el cliente con la cedula 'cedula'
    }

    public void fillTableCostumer() {

        //Realiza la consulta para obtener las los clientes a mostrar
        /**
         * **
         *///
        this.jTable_Generica.setModel(new tableModelGeneric(ColumName, data2));
        //Alinea la primer columna de esta tabla hacia el centro
        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();

        this.jTable_Generica.getColumnModel().getColumn(0).
                setCellRenderer(centerRenderer);
    }

    /**
     * Permite mostrar graficamente el numero de paginas que hay
     *
     * @param numeroDePaginas
     */
    private void initPaginacion() {
        if (numeroDePaginas > 6) {
            jLabelUltimoPag.setText("" + numeroDePaginas);
        } else {
            ocultarPaginas();
            if (numeroDePaginas >= 1) {
                this.jLabelPag1.setVisible(true);
                if (numeroDePaginas >= 2) {
                    this.jLabelPag2.setVisible(true);
                    if (numeroDePaginas >= 3) {
                        this.jLabelPag3.setVisible(true);

                        if (numeroDePaginas >= 4) {
                            this.jLabelPag4.setVisible(true);

                            if (numeroDePaginas >= 5) {
                                this.jLabelPag5.setVisible(true);

                            }

                        }

                    }

                }
            }

        }

    }

    private void ocultarPaginas() {
        this.jLabelUltimoPag.setVisible(false);
        this.jLabelPag1.setVisible(false);
        this.jLabelPag2.setVisible(false);
        this.jLabelPag3.setVisible(false);
        this.jLabelPag4.setVisible(false);
        this.jLabelPag5.setVisible(false);
        this.jLabelPuntos.setVisible(false);
    }

    /**
     * @return the numeroDePaginas
     */
    public int getNumeroDePaginas() {
        return numeroDePaginas;
    }

    /**
     * @param numeroDePaginas the numeroDePaginas to set
     */
    public void setNumeroDePaginas(int numeroDePaginas) {
        this.numeroDePaginas = numeroDePaginas;
    }

    /**
     * @return the paginalActual
     */
    public int getPaginalActual() {
        return paginalActual;
    }

    /**
     * @param paginalActual the paginalActual to set
     */
    public void setPaginalActual(int paginalActual) {
        this.paginalActual = paginalActual;
    }
}
