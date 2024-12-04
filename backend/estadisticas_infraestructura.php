<?php
require 'conexion.php';

header('Content-Type: application/json');

if (!isset($_GET['id_escuela'])) {
    echo json_encode(['error' => 'No se proporcionó el ID de la escuela']);
    exit;
}

$id_escuela = intval($_GET['id_escuela']);

try {
    // Consultar las filas de infraestructura relacionadas con la escuela
    $stmt = $pdo->prepare('
        SELECT * 
        FROM entrevista_infraestructura 
        WHERE id_escuela = :id_escuela AND eliminado = 0
    ');
    $stmt->bindParam(':id_escuela', $id_escuela, PDO::PARAM_INT);
    $stmt->execute();

    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($result);
} catch (PDOException $e) {
    echo json_encode(['error' => 'Error al consultar la base de datos', 'details' => $e->getMessage()]);
}
?>
