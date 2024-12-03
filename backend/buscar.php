<?php
// Incluir el archivo de conexión a la base de datos
include 'conexion.php';

// Configurar encabezado para que el navegador interprete la salida como JSON
header('Content-Type: application/json');

try {
    // Validar si se recibe el parámetro 'query'
    if (isset($_GET['query']) && !empty($_GET['query'])) {
        $query = trim($_GET['query']);

        // Preparar y ejecutar la consulta
        $sql = "SELECT id_escuela, nombre, municipio, direccion 
                FROM escuelas 
                WHERE id_escuela LIKE :query 
                OR nombre LIKE :query 
                OR municipio LIKE :query 
                OR direccion LIKE :query";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':query' => "%$query%"]);

        // Obtener los resultados
        $escuelas = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Devolver resultados como JSON
        echo json_encode($escuelas);
    } else {
        // Si no se proporciona el parámetro, devolver un arreglo vacío
        echo json_encode([]);
    }
} catch (PDOException $e) {
    // Manejar errores de consulta o conexión
    echo json_encode(['error' => 'Error en la consulta: ' . $e->getMessage()]);
}
?>
