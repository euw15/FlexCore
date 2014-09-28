/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.flexdesktop.user.GraphicInterface;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFormattedTextField;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.TableModel;

/**
 *
 * @author Jason Esta clase crea un Listener Personalizado para la Tabla de
 * Factura
 */
public class tableModelListenerAddres implements TableModelListener {

    JTable table;
    // Contiene el valor antiguo que tiene un celda antes de ser cambiado
    private String oldValue;

    tableModelListenerAddres(JTable table, String oldValue, JFormattedTextField total) {
        this.table = table;
        this.oldValue = oldValue;

    }

    @Override
    /**
     * Este metodo detecta un cambio en la tabla y ejecuta varias condiciones.
     */
    public void tableChanged(TableModelEvent e) {

        int row = e.getFirstRow();//row
        int lastRow = e.getLastRow();
        int column = e.getColumn();//column
        tableModelAddres model = (tableModelAddres) e.getSource();
        String columnName = model.getColumnName(column);
        Object data = model.getValueAt(row, column);
        if (data == null) {
            System.out.println("vacio");
            return;
        }
        String info = data.toString();
        String oldValue = this.getOldValue();

        if (columnName.equals("Direcciones")) {
            System.out.println("bien entro en direcciones");

        }

    }

    /**
     * @return the oldValue
     */
    public String getOldValue() {
        return oldValue;
    }

    /**
     * @param oldValue the oldValue to set
     */
    public void setOldValue(String oldValue) {
        this.oldValue = oldValue;
    }

}
