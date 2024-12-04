<?php
// Incluir el archivo de conexión a la base de datos
include 'conexion.php';

header('Content-Type: application/json');

try {
    // Consulta para obtener solo las escuelas donde 'eliminado' es igual a 0
    $sql = "SELECT id_escuela, nombre, municipio, direccion
            FROM escuelas
            WHERE eliminado = 0";
    
    // Preparar y ejecutar la consulta
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Obtener los resultados
    $escuelas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Devolver resultados como JSON
    echo json_encode($escuelas);
} catch (PDOException $e) {
    // Manejar errores de consulta o conexión
    echo json_encode(['error' => 'Error en la consulta: ' . $e->getMessage()]);
}
?>
