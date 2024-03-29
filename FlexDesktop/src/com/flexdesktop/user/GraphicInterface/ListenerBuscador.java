/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.flexdesktop.user.GraphicInterface;

import java.util.regex.PatternSyntaxException;
import javax.swing.JTextField;
import javax.swing.RowFilter;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

/**
 *
 * @author Oscar Montes
 * Esta clase genera el Buscador que se implementa en un JtextField
 */
public class ListenerBuscador implements DocumentListener {
    JTextField buscador;
    TableRowSorter<TableModel> ordenador;
    int columna;
    boolean busquetodos = true;
    
    public ListenerBuscador(JTextField buscador,TableRowSorter<TableModel> ordenador){
        this.buscador=buscador;
        this.ordenador=ordenador;
        
        
    }
    
    public ListenerBuscador(JTextField buscador,TableRowSorter<TableModel> ordenador,int columna){
        this.buscador=buscador;
        this.ordenador=ordenador;
        this.columna=columna;
        this.busquetodos = false;
        
    }

    @Override
    public void insertUpdate(DocumentEvent de) {
        searchFieldChangedUpdate(de);
    }

    @Override
    public void removeUpdate(DocumentEvent de) {
        searchFieldChangedUpdate(de);
    }

    @Override
    public void changedUpdate(DocumentEvent de) {
        searchFieldChangedUpdate(de);
    }

    private void searchFieldChangedUpdate(DocumentEvent de) {
        try {
            String text = this.buscador.getText();
            if (text.length() == 0) {
                this.ordenador.setRowFilter(null);
            }
            else
            {
                try{
                    if(busquetodos){
                    this.ordenador.setRowFilter(RowFilter.regexFilter("(?i)" + text));}
                    else{
                        this.ordenador.setRowFilter(RowFilter.regexFilter("(?i)" + text,columna));
                    
                    }
                    
                }catch(PatternSyntaxException e) {
                    System.out.println("un error de sintaxis");
                }
            }
        }catch(Exception e) {
            System.out.println("no se pudo ordenar");
        }
    }
    
    
}
