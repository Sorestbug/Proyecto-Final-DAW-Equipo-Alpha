<?php
include 'conexion.php';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Conexión exitosa a la base de datos.<br>";
} catch (PDOException $e) {
    die("Error en la conexión: " . $e->getMessage());
}

// Verificar si los datos del formulario fueron enviados
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recibir datos del formulario
    $id_escuela = $_POST['id_escuela'] ?? null;
    $nivel_academico = $_POST['nivel_academico'] ?? null;
    $grado_curso = $_POST['grado_curso'] ?? null;
    $turno = $_POST['turno'] ?? null;
    $num_alumnos = $_POST['num_alumnos'] ?? null;
    $habilidades_lectura = $_POST['habilidades_lectura'] ?? null;
    $habilidades_matematicas = $_POST['habilidades_matematicas'] ?? null;
    $conocimientos_adecuados = $_POST['conocimientos_adecuados'] ?? null;
    $rendimiento_por_bajo = $_POST['rendimiento_por_bajo'] ?? null;
    $metodo_ensenanza = $_POST['metodo_ensenanza'] ?? null;
    $recursos_didacticos = $_POST['recursos_didacticos'] ?? null;

    // Validar datos obligatorios
    if (empty($id_escuela)) {
        die("Error: Debes proporcionar el ID de la escuela");
    }

    try {
        // Preparar la consulta SQL
        $stmt = $pdo->prepare("
            INSERT INTO entrevista_rezago (
                id_escuela,
                nivel_academico_profesor,
                grado_curso,
                turno,
                num_alumnos,
                habilidades_lectura,
                habilidades_matematicas,
                conocimientos_adecuados,
                rendimiento_por_bajo,
                metodo_ensenanza,
                recursos_didacticos
            ) VALUES (
                :id_escuela,
                :nivel_academico,
                :grado_curso,
                :turno,
                :num_alumnos,
                :habilidades_lectura,
                :habilidades_matematicas,
                :conocimientos_adecuados,
                :rendimiento_por_bajo,
                :metodo_ensenanza,
                :recursos_didacticos
            )
        ");

        // Asignar valores a los parámetros
        $stmt->bindParam(':id_escuela', $id_escuela, PDO::PARAM_INT);
        $stmt->bindParam(':nivel_academico', $nivel_academico, PDO::PARAM_STR);
        $stmt->bindParam(':grado_curso', $grado_curso, PDO::PARAM_INT);
        $stmt->bindParam(':turno', $turno, PDO::PARAM_STR);
        $stmt->bindParam(':num_alumnos', $num_alumnos, PDO::PARAM_INT);
        $stmt->bindParam(':habilidades_lectura', $habilidades_lectura, PDO::PARAM_INT);
        $stmt->bindParam(':habilidades_matematicas', $habilidades_matematicas, PDO::PARAM_INT);
        $stmt->bindParam(':conocimientos_adecuados', $conocimientos_adecuados, PDO::PARAM_INT);
        $stmt->bindParam(':rendimiento_por_bajo', $rendimiento_por_bajo, PDO::PARAM_INT);
        $stmt->bindParam(':metodo_ensenanza', $metodo_ensenanza, PDO::PARAM_STR);
        $stmt->bindParam(':recursos_didacticos', $recursos_didacticos, PDO::PARAM_STR);

        // Ejecutar la consulta
        $stmt->execute();
        echo "Los datos de la entrevista de rezago académico se han guardado correctamente.";
    } catch (PDOException $e) {
        echo "Error al guardar los datos: " . $e->getMessage();
    }
}
?>
