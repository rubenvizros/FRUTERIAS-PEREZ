/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package javafruteriasperez;

import bbdd.ConexionBD;

/**
 *
 * @author rubenvizros
 */
public class JavaFruteriasPerez {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    }
    
    public static double precio(int idProducto) {
        String[][] result = ConexionBD.select("SELECT price FROM products WHERE product_id = " + idProducto);
        if (result != null && result.length > 0 && result[0].length > 0) {
            String precioStr = result[0][0]; // Obtener el primer elemento del primer array del resultado
            return Double.parseDouble(precioStr); // Convertir el precio a double y devolverlo
        } else {
            System.out.println("No se encontró el precio del producto con ID " + idProducto);
            return 0.0; // Retornar 0.0 si no se encontró el precio
        }
    }
    
    public static String nombre(int idProducto) {
        String[][] result = ConexionBD.select("SELECT name FROM products WHERE product_id = " + idProducto);
        if (result != null && result.length > 0 && result[0].length > 0) {
            String nameStr = result[0][0]; // Obtener el primer elemento del primer array del resultado
            return nameStr; // Devolverlo
        } else {
            System.out.println("No se encontró el nombre del producto con ID " + idProducto);
            return null; // Retornar nulol si no se encontró el precio
        }
    }
    
    public static boolean login(String usr, String pass){
        String[][] result = ConexionBD.select("SELECT user_password FROM logins WHERE username = '" + usr + "'");
        try {
            if (result[0][0].toString().equals(pass)) {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            return false;
        }
    }
}

