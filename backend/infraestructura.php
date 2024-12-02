<?php
include 'conexion.php';

// Verificar si los datos fueron enviados
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recibir datos del formulario
    $id_escuela = $_POST['id_escuela'] ?? null;
    $agua_potable = $_POST['agua_potable'] ?? null;
    $servicios_sanitarios = $_POST['servicios_sanitarios'] ?? null;
    $electricidad = $_POST['electricidad'] ?? null;
    $mobiliario = $_POST['mobiliario'] ?? null;
    $internet = $_POST['internet'] ?? null;
    $espacios_extra = $_POST['espacios_extra'] ?? null;
    $seguridad = $_POST['seguridad'] ?? null;
    $acceso_discapacidad = $_POST['acceso_discapacidad'] ?? null;
    $ventilacion = $_POST['ventilacion'] ?? null;
    $estado_edificio = $_POST['estado_edificio'] ?? null;

    // Validar que el ID de la escuela no esté vacío
    if (empty($id_escuela)) {
        die("Error: Debes proporcionar el ID de la escuela.");
    }

    try {
        // Insertar los datos en la base de datos
        $stmt = $pdo->prepare("
            INSERT INTO entrevista_infraestructura (
                id_escuela, 
                agua_potable, 
                servicios_sanitarios, 
                electricidad, 
                mobiliario, 
                internet, 
                espacios_extra, 
                seguridad, 
                acceso_discapacidad, 
                ventilacion, 
                estado_edificio
            ) VALUES (
                :id_escuela, 
                :agua_potable, 
                :servicios_sanitarios, 
                :electricidad, 
                :mobiliario, 
                :internet, 
                :espacios_extra, 
                :seguridad, 
                :acceso_discapacidad, 
                :ventilacion, 
                :estado_edificio
            )
        ");

        // Asignar valores a los parámetros
        $stmt->bindParam(':id_escuela', $id_escuela, PDO::PARAM_INT);
        $stmt->bindParam(':agua_potable', $agua_potable, PDO::PARAM_STR);
        $stmt->bindParam(':servicios_sanitarios', $servicios_sanitarios, PDO::PARAM_STR);
        $stmt->bindParam(':electricidad', $electricidad, PDO::PARAM_STR);
        $stmt->bindParam(':mobiliario', $mobiliario, PDO::PARAM_STR);
        $stmt->bindParam(':internet', $internet, PDO::PARAM_STR);
        $stmt->bindParam(':espacios_extra', $espacios_extra, PDO::PARAM_STR);
        $stmt->bindParam(':seguridad', $seguridad, PDO::PARAM_STR);
        $stmt->bindParam(':acceso_discapacidad', $acceso_discapacidad, PDO::PARAM_STR);
        $stmt->bindParam(':ventilacion', $ventilacion, PDO::PARAM_STR);
        $stmt->bindParam(':estado_edificio', $estado_edificio, PDO::PARAM_STR);

        // Ejecutar la consulta
        $stmt->execute();
        echo "Los datos de la infraestructura se han guardado correctamente.";
    } catch (PDOException $e) {
        echo "Error en la base de datos: " . $e->getMessage();
    }
}
?>
