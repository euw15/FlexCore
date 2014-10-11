/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flexpos;

import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;
import gnu.io.UnsupportedCommOperationException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.TooManyListenersException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Melvin
 */
public class ArduinoPOS implements SerialPortEventListener {

    private OutputStream output;
    private InputStream input;
    private SerialPort arduinoPort;
    private CommPort portCOM;
    private CommPortIdentifier serialPort;
    private BufferedReader inputBuff;
    private String portName;
    private boolean Connected;

    public boolean isConnected() {
        return Connected;
    }

    private ArduinoPOS() {

    }

    public void setPortName(String portName) {
        this.portName = portName;
    }

    public void initialize() throws TooManyListenersException {
        try {
            serialPort = CommPortIdentifier.getPortIdentifier(portName);

            if (serialPort.isCurrentlyOwned()) {
                System.out.println("Error Used Port");
            } else {

                portCOM = serialPort.open(this.getClass().getName(), 2000);

                if (portCOM instanceof SerialPort) {

                    arduinoPort = (SerialPort) portCOM;

                    arduinoPort.setSerialPortParams(9600,
                            SerialPort.DATABITS_8,
                            SerialPort.STOPBITS_1,
                            SerialPort.PARITY_NONE);
                    output = arduinoPort.getOutputStream();
                    input = arduinoPort.getInputStream();

                    inputBuff = new BufferedReader(new InputStreamReader(arduinoPort.getInputStream()));

                    // add event listeners
                    arduinoPort.addEventListener(this);
                    arduinoPort.notifyOnDataAvailable(true);

                    Connected = true;

                } else {
                    System.out.println("Error Only Serial Ports");
                }
            }
        } catch (NoSuchPortException | PortInUseException | UnsupportedCommOperationException | IOException e) {
            close();
            Connected = false;
        }

    }

    public synchronized void close() {
        if (arduinoPort != null) {
            arduinoPort.removeEventListener();
            arduinoPort.close();
        }
    }

    @Override
    public synchronized void serialEvent(SerialPortEvent oEvent) {

        if (oEvent.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
            try {
                String inputLine = inputBuff.readLine();             
                System.out.println(inputLine);
            } catch (Exception e) {
                System.out.println("No hay info");
            }
        }
    }

    public static ArduinoPOS getInstance() {
        return ArduinoPOSHolder.INSTANCE;
    }

    private static class ArduinoPOSHolder {
        private static final ArduinoPOS INSTANCE = new ArduinoPOS();
    }

    
    void send(String text) {
        try {
            output.write("Cobrar".getBytes());
            Thread.sleep(1500);
            output.write(text.getBytes());
        } catch (IOException ex) {
            System.out.println("Error al enviar informacion");
        } catch (InterruptedException ex) {
            Logger.getLogger(ArduinoPOS.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
