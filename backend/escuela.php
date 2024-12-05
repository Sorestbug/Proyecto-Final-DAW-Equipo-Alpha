<?php
include 'conexion.php';

// Verificar si los datos del formulario fueron enviados
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recibir datos del formulario
    $nombre_escuela = $_POST['nombre_escuela'] ?? null;
    $municipio = $_POST['municipio'] ?? null;
    $direccion = $_POST['direccion'] ?? null;
    $num_maestros = $_POST['num_maestros'] ?? null;
    $num_alumnos = $_POST['num_alumnos'] ?? null;

    // Validar datos obligatorios
    if (empty($nombre_escuela) || empty($municipio) || empty($direccion) || empty($num_maestros) || empty($num_alumnos)) {
        die("Error: Todos los campos son obligatorios.");
    }

    try {
        // Preparar la consulta SQL
        $stmt = $pdo->prepare("
            INSERT INTO escuelas (
                nombre,
                municipio,
                direccion,
                num_maestros,
                num_alumnos
            ) VALUES (
                :nombre_escuela,
                :municipio,
                :direccion,
                :num_maestros,
                :num_alumnos
            )
        ");

        // Asignar valores a los parámetros
        $stmt->bindParam(':nombre_escuela', $nombre_escuela, PDO::PARAM_STR);
        $stmt->bindParam(':municipio', $municipio, PDO::PARAM_STR);
        $stmt->bindParam(':direccion', $direccion, PDO::PARAM_STR);
        $stmt->bindParam(':num_maestros', $num_maestros, PDO::PARAM_INT);
        $stmt->bindParam(':num_alumnos', $num_alumnos, PDO::PARAM_INT);

        // Ejecutar la consulta
        $stmt->execute();
        header("Location: ../frontend/pages/escuela.html");
        exit();  // Asegúrate de llamar a exit después de header para evitar que se ejecute el código restante.
        } catch (PDOException $e) {
            echo "Error en la base de datos: " . $e->getMessage();
        }
}
?>
