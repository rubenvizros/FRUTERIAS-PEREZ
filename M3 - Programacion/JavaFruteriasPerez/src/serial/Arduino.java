/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package serial;

import com.fazecast.jSerialComm.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rubenvizros
 */
public class Arduino {
    
    //Funcion que guarda el puerto SERIE donde esta conectado el arduino.
    public static SerialPort arduino = null;
    
    //Funcion que controla la conexion con el arduino
    public static void ArduinoConection(boolean mode) { //MODE == True abrir ; FALSE abrir
        if (mode) {
            boolean arduinoInit = false;
            SerialPort[] ports = SerialPort.getCommPorts();
            //SerialPort arduino = null;
            for (int i = 0; i < ports.length; i++) {
                System.out.println(ports[i]);
                if (ports[i].toString().contains("Arduino Uno")) {
                    arduino = ports[i];
                }            
            }

            if (arduino == null) {
                System.out.println("El arduino no esta conectado!");
            }else{
                boolean arduinoReady = false;
                try {
                    System.out.println("Puerto serie seleccionado: " + arduino);
                    arduino.openPort(10);
                    arduino.setBaudRate(9600);
                    arduino.setComPortTimeouts(SerialPort.TIMEOUT_READ_SEMI_BLOCKING, 0, 0);
                } catch (Exception e) {
                    System.out.println("La conexion con el arduino Fallo. Puede que otro programa lo este usando.");
                }


                while (!arduinoReady){
                    InputStream arduinoIn = arduino.getInputStream();
                    
                    try {
                        if ((char)arduinoIn.read() == 'G') {
                            arduinoReady = true;
                        }
                    } catch (IOException ex) {
                        Logger.getLogger(Arduino.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
        }
//CODIGO EXTRAIDO A LA FUNCION SEND()
        }else{
            arduino.closePort(); 
        } 
    }  
    
    /*Funcion que se encarga de enviar strings al arduino */
    public static void send(String stringEnviar) {
            if (arduino != null) {
                String productString = stringEnviar + "\n";
                byte[] writeBuffer = productString.getBytes();
                arduino.writeBytes(writeBuffer, writeBuffer.length);
        }
    }
}
