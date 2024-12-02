<?php
// Incluir archivo de conexión a la base de datos
include 'conexion.php';  // Asegúrate de que 'conexion.php' esté configurado correctamente

// Comprobar si el formulario fue enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recoger los datos del formulario
    $correo = trim($_POST['email']);
    $contraseña = trim($_POST['password']);

    // Validar que los campos no estén vacíos
    if (empty($correo) || empty($contraseña)) {
        echo "Por favor, completa todos los campos.";
        exit;
    }

    try {
        // Consultar el usuario en la base de datos
        $sql = "SELECT id_usuario, contraseña FROM usuarios WHERE correo = :correo";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':correo' => $correo]);
        $usuario = $stmt->fetch();

        // Verificar si se encontró el usuario
        if ($usuario && password_verify($contraseña, $usuario['contraseña'])) {
            // Si la contraseña es correcta, redirigir al menú del entrevistador
            session_start();
            $_SESSION['usuario_id'] = $usuario['id_usuario'];
            header("Location: menu_entrevistador.html");
            exit;
        } else {
            echo "Correo o contraseña incorrectos.";
        }
    } catch (PDOException $e) {
        echo "Error en la conexión o la consulta: " . $e->getMessage();
    }
}
?>
