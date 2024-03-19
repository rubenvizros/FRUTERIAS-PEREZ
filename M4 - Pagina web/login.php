<?php
// Verificar si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Conectarse a la base de datos (modifica estos valores con los de tu servidor)
    $servername = "172.17.126.35";
    $username = "javaApp";
    $password = "javaAppsPass";
    $dbname = "fruterias_perez";

    // Crear conexión
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Verificar la conexión
    if ($conn->connect_error) {
        die("La conexión falló: " . $conn->connect_error);
    }

    // Recoger los datos del formulario
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Consulta SQL para verificar si el usuario existe y la contraseña es correcta
    $sql = "SELECT * FROM CUSTOMERS WHERE email = '$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Usuario encontrado, verificar la contraseña
        $row = $result->fetch_assoc();
        if ($password === $row['password']) {
            // Contraseña correcta, inicio de sesión exitoso
            session_start();
            $_SESSION['email'] = $email;
            header("Location: welcome.php"); // Redirige a la página de bienvenida
        } else {
            // Contraseña incorrecta
            echo "Contraseña incorrecta";
        }
    } else {
        // Usuario no encontrado
        echo "Usuario no encontrado";
    }

    // Cierra la conexión a la base de datos
    $conn->close();
}
?>
