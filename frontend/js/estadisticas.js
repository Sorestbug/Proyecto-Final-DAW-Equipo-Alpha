document.addEventListener('DOMContentLoaded', () => {
    const tablaEscuelas = document.getElementById('tabla-escuelas');
    const btnActualizar = document.getElementById('actualizar');

    // Función para actualizar la tabla con los datos
    const actualizarTabla = async () => {
        try {
            // Limpiar tabla
            tablaEscuelas.innerHTML = '';

            // Llamar a estadisticas_escuelas.php para obtener las escuelas
            const responseEscuelas = await fetch(`../../backend/estadisticas_escuelas.php?nocache=${Date.now()}`);
            if (!responseEscuelas.ok) throw new Error('Error al obtener las escuelas');

            const escuelas = await responseEscuelas.json();

            if (escuelas.length === 0) {
                tablaEscuelas.innerHTML = '<tr><td colspan="7">No se encontraron escuelas.</td></tr>';
                return;
            }

            // Recorrer las escuelas y obtener infraestructura, barreras y rezago para cada una
            for (const escuela of escuelas) {
                // Obtener infraestructura
                const responseInfraestructura = await fetch(`../../backend/estadisticas_infraestructura.php?id_escuela=${escuela.id_escuela}&nocache=${Date.now()}`);
                if (!responseInfraestructura.ok) throw new Error(`Error al obtener la infraestructura para la escuela ${escuela.id_escuela}`);
                const infraestructura = await responseInfraestructura.json();

                // Obtener barreras
                const responseBarreras = await fetch(`../../backend/estadisticas_barreras.php?id_escuela=${escuela.id_escuela}&nocache=${Date.now()}`);
                if (!responseBarreras.ok) throw new Error(`Error al obtener las barreras para la escuela ${escuela.id_escuela}`);
                const barreras = await responseBarreras.json();

                // Obtener rezago
                const responseRezago = await fetch(`../../backend/estadisticas_rezago.php?id_escuela=${escuela.id_escuela}&nocache=${Date.now()}`);
                if (!responseRezago.ok) throw new Error(`Error al obtener el rezago para la escuela ${escuela.id_escuela}`);
                const rezago = await responseRezago.json();

                // Imprimir los datos de infraestructura, barreras y rezago en la consola
                console.log(`Infraestructura para la escuela ${escuela.id_escuela}:`, infraestructura);
                console.log(`Barreras para la escuela ${escuela.id_escuela}:`, barreras);
                console.log(`Rezago para la escuela ${escuela.id_escuela}:`, rezago);

                // Crear fila para la escuela y agregar datos
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${escuela.id_escuela}</td>
                    <td>${escuela.nombre}</td>
                    <td>${escuela.municipio}</td>
                    <td>${escuela.direccion}</td>
                    <td>${infraestructura.length > 0 ? 'Datos disponibles' : 'Sin datos'}</td>
                    <td>${rezago.length > 0 ? 'Datos disponibles' : 'Sin datos'}</td>
                    <td>${barreras.length > 0 ? 'Datos disponibles' : 'Sin datos'}</td>
                `;
                tablaEscuelas.appendChild(row);
            }
        } catch (error) {
            console.error(error);
            alert('Ocurrió un error al obtener los datos. Verifica la consola para más detalles.');
        }
    };

    // Remover cualquier manejador previo y asignar el nuevo evento
    btnActualizar.removeEventListener('click', actualizarTabla);
    btnActualizar.addEventListener('click', actualizarTabla);

    // Llamar a la función de actualización al cargar la página
    actualizarTabla();
});
