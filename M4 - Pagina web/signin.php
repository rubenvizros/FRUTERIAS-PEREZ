<?php
// Obtener todos los valores del formulario HTML
if(isset($_POST['submit']))
{
    $fname = $_POST['fname']; // Primer nombre
    $lname = isset($_POST['lname']) && !empty($_POST['lname']) ? $_POST['lname'] : NULL; // Apellido, opcional
    $email = $_POST['email']; // Correo electrónico
    $address = isset($_POST['address']) && !empty($_POST['address']) ? $_POST['address'] : NULL; // Dirección, opcional
    
    // Verificar si el número de teléfono está vacío
    $pnumber = !empty($_POST['pnumber']) ? $_POST['pnumber'] : NULL;

    // Verificar si se seleccionó la casilla de ofertas promocionales
    $prom_off = isset($_POST['promo_off']) ? 1 : 0;

    // Verificar si el país es "Otro" y establecerlo como NULL
    $country = $_POST['country'] === 'Otro' ? NULL : $_POST['country']; // País
    $password1 = $_POST['password']; // Contraseña
}

// Detalles de la base de datos
$host = "172.17.126.35";
$username = "javaApp";
$password = "javaAppsPass";
$dbname = "fruterias_perez";

// Crear una conexión
$con = mysqli_connect($host, $username, $password, $dbname);

// Asegurarse de que se haya establecido la conexión
if (!$con)
{
    die("¡Conexión fallida!" . mysqli_connect_error());
}

// Usar SQL para crear una consulta de inserción de datos
$sql = "INSERT INTO customers (first_name, last_name, email, phone_number, address, country, promotional_offers, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

// Preparar la declaración
$stmt = mysqli_prepare($con, $sql);

// Vincular parámetros
mysqli_stmt_bind_param($stmt, "ssssssis", $fname, $lname, $email, $pnumber, $address, $country, $prom_off, $password1);

// Ejecutar la declaración
if(mysqli_stmt_execute($stmt)) {
    echo "¡Entradas añadidas!";
} else {
    echo "Error: " . mysqli_error($con); // Imprimir cualquier error de la base de datos
}

// Cerrar la declaración y la conexión
mysqli_stmt_close($stmt);
mysqli_close($con);
?>
