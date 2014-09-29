/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.flexdesktop.user.GraphicInterface;


import java.util.Date;
import javax.swing.table.AbstractTableModel;


/**
 *
 * @author Oscar Montes
 */
public class tableModelGeneric extends AbstractTableModel {
    private String[] columnNames;
    public Object[][] data;
    public tableModelGeneric(String[] columnNames,Object[][] data){
        this.columnNames=columnNames;
        this.data=data;
        
    }
    @Override
    public int getRowCount() {
        return data.length;
    }

    @Override
    public int getColumnCount() {
        return columnNames.length;
    }
    @Override
    public String getColumnName(int col) {
            return columnNames[col];
        }

    @Override
    public Object getValueAt(int row, int col) {
        try {
            return data[row][col];
        } catch (Exception e) {
        }
        return null;
    }
    /**
     *
     * @param row
     * @param col
     * @return
     */
    @Override
    /*
     * Les agrega el tipo de clase a cada columna
     */
    public Class getColumnClass(int c) {
        
            return String.class;
        }
    @Override
     public void setValueAt(Object value, int row, int col) {
        data[row][col] = value;
        fireTableCellUpdated(row, col);
    }
    @Override
    public boolean isCellEditable(int row, int col) {
      
       
            return false;
        
        
    
    
   
   
   
    
}
}
