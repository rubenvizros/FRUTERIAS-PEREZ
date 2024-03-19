
//CREATE USER 'javaApp'@'%' IDENTIFIED BY 'javaAppPass';
//GRANT ALL PRIVILEGES ON fruterias_perez . * TO 'javaApp'@'%';

package bbdd;

import java.sql.*;

public class ConexionBD {
    
    public static final boolean DATABASEISPRODUCTION = false;
    
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DATABASE = "fruterias_perez";
    
//    static final String HOSTNAME = "172.17.20.39"; //MAQUINA REAL Adrian
//    static final String HOSTNAME = "172.17.126.35"; //MAQUINA VM TEST
    static final String HOSTNAME = "172.17.126.90"; //MAQUINA VM FINAL

    static final String PORT = "3306";
    static final String DB_USR = "javaApp";
    static final String DB_PWD = "javaAppPass";
    static final String DB_URL = "jdbc:mysql://" + HOSTNAME + ":" + PORT + "/" + DATABASE + "?allowPublicKeyRetrieval=true&useSSL=false";

    public static Connection getConnection() {        
        Connection conn = null;
        try {
            // Paso 1: Registrar el driver JDBC
            Class.forName(JDBC_DRIVER);

            // Paso 2: Abrir una conexión
            conn = DriverManager.getConnection(DB_URL, DB_USR, DB_PWD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
        
    public static String[][] select(String query) {
        Connection conn = null;
        Statement stmt = null;
        String[][] resultArray = null;

        try {
            // Paso 1: Registrar el driver JDBC
            Class.forName(JDBC_DRIVER);

            // Paso 2: Abrir una conexión
            conn = DriverManager.getConnection(DB_URL, DB_USR, DB_PWD);

            // Paso 3: Crear una declaración con cursor scrollable
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = stmt.executeQuery(query);

            // Paso 4: Procesar los resultados de la consulta
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();

            // Contamos cuántas filas hay en el ResultSet
            int rowCount = 0;
            if (rs.last()) {
                rowCount = rs.getRow();
                rs.beforeFirst(); // Regresamos al inicio del ResultSet
            }

            // Creamos el array bidimensional para almacenar los resultados
            resultArray = new String[rowCount][columnCount];
            int currentRow = 0;

            // Iteramos sobre el ResultSet para obtener los datos
            while (rs.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    resultArray[currentRow][i - 1] = rs.getString(i);
                }
                currentRow++;
            }

            // Paso 5: Cerrar los recursos
            rs.close();
        } catch (SQLException se) {
            // Manejar los errores de JDBC
            se.printStackTrace();
        } catch (Exception e) {
            // Manejar otros errores
            e.printStackTrace();
        } finally {
            // Cerrar los recursos
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se2) {
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        return resultArray;
    }
}