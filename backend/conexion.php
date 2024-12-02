<?php
// Datos de conexión
$host = 'localhost'; // Cambiar si tu base de datos está en otro servidor
$dbname = 'usuarios_db'; // Reemplazar con el nombre de tu base de datos
$username = 'root'; 
$password = '12345678a';

try {
    // Crear una nueva conexión PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);

    // Configurar el manejo de errores
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Conexión exitosa a la base de datos.";
} catch (PDOException $e) {
    // En caso de error, mostrar el mensaje
    echo "Error de conexión: " . $e->getMessage();
}
?>
