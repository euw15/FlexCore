/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.flexdesktop.user.GraphicInterface;

import java.util.ArrayList;

/**
 *
 * @author Jason
 */
public class Frame extends javax.swing.JFrame {

    private static final int OPCION0 = 0;
    private static final int OPCION1 = 1;
    private static final int OPCION2 = 2;
    private static final int OPCION3 = 3;
    private static final int OPCION4 = 4;
    private static final int OPCION5 = 5;
    private static final int OPCION6 = 6;

    /**
     * Creates new form Frame
     */
    public Frame() {
        initComponents();
    }

//    /**
//     * This method is called from within the constructor to initialize the form.
//     * WARNING: Do NOT modify this code. The content of this method is always
//     * regenerated by the Form Editor.
//     */
//    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanelCliente = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTableModuloCltFisico = new javax.swing.JTable();
        jLabelVerSelected = new javax.swing.JLabel();
        jPanelCltJuridico = new javax.swing.JPanel();
        jScrollPane5 = new javax.swing.JScrollPane();
        jTable5 = new javax.swing.JTable();
        jLabelVerSelected1 = new javax.swing.JLabel();
        jPanelCuentas = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTable2 = new javax.swing.JTable();
        jLabelSelectRowCuenta = new javax.swing.JLabel();
        jPanel4 = new javax.swing.JPanel();
        jScrollPane3 = new javax.swing.JScrollPane();
        jTable3 = new javax.swing.JTable();
        jLabel16 = new javax.swing.JLabel();
        jPanelReportes = new javax.swing.JPanel();
        jScrollPane4 = new javax.swing.JScrollPane();
        jTable4 = new javax.swing.JTable();
        jLabel17 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jTableModuloCltFisico.setFont(new java.awt.Font("Calibri Light", 0, 14)); // NOI18N
        jTableModuloCltFisico.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {"   Registrar"},
                {"   Consultar"},
                {"   Ver Listado"},
                {"   Eliminar"},
                {"   Actualizar"},
                {null},
                {null}
            },
            new String [] {
                "Acción"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jTableModuloCltFisico.setGridColor(new java.awt.Color(255, 255, 255));
        jTableModuloCltFisico.setRowHeight(41);
        jScrollPane1.setViewportView(jTableModuloCltFisico);

        jLabelVerSelected.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/Images/Buttons/listBtt.png"))); // NOI18N
        jLabelVerSelected.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jLabelVerSelected.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabelVerSelectedMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanelClienteLayout = new javax.swing.GroupLayout(jPanelCliente);
        jPanelCliente.setLayout(jPanelClienteLayout);
        jPanelClienteLayout.setHorizontalGroup(
            jPanelClienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelClienteLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 740, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelClienteLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabelVerSelected)
                .addGap(24, 24, 24))
        );
        jPanelClienteLayout.setVerticalGroup(
            jPanelClienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelClienteLayout.createSequentialGroup()
                .addGap(30, 30, 30)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 258, Short.MAX_VALUE)
                .addGap(40, 40, 40)
                .addComponent(jLabelVerSelected)
                .addGap(32, 32, 32))
        );

        jTabbedPane1.addTab("    Clientes Físicos    ", jPanelCliente);

        jTable5.setFont(new java.awt.Font("Calibri Light", 0, 14)); // NOI18N
        jTable5.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {"   Registrar"},
                {"   Consultar"},
                {"   Ver Listado"},
                {"   Eliminar"},
                {"   Actualizar"},
                {null},
                {null}
            },
            new String [] {
                "Acción"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jTable5.setGridColor(new java.awt.Color(255, 255, 255));
        jTable5.setRowHeight(41);
        jScrollPane5.setViewportView(jTable5);

        jLabelVerSelected1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/Images/Buttons/listBtt.png"))); // NOI18N
        jLabelVerSelected1.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jLabelVerSelected1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabelVerSelected1MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanelCltJuridicoLayout = new javax.swing.GroupLayout(jPanelCltJuridico);
        jPanelCltJuridico.setLayout(jPanelCltJuridicoLayout);
        jPanelCltJuridicoLayout.setHorizontalGroup(
            jPanelCltJuridicoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelCltJuridicoLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane5, javax.swing.GroupLayout.DEFAULT_SIZE, 801, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelCltJuridicoLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabelVerSelected1)
                .addGap(43, 43, 43))
        );
        jPanelCltJuridicoLayout.setVerticalGroup(
            jPanelCltJuridicoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelCltJuridicoLayout.createSequentialGroup()
                .addGap(29, 29, 29)
                .addComponent(jScrollPane5, javax.swing.GroupLayout.DEFAULT_SIZE, 544, Short.MAX_VALUE)
                .addGap(44, 44, 44)
                .addComponent(jLabelVerSelected1)
                .addGap(29, 29, 29))
        );

        jTabbedPane1.addTab("Cliente Jurídico     ", jPanelCltJuridico);

        jTable2.setFont(new java.awt.Font("Calibri Light", 0, 14)); // NOI18N
        jTable2.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {""},
                {"   Ahorro A La Vista"},
                {""},
                {"   Por Objetivo/ Ahorro Automático"},
                {""},
                {""},
                {""}
            },
            new String [] {
                "Abrir Cuenta"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jTable2.setGridColor(new java.awt.Color(255, 255, 255));
        jTable2.setRowHeight(41);
        jScrollPane2.setViewportView(jTable2);

        jLabelSelectRowCuenta.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/Images/Buttons/listBtt.png"))); // NOI18N
        jLabelSelectRowCuenta.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jLabelSelectRowCuenta.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabelSelectRowCuentaMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanelCuentasLayout = new javax.swing.GroupLayout(jPanelCuentas);
        jPanelCuentas.setLayout(jPanelCuentasLayout);
        jPanelCuentasLayout.setHorizontalGroup(
            jPanelCuentasLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelCuentasLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanelCuentasLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 740, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelCuentasLayout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(jLabelSelectRowCuenta)
                        .addGap(15, 15, 15)))
                .addContainerGap())
        );
        jPanelCuentasLayout.setVerticalGroup(
            jPanelCuentasLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelCuentasLayout.createSequentialGroup()
                .addGap(33, 33, 33)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 273, Short.MAX_VALUE)
                .addGap(31, 31, 31)
                .addComponent(jLabelSelectRowCuenta)
                .addGap(23, 23, 23))
        );

        jTabbedPane1.addTab("     Cuentas     ", jPanelCuentas);

        jTable3.setFont(new java.awt.Font("Calibri Light", 0, 14)); // NOI18N
        jTable3.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {""},
                {"   Afiliar Un Cliente A Un Módulo De Pago"},
                {""}
            },
            new String [] {
                ""
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jTable3.setGridColor(new java.awt.Color(255, 255, 255));
        jTable3.setRowHeight(41);
        jScrollPane3.setViewportView(jTable3);

        jLabel16.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/Images/Buttons/listBtt.png"))); // NOI18N
        jLabel16.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jLabel16.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel16MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane3, javax.swing.GroupLayout.DEFAULT_SIZE, 801, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel16)
                .addGap(22, 22, 22))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(30, 30, 30)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.DEFAULT_SIZE, 549, Short.MAX_VALUE)
                .addGap(37, 37, 37)
                .addComponent(jLabel16)
                .addGap(30, 30, 30))
        );

        jTabbedPane1.addTab("     Pago     ", jPanel4);

        jTable4.setFont(new java.awt.Font("Calibri Light", 0, 14)); // NOI18N
        jTable4.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {"   Transaciones Clientes Jurídica"},
                {"   Transaciones Clientes Físico"},
                {"   Cierres Realizados"},
                {"   Lista De Clientes Por Campos"},
                {"   Lista De Cuentas Por Campos"},
                {"   Bitacora De Errores FlexCore"},
                {"   Lista De Intereses Pagados A Una Cuenta De Ahorro Automático  "}
            },
            new String [] {
                "Reporte"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jTable4.setGridColor(new java.awt.Color(255, 255, 255));
        jTable4.setRowHeight(41);
        jScrollPane4.setViewportView(jTable4);

        jLabel17.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/flexdesktop/Images/Buttons/listBtt.png"))); // NOI18N
        jLabel17.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jLabel17.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel17MouseClicked(evt);
            }
        });

        jLabel12.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel12.setText("Tipo de reporte:");

        javax.swing.GroupLayout jPanelReportesLayout = new javax.swing.GroupLayout(jPanelReportes);
        jPanelReportes.setLayout(jPanelReportesLayout);
        jPanelReportesLayout.setHorizontalGroup(
            jPanelReportesLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelReportesLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel17)
                .addGap(22, 22, 22))
            .addGroup(jPanelReportesLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanelReportesLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane4, javax.swing.GroupLayout.DEFAULT_SIZE, 801, Short.MAX_VALUE)
                    .addGroup(jPanelReportesLayout.createSequentialGroup()
                        .addComponent(jLabel12)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanelReportesLayout.setVerticalGroup(
            jPanelReportesLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelReportesLayout.createSequentialGroup()
                .addGap(4, 4, 4)
                .addComponent(jLabel12, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane4, javax.swing.GroupLayout.DEFAULT_SIZE, 569, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addComponent(jLabel17)
                .addGap(29, 29, 29))
        );

        jTabbedPane1.addTab("     Reportes     ", jPanelReportes);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 826, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane1)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jLabelVerSelectedMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabelVerSelectedMouseClicked

        int selection = jTableModuloCltFisico.getSelectedRow();

        if (selection == OPCION0) {//Si se elige registrar cliente fisico

            getInformation getInfoPanel = getInformation.getDialog();
            getInfoPanel.setActionIcon(10);
            getInfoPanel.showDialog("RegisterClt");

        } else if (selection == OPCION1) {//Si se elige consutar cliente
            getInformation getInfoPanel = getInformation.getDialog();
            getInfoPanel.setActionIcon(0);
            getInfoPanel.showDialog("ConsultarClt");

            getInfoPanel.SetTittle("Consultar Cliente");

        } else if (selection == OPCION2) {
            System.out.println("sfdsnd");
            showCustomers sC = new showCustomers(null, true);
            sC.ocultarBotones("VerListadoAcciones");
            String[] columsNames = {"CIF", "Cédula", "Nombre", "Apellido",
                "Teléfono", "DirecciónPrincipal"};
            sC.setColumName(columsNames);
            sC.showDialog();

        } else if (selection == OPCION3) {
            getInformation getInfoPanel = new getInformation(null, true);
            getInfoPanel.setActionIcon(1);
            //borrar cliente
            getInfoPanel.SetTittle("Eliminar Cliente");
            getInfoPanel.showDialog("ConsultarClt");

        } else if (selection == OPCION4) {

            getInformation getInfoPanel = new getInformation(null, true);
            getInfoPanel.SetTittle("Actualizar Cliente");
            getInfoPanel.setActionIcon(2);
            getInfoPanel.showDialog("ConsultarClt");

        }
    }//GEN-LAST:event_jLabelVerSelectedMouseClicked

    private void jLabelSelectRowCuentaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabelSelectRowCuentaMouseClicked
        int selection = jTable2.getSelectedRow();
        CreateAccount CreateNewAccount = new CreateAccount(null, true);
        if (selection == 1) {//Abrir cuenta ahorro a la vista

            CreateNewAccount.showDialog("CuentaAhorro");

        }
        if (selection == 3) {//Abrir cuenta por objetivo

            CreateNewAccount.showDialog("CuentaPorObjetivo");
        }
    }//GEN-LAST:event_jLabelSelectRowCuentaMouseClicked

    private void jLabel16MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel16MouseClicked
        int selection = jTable3.getSelectedRow();
        ModuloPago ModuloPagoD = new ModuloPago(null, true);
        if (selection == 2) {//Abrir cuenta ahorro a la vista

            ModuloPagoD.showDialog("CuentaAhorro");

        }

    }//GEN-LAST:event_jLabel16MouseClicked

    private void jLabel17MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel17MouseClicked
        int selection = jTable4.getSelectedRow();

        if (selection == OPCION0) {
            System.out.println("transacciones clt juridica");
            getInformation getInfoPanel = getInformation.getSelf();
            getInfoPanel.setActionIcon(7);
            getInfoPanel.showDialog("ConsultarClt");
            getInfoPanel.SetTittle("Indicar Cliente");

        } else if (selection == OPCION1) {
            System.out.println("transaciones clt fisico");
            getInformation getInfoPanel = getInformation.getSelf();
            getInfoPanel.setActionIcon(7);
            getInfoPanel.showDialog("ConsultarClt");
            getInfoPanel.SetTittle("Indicar Cliente");
        } else if (selection == OPCION2) {
            System.out.println("Cierres Realizados");
            showCustomers sC = new showCustomers(null, true);

            //To do
            //Obtener los clientes para esa cedulaSeleccionada
            Object cliente[][] = {{"1", "2011/25/04"}, {"2", "2014/05/08"}};
            String[] colums = {"Número de cierre", "Fecha"};
            sC.setColumName(colums);
            sC.setData(cliente);
            sC.ocultarBotones("VerCierres");
            sC.showDialog();

        } else if (selection == OPCION3) {
            System.out.println("Lista de Clientes x campos");
        } else if (selection == OPCION4) {
            System.out.println("Lista de cuentas x campos");
        } else if (selection == OPCION5) {
            System.out.println("bitacores erroe flex");
        } else if (selection == OPCION6) {
            System.out.println("lista de intereses pagados a una cuenta de ahorro automatic"
                    + "o");
        }
    }//GEN-LAST:event_jLabel17MouseClicked

    private void jLabelVerSelected1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabelVerSelected1MouseClicked
        int selection = jTable5.getSelectedRow();

        if (selection == OPCION0) {
            getInformation getInfoPanel = new getInformation(null, true);
            getInfoPanel.setActionIcon(11);
            getInfoPanel.showDialog("RegisterCltJuridico");

        } else if (selection == OPCION1) {
            getInformation getInfoPanel = new getInformation(null, true);
            getInfoPanel.setActionIcon(12);
            getInfoPanel.showDialog("ConsultarClt");

            getInfoPanel.SetTittle("Consultar Cliente");

        } else if (selection == OPCION2) {
            showCustomers sC = new showCustomers(null, true);
            sC.ocultarBotones("VerListadoAcciones");
            sC.showDialog();

        } else if (selection == OPCION3) {
            getInformation getInfoPanel = new getInformation(null, true);
            getInfoPanel.setActionIcon(1);
            //borrar cliente
            getInfoPanel.SetTittle("Eliminar Cliente");
            getInfoPanel.showDialog("ConsultarClt");

        } else if (selection == OPCION4) {

            getInformation getInfoPanel = new getInformation(null, true);
            getInfoPanel.SetTittle("Actualizar Cliente");
            getInfoPanel.setActionIcon(2);
            getInfoPanel.showDialog("ConsultarClt");

        }
    }//GEN-LAST:event_jLabelVerSelected1MouseClicked

