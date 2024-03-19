/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package gui;


import java.awt.Color;
import serial.Arduino;
import bbdd.ConexionBD;
import javafruteriasperez.JavaFruteriasPerez;
import java.sql.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;

/**
 *
 * @author rubenvizros
 */

public class JFrameGUI extends javax.swing.JFrame {

    /**
     * Creates new form JFrameGUI
     */
    private JFrameGUI mainFrame;
    public JFrameGUI() {
        initComponents();
        mainFrame = this;
        config();
        test();
    }
    
    public void config(){
        this.setLocationRelativeTo(null);
        Arduino.ArduinoConection(true);
//        cargarProductos();
    }
      
    public void test(){
        /*ESTO VA A JODERSE DE UNA FORMA INCREIBLE*/
            Thread  cargarProductosThread = new Thread(new Runnable(){
                @Override
                public void run(){
                    cargarProductos();
                }
            });
            cargarProductosThread.start();
    }
   

    private void cargarProductos() {
        try {
            // Conexión a la base de datos
            System.out.println("Thread is running");
            Connection conn = ConexionBD.getConnection();
            if (conn != null) {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT product_id, name, image_URL FROM products");

                // Recorre los resultados y agrega componentes al JPanel1 para cada producto
                GridLayout gridLayout = new GridLayout(0, 8);
                gridLayout.setHgap(10);
                gridLayout.setVgap(10);

                // Asigna el GridLayout al JPanel1
                jPanel1.setLayout(gridLayout);
                while (rs.next()) {
                    int idProducto = rs.getInt("product_id");
                    String nombreProducto = rs.getString("name");
                    String imagenProducto = rs.getString("image_URL"); // Supongamos que la columna imagen es una URL

                    // Crea un JPanel para contener cada producto (nombre e imagen)
                    JPanel productoPanel = new JPanel();
                    productoPanel.setLayout(new BorderLayout());

                    // Crea un JLabel para el nombre del producto y lo añade al JPanel del producto
                    JLabel nombreLabel = new JLabel(nombreProducto);
                    productoPanel.add(nombreLabel, BorderLayout.NORTH);

                    try {
                        // Crea un JLabel para la imagen del producto y lo añade al JPanel del producto
                        URL url = new URL(imagenProducto);
                        BufferedImage myPicture = ImageIO.read(url);
                        JLabel picLabel = new JLabel(new ImageIcon(myPicture.getScaledInstance(99, 99, WIDTH)));
                        
                        picLabel.addMouseListener(new MouseAdapter() {
                        @Override
                        public void mouseClicked(MouseEvent e) {
                            
                            listaManager(JavaFruteriasPerez.nombre(idProducto), JavaFruteriasPerez.precio(idProducto));
                        }
                    });
                        
                        productoPanel.add(picLabel);
                        
                    } catch (IOException ex) {
                        System.out.println("Error cargando la imagen");
                        Logger.getLogger(JFrameGUI.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    // Agrega el JPanel del producto al JPanel1
                    jPanel1.add(productoPanel);
                }

                // Hace que el JPanel1 vuelva a validar su diseño y se muestre correctamente
                jPanel1.revalidate();
                jPanel1.repaint();

                // Cierra los recursos
                rs.close();
                stmt.close();
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //----------------------------------------------------------
    
    /**
     * This method is called from within the constructor to initialize the form. WARNING: Do NOT modify this code. The content of this method is always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jFrameCaja = new javax.swing.JFrame();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextPane1 = new javax.swing.JTextPane();
        jLabelTotal = new javax.swing.JLabel();
        jTextFieldTotal = new javax.swing.JTextField();
        jButtonOptionMode = new javax.swing.JButton();
        jPanel1 = new javax.swing.JPanel();
        jLabelLogo = new javax.swing.JLabel();
        jButtonEndShop = new javax.swing.JButton();
        jDialog1 = new javax.swing.JDialog();
        jLabelShopCorrecto = new javax.swing.JLabel();
        jButtonCloseDialog = new javax.swing.JButton();
        jPanelBackGround = new javax.swing.JPanel();
        jPanelLogin = new javax.swing.JPanel();
        LogoImage = new javax.swing.JLabel();
        jLabelUser = new javax.swing.JLabel();
        jTextFieldUsername = new javax.swing.JTextField();
        jLabelPassword = new javax.swing.JLabel();
        jButtonLoginButton = new javax.swing.JButton();
        jPasswordField = new javax.swing.JPasswordField();
        jLabelUserImage = new javax.swing.JLabel();
        jLabelIconoPaswd = new javax.swing.JLabel();

        jFrameCaja.setTitle("Fruterias Perez - Caja");
        jFrameCaja.setResizable(false);
        jFrameCaja.setSize(new java.awt.Dimension(1330, 820));
        jFrameCaja.addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                jFrameCajaWindowClosing(evt);
            }
        });

        jTextPane1.setEditable(false);
        jTextPane1.setMaximumSize(new java.awt.Dimension(62, 20));
        jScrollPane1.setViewportView(jTextPane1);

        jLabelTotal.setFont(new java.awt.Font("Segoe UI Black", 1, 18)); // NOI18N
        jLabelTotal.setText("Total: ");

        jTextFieldTotal.setEditable(false);
        jTextFieldTotal.setFont(new java.awt.Font("Segoe UI Black", 1, 14)); // NOI18N
        jTextFieldTotal.setText("0");

        jButtonOptionMode.setBackground(new java.awt.Color(153, 153, 0));
        jButtonOptionMode.setText("Añadir");
        jButtonOptionMode.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonOptionModeActionPerformed(evt);
            }
        });

        jPanel1.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 697, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 679, Short.MAX_VALUE)
        );

        jLabelLogo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/resources/logo.png"))); // NOI18N

        jButtonEndShop.setBackground(new java.awt.Color(0, 102, 204));
        jButtonEndShop.setText("Finalizar Compra");
        jButtonEndShop.setEnabled(false);
        jButtonEndShop.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonEndShopActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jFrameCajaLayout = new javax.swing.GroupLayout(jFrameCaja.getContentPane());
        jFrameCaja.getContentPane().setLayout(jFrameCajaLayout);
        jFrameCajaLayout.setHorizontalGroup(
            jFrameCajaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jFrameCajaLayout.createSequentialGroup()
                .addGap(54, 54, 54)
                .addGroup(jFrameCajaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButtonOptionMode, javax.swing.GroupLayout.PREFERRED_SIZE, 87, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 171, Short.MAX_VALUE)
                .addGroup(jFrameCajaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jFrameCajaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jFrameCajaLayout.createSequentialGroup()
                            .addComponent(jLabelTotal)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                            .addComponent(jTextFieldTotal, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGap(68, 68, 68)
                            .addComponent(jButtonEndShop)
                            .addContainerGap())
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jFrameCajaLayout.createSequentialGroup()
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 361, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGap(43, 43, 43)))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jFrameCajaLayout.createSequentialGroup()
                        .addComponent(jLabelLogo)
                        .addGap(135, 135, 135))))
        );
        jFrameCajaLayout.setVerticalGroup(
            jFrameCajaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jFrameCajaLayout.createSequentialGroup()
                .addGroup(jFrameCajaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jFrameCajaLayout.createSequentialGroup()
                        .addGap(0, 753, Short.MAX_VALUE)
                        .addComponent(jButtonEndShop))
                    .addGroup(jFrameCajaLayout.createSequentialGroup()
                        .addGap(35, 35, 35)
                        .addGroup(jFrameCajaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jFrameCajaLayout.createSequentialGroup()
                                .addComponent(jLabelLogo)
                                .addGap(18, 18, 18)
                                .addComponent(jScrollPane1))
                            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(30, 30, 30)
                        .addGroup(jFrameCajaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(jFrameCajaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(jLabelTotal, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jTextFieldTotal, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(jButtonOptionMode, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                .addGap(44, 44, 44))
        );

        jDialog1.setTitle("Compra finalizada correctamente");
        jDialog1.setAlwaysOnTop(true);
        jDialog1.setAutoRequestFocus(false);
        jDialog1.setSize(new java.awt.Dimension(619, 137));

        jLabelShopCorrecto.setFont(new java.awt.Font("Segoe UI Semibold", 1, 36)); // NOI18N
        jLabelShopCorrecto.setText("Compra Realizada Correctamente");

        jButtonCloseDialog.setText("Cerrar");
        jButtonCloseDialog.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonCloseDialogActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jDialog1Layout = new javax.swing.GroupLayout(jDialog1.getContentPane());
        jDialog1.getContentPane().setLayout(jDialog1Layout);
        jDialog1Layout.setHorizontalGroup(
            jDialog1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jDialog1Layout.createSequentialGroup()
                .addGroup(jDialog1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jDialog1Layout.createSequentialGroup()
                        .addGap(33, 33, 33)
                        .addComponent(jLabelShopCorrecto))
                    .addGroup(jDialog1Layout.createSequentialGroup()
                        .addGap(268, 268, 268)
                        .addComponent(jButtonCloseDialog)))
                .addContainerGap(39, Short.MAX_VALUE))
        );
        jDialog1Layout.setVerticalGroup(
            jDialog1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jDialog1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabelShopCorrecto)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButtonCloseDialog)
                .addContainerGap(19, Short.MAX_VALUE))
        );

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Fruterias Perez");
        setAutoRequestFocus(false);
        setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        setForeground(java.awt.Color.white);
        setResizable(false);

        jPanelBackGround.setBackground(new java.awt.Color(51, 51, 0));

        jPanelLogin.setBackground(new java.awt.Color(255, 51, 51));

        LogoImage.setIcon(new javax.swing.ImageIcon(getClass().getResource("/resources/logo.png"))); // NOI18N

        jLabelUser.setText("Usuario:");

        jLabelPassword.setText("Contraseña:");

        jButtonLoginButton.setText("Iniciar sesión");
        jButtonLoginButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonLoginButtonActionPerformed(evt);
            }
        });

        jLabelUserImage.setIcon(new javax.swing.ImageIcon(getClass().getResource("/resources/userIcon.png"))); // NOI18N

        jLabelIconoPaswd.setIcon(new javax.swing.ImageIcon(getClass().getResource("/resources/passwdIcon.png"))); // NOI18N

        javax.swing.GroupLayout jPanelLoginLayout = new javax.swing.GroupLayout(jPanelLogin);
        jPanelLogin.setLayout(jPanelLoginLayout);
        jPanelLoginLayout.setHorizontalGroup(
            jPanelLoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelLoginLayout.createSequentialGroup()
                .addGap(42, 42, 42)
                .addComponent(LogoImage)
                .addContainerGap(35, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelLoginLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanelLoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelLoginLayout.createSequentialGroup()
                        .addComponent(jLabelIconoPaswd)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanelLoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabelUser)
                            .addComponent(jLabelPassword)
                            .addComponent(jButtonLoginButton, javax.swing.GroupLayout.PREFERRED_SIZE, 119, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jPasswordField, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelLoginLayout.createSequentialGroup()
                        .addComponent(jLabelUserImage)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jTextFieldUsername, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(44, 44, 44))
        );
        jPanelLoginLayout.setVerticalGroup(
            jPanelLoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelLoginLayout.createSequentialGroup()
                .addGap(15, 15, 15)
                .addComponent(LogoImage)
                .addGap(24, 24, 24)
                .addComponent(jLabelUser)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelLoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jTextFieldUsername, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabelUserImage))
                .addGap(15, 15, 15)
                .addComponent(jLabelPassword)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanelLoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jPasswordField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabelIconoPaswd))
                .addGap(15, 15, 15)
                .addComponent(jButtonLoginButton)
                .addContainerGap(52, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanelBackGroundLayout = new javax.swing.GroupLayout(jPanelBackGround);
        jPanelBackGround.setLayout(jPanelBackGroundLayout);
        jPanelBackGroundLayout.setHorizontalGroup(
            jPanelBackGroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelBackGroundLayout.createSequentialGroup()
                .addGap(230, 230, 230)
                .addComponent(jPanelLogin, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(230, 230, 230))
        );
        jPanelBackGroundLayout.setVerticalGroup(
            jPanelBackGroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelBackGroundLayout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addComponent(jPanelLogin, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(32, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanelBackGround, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanelBackGround, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButtonLoginButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonLoginButtonActionPerformed
        // TODO add your handling code here:
        String userName = jTextFieldUsername.getText();
        String password = String.copyValueOf(jPasswordField.getPassword());
        System.out.println(password);
        boolean validLogin = false;
        jButtonLoginButton.setEnabled(false);
        //--> Esta linea de codigo sera problematica en el inicio de Sesion con BBDD
//        validLogin = true;      
        if (userName.length() > 3 && password.length() > 8) {
            validLogin = JavaFruteriasPerez.login(userName, password);
        }else{
            //AVISAR AL USUARIO DE DATOS DE LOGIN NO CORRECTOS
            System.out.println("Algo fallo");
        }
        
        if(validLogin){
            jFrameCaja.setVisible(true);
            jFrameCaja.setLocationRelativeTo(null);
            jFrameCaja.setAlwaysOnTop(true);
            mainFrame.setVisible(false);
        }else{
            //AVISAR AL USUARIO DE DATOS DE LOGIN NO CORRECTOS
        }
        jButtonLoginButton.setEnabled(true);
    }//GEN-LAST:event_jButtonLoginButtonActionPerformed
    
    boolean mode = true; // True añadir a la lista, False eliminar de la lista
    
    private void jButtonOptionModeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonOptionModeActionPerformed
        // TODO add your handling code here:
        if (mode) {
            jButtonOptionMode.setBackground(Color.red);
            jButtonOptionMode.setText("Eliminar");
            mode = false;
        }else{
            jButtonOptionMode.setBackground(Color.green);
            jButtonOptionMode.setText("Añadir");
            mode = true;
        }
    }//GEN-LAST:event_jButtonOptionModeActionPerformed

    private void jButtonEndShopActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonEndShopActionPerformed
        // TODO add your handling code here:
        if (!(Double.valueOf(jTextFieldTotal.getText()) == 0)) {
            String total = jTextFieldTotal.getText();
            String totalString = "Total:;" + total;
            Arduino.send(totalString); 
            jTextPane1.setText(null);
            jTextFieldTotal.setText("0");
            jButtonEndShop.setEnabled(false);
            jDialog1.setVisible(true);
            jDialog1.setLocationRelativeTo(null);
        }
    }//GEN-LAST:event_jButtonEndShopActionPerformed

    private void jButtonCloseDialogActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonCloseDialogActionPerformed
        // TODO add your handling code here:
        jDialog1.dispose();
    }//GEN-LAST:event_jButtonCloseDialogActionPerformed

    private void jFrameCajaWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_jFrameCajaWindowClosing
        // TODO add your handling code here:
        mainFrame.setVisible(true);
        //jFrameCaja.setVisible(false);
        jFrameCaja.dispose();
    }//GEN-LAST:event_jFrameCajaWindowClosing
    
    public void listaManager(String Producto,double precio){
        String ticket = jTextPane1.getText();
        System.out.println(ticket);
        double total = Double.parseDouble(jTextFieldTotal.getText()) ;
        
        if (mode) {
            total += precio;
            jTextFieldTotal.setText(String.valueOf(Math.round(total * 100.0) / 100.0));
            jTextPane1.setText(ticket + "\n" + Producto + " " + precio);
        }else{
            String temp = "\n" + Producto + " " + precio;
            String updatedTicket = ticket.replaceFirst(temp, "");
            if (!ticket.equals(updatedTicket)) {
                total -= precio;
                jTextFieldTotal.setText(String.valueOf(Math.round(total * 100.0) / 100.0));
                updatedTicket.replaceAll("\n", " ");
                jTextPane1.setText(updatedTicket);
            }
        }
        if (total > 0) {
            jButtonEndShop.setEnabled(true);
        }else{
            jButtonEndShop.setEnabled(false);
        }
        String display = Producto + ";" + precio;
        Arduino.send(display);
        
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(JFrameGUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(JFrameGUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(JFrameGUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(JFrameGUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new JFrameGUI().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel LogoImage;
    private javax.swing.JButton jButtonCloseDialog;
    private javax.swing.JButton jButtonEndShop;
    private javax.swing.JButton jButtonLoginButton;
    private javax.swing.JButton jButtonOptionMode;
    private javax.swing.JDialog jDialog1;
    private javax.swing.JFrame jFrameCaja;
    private javax.swing.JLabel jLabelIconoPaswd;
    private javax.swing.JLabel jLabelLogo;
    private javax.swing.JLabel jLabelPassword;
    private javax.swing.JLabel jLabelShopCorrecto;
    private javax.swing.JLabel jLabelTotal;
    private javax.swing.JLabel jLabelUser;
    private javax.swing.JLabel jLabelUserImage;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanelBackGround;
    private javax.swing.JPanel jPanelLogin;
    private javax.swing.JPasswordField jPasswordField;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField jTextFieldTotal;
    private javax.swing.JTextField jTextFieldUsername;
    private javax.swing.JTextPane jTextPane1;
    // End of variables declaration//GEN-END:variables
}
