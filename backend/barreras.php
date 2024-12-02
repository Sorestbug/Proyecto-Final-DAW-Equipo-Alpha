<?php
// Incluir archivo de conexión a la base de datos
include 'conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Verificar que se envió id_escuela
    if (isset($_POST['id_escuela']) && !empty($_POST['id_escuela'])) {
        $id_escuela = $_POST['id_escuela']; // Recibir id_escuela
    } else {
        die("Error: El campo 'id_escuela' no fue proporcionado o está vacío.");
    }

    // Recibir otros datos del formulario
    $infraestructura_basica = $_POST['infraestructura_basica'];
    $barreras_economicas = $_POST['barreras_economicas'];
    $acceso_recursos = $_POST['acceso_recursos'];
    $alimentacion = $_POST['alimentacion'];
    $entorno_familiar = $_POST['entorno_familiar'];
    $grado_aspirado = $_POST['grado_aspirado'];
    $problemas_salud = $_POST['problemas_salud'];
    $barreras_emocionales = $_POST['barreras_emocionales'];
    $transporte = $_POST['transporte'];
    $tiempo_recreativo = $_POST['tiempo_recreativo'];

    try {
        $sql = "INSERT INTO entrevista_barreras (id_escuela, infraestructura_basica, barreras_economicas, acceso_recursos, alimentacion, entorno_familiar, grado_aspirado, problemas_salud, barreras_emocionales, transporte, tiempo_recreativo) 
                VALUES (:id_escuela, :infraestructura_basica, :barreras_economicas, :acceso_recursos, :alimentacion, :entorno_familiar, :grado_aspirado, :problemas_salud, :barreras_emocionales, :transporte, :tiempo_recreativo)";
        
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':id_escuela' => $id_escuela,
            ':infraestructura_basica' => $infraestructura_basica,
            ':barreras_economicas' => $barreras_economicas,
            ':acceso_recursos' => $acceso_recursos,
            ':alimentacion' => $alimentacion,
            ':entorno_familiar' => $entorno_familiar,
            ':grado_aspirado' => $grado_aspirado,
            ':problemas_salud' => $problemas_salud,
            ':barreras_emocionales' => $barreras_emocionales,
            ':transporte' => $transporte,
            ':tiempo_recreativo' => $tiempo_recreativo
        ]);

        echo "La entrevista ha sido registrada exitosamente.";

    } catch (PDOException $e) {
        echo "Error en la base de datos: " . $e->getMessage();
    }
}
?>