//    /**
//     * @param args the command line arguments
//     */
//    public static void main(String args[]) {
//        /* Set the Nimbus look and feel */
//        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
//        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
//         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
//         */
//        try {
//            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
//                if ("Nimbus".equals(info.getName())) {
//                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
//                    break;
//                }
//            }
//        } catch (ClassNotFoundException ex) {
//            java.util.logging.Logger.getLogger(Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (InstantiationException ex) {
//            java.util.logging.Logger.getLogger(Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (IllegalAccessException ex) {
//            java.util.logging.Logger.getLogger(Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
//            java.util.logging.Logger.getLogger(Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        }
//        //</editor-fold>
//
//        /* Create and display the form */
//        java.awt.EventQueue.invokeLater(new Runnable() {
//            public void run() {
//                new Frame().setVisible(true);
//            }
//        });
//    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabelSelectRowCuenta;
    private javax.swing.JLabel jLabelVerSelected;
    private javax.swing.JLabel jLabelVerSelected1;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanelCliente;
    private javax.swing.JPanel jPanelCltJuridico;
    private javax.swing.JPanel jPanelCuentas;
    private javax.swing.JPanel jPanelReportes;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JScrollPane jScrollPane5;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JTable jTable2;
    private javax.swing.JTable jTable3;
    private javax.swing.JTable jTable4;
    private javax.swing.JTable jTable5;
    private javax.swing.JTable jTableModuloCltFisico;
    // End of variables declaration//GEN-END:variables
}
