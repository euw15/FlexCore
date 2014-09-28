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
 * @author Oscar Montes
 * Esta clase crea un Listener Personalizado para la Tabla de Factura
 */
public class MyTableModelListener_FACT implements TableModelListener {
    JTable table;
    // Contiene el valor antiguo que tiene un celda antes de ser cambiado
    private String oldValue; 
   
    //Es el TextField que va a guardar los datos segun lo que pase en la tabla
    private JFormattedTextField total;

  MyTableModelListener_FACT(JTable table,String oldValue,JFormattedTextField total
        ) {
    this.table = table;
    this.oldValue=oldValue;
   
    this.total=total;
    
  }

  @Override
  /**
   * Este metodo detecta un cambio en la tabla y ejecuta varias condiciones.
   */
  public void tableChanged(TableModelEvent e) {
      
      int row = e.getFirstRow();//row
      int lastRow = e.getLastRow();
      int column = e.getColumn();//column
      MyTableModel_FACT model = (MyTableModel_FACT) e.getSource();
      String columnName = model.getColumnName(column);
      Object data = model.getValueAt(row, column);
      if(data==null){
          return;
      }
      String info = data.toString();
   
 
             
     
      
      //Esta condicion es para cuando se modifica un dirrecion
      if (columnName.equals("Dirrecion") ) {
          String CantidadSinCorregir= model.getValueAt(row, 2).toString();
          DecimalFormat decimalfC = (DecimalFormat) NumberFormat.getInstance();
          decimalfC.setParseBigDecimal(true);
          BigDecimal cantidad = null;
          try {
              cantidad = (BigDecimal) decimalfC.parseObject(CantidadSinCorregir);
          } catch (ParseException ex) {
              Logger.getLogger(MyTableModelListener_FACT.class.getName()).
                      log(Level.SEVERE, null, ex);
          }
          
          model.setValueAt(7, row, column + 1);          
      }          
      
      

          
              // Por si el usuario no deja nada en la celda y ya tenia un cod
          // de un articulo entonces hace que se mantega el que ya estaba
          if (info.equals("") & !oldValue.equals("")) {
              model.setValueAt(oldValue, row, 0);
              return;

          }

      }
        

        
  }

   

