document.addEventListener('DOMContentLoaded', () => {
    const tablaEscuelas = document.getElementById('tabla-escuelas');
    const btnActualizar = document.getElementById('actualizar');

    // Función para obtener los datos de infraestructura
    const obtenerInfraestructura = async (id_escuela) => {
        let texto = 'Sin datos'; // Por defecto, no hay datos

        try    {
            // Hacer la consulta para obtener los datos de infraestructura
            const response = await fetch(`../../backend/estadisticas_infraestructura.php?id_escuela=${id_escuela}&nocache=${Date.now()}`);
            if (!response.ok) throw new Error(`Error al obtener infraestructura para la escuela ${id_escuela}`);
        
            const data = await response.json();

            if (data.length > 0) {
                // Los campos que se van a evaluar
                const campos = [
                    'acceso_discapacidad',
                    'agua_potable',
                    'electricidad',
                    'espacios_extra',
                    'estado_edificio',
                    'internet',
                    'mobiliario',
                    'seguridad',
                    'servicios_sanitarios',
                    'ventilacion'
                ];

                // Función para calcular el puntaje de cada valor
                const obtenerPuntaje = (valor) => {
                    switch (valor) {
                        case 'si':
                            return 1;
                        case 'no':
                            return 0;
                        default:
                            return 0.5;  // Para "parcialmente", "solo_maestros", etc.
                    }
                };

                let sumaPuntajes = 0;

                // Iterar sobre los campos y sumar los puntajes
                campos.forEach(campo => {
                    if (data[0] && data[0][campo]) {
                        sumaPuntajes += obtenerPuntaje(data[0][campo]);
                    }
                });

                const calificacion = sumaPuntajes*10;

                texto = `${calificacion} /100`; // Mostrar la calificación
            }
        } catch (error) {
            console.error(error);
            alert('Ocurrió un error al obtener los datos de infraestructura.');
        }

        return texto;
    };

    // Función para obtener los datos de rezago
    const obtenerRezago = async (id_escuela) => {
        let promedio = 0; // Inicializar el promedio

        try {
            const response = await fetch(`../../backend/estadisticas_rezago.php?id_escuela=${id_escuela}&nocache=${Date.now()}`);
            if (!response.ok) throw new Error(`Error al obtener rezago para la escuela ${id_escuela}`);

            const rezago = await response.json();
            if (rezago.length > 0) {
                let puntajeTotal = 0;
                let cantidadObjetos = 0;

                rezago.forEach(item => {
                    let puntaje = 0;

                    // Conocimientos adecuados, habilidades lectura, habilidades matemáticas (dividir entre 10)
                    puntaje += item.conocimientos_adecuados / 10;
                    puntaje += item.habilidades_lectura / 10;
                    puntaje += item.habilidades_matematicas / 10;
      
                    switch (item.nivel_academico_profesor) { // Nivel académico del profesor
                        case "sin estudios":
                            puntaje += 0;
                            break;
                        case "primaria":
                            puntaje += 0.2;
                            break;
                        case "secundaria":
                            puntaje += 0.4;
                            break;
                        case "preparatoria":
                            puntaje += 0.6;
                            break;
                        case "licenciatura":
                            puntaje += 0.8;
                            break;
                        case "maestria":
                            puntaje += 0.9;
                            break;
                        case "doctorado":
                            puntaje += 1;
                            break;
                        default:
                            break;
                    }
                    
                    if (item.num_alumnos <= 20) { // Número de alumnos
                        puntaje += 1;
                    } else if (item.num_alumnos <= 40) {
                        puntaje += 0.5;
                    }

                    if (item.recursos_didacticos === "si") { // Recursos didácticos
                        puntaje += 1;
                    } else if (item.recursos_didacticos === "parcialmente") {
                        puntaje += 0.5;
                    }

                    puntaje += (100 - item.rendimiento_por_bajo) / 10;  // Rendimiento por bajo (inverso de 100)

                    // Acumulamos el puntaje y la cantidad de objetos
                    puntajeTotal += puntaje;
                    cantidadObjetos++;

                    //console.log(`Puntaje: ${puntaje}/70`);
                });

                promedio = puntajeTotal / cantidadObjetos; // Calcular el promedio de los puntajes
                //console.log(`Promedio: ${promedio.toFixed(2)}/70`);
            }
        } catch (error) {
            console.error(error);
            alert('Ocurrió un error al obtener los datos de rezago.');
        }
        return ` ${promedio.toFixed(2)}/70`;
    };  


    // Función para obtener los datos de barreras
    const obtenerBarreras = async (id_escuela) => {
        let puntajes = [];  // Para almacenar los puntajes de cada objeto

        try {
            const response = await fetch(`../../backend/estadisticas_barreras.php?id_escuela=${id_escuela}&nocache=${Date.now()}`);
            if (!response.ok) throw new Error(`Error al obtener barreras para la escuela ${id_escuela}`);

            const barreras = await response.json();
            //console.log('Objetos de barreras:', barreras);

            
            if (barreras.length > 0) { // Si hay objetos, procedemos con el cálculo
                // Función para calcular el puntaje de cada campo
                const obtenerPuntaje = (campo, valor) => {
                    switch (campo) {
                        case 'infraestructura_basica':
                        case 'acceso_recursos':
                        case 'alimentacion':
                        case 'barreras_economicas':
                        case 'barreras_emocionales':
                        case 'entorno_familiar':
                        case 'problemas_salud':
                        case 'tiempo_recreativo':
                        case 'transporte':
                            if (valor === 'si') return 1;
                            if (valor === 'no') return 0;
                            return 0.5;  // Para "otros" como "a veces", "intermitente", etc.
                        case 'grado_aspirado':
                            switch (valor) {
                                case 'no_claro': return 0.2;
                                case 'secundaria': return 0.4;
                                case 'preparatoria': return 0.6;
                                case 'universidad': return 0.8;
                                case 'posgrado': return 1;
                                default: return 0;  // En caso de que no sea un valor válido
                            }
                        default:
                            return 0;  // Si el campo no está en la lista, no le damos puntaje
                    }
                };

                // Iteramos sobre los objetos de barreras y calculamos el puntaje para cada uno
                barreras.forEach((objeto, index) => {
                    let sumaPuntajes = 0;
                    const campos = [  // Definir los campos que se van a evaluar
                        'alimentacion', 'barreras_economicas', 'barreras_emocionales',
                        'entorno_familiar', 'infraestructura_basica', 'problemas_salud',
                        'tiempo_recreativo', 'transporte', 'grado_aspirado'
                    ];

                    campos.forEach((campo) => { // Sumamos los puntajes de cada campo
                        sumaPuntajes += obtenerPuntaje(campo, objeto[campo]);
                    });

                    puntajes.push(sumaPuntajes); // Guardamos el puntaje total para cada objeto
                    //console.log(`Puntaje para objeto ${index + 1}: ${sumaPuntajes}/10`);
                });

                const promedio = (puntajes.reduce((acc, puntaje) => acc + puntaje, 0) / puntajes.length)*10;
                //console.log(`Promedio de puntajes: ${(promedio).toFixed(2)}/100`);
                return ` ${(promedio).toFixed(2)}/100`;
            } else {
                return 'Sin datos disponibles';
            }
        } catch (error) {
            console.error(error);
            alert('Ocurrió un error al obtener los datos de barreras.');
            return 'Error al obtener los datos de barreras';
        }
    };



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
                // Obtener infraestructura, barreras y rezago
                const infraestructura = await obtenerInfraestructura(escuela.id_escuela);
                const barreras = await obtenerBarreras(escuela.id_escuela);
                const rezago = await obtenerRezago(escuela.id_escuela);

                // Crear fila para la escuela y agregar datos
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${escuela.nombre}</td>
                    <td>${escuela.municipio}</td>
                    <td>${escuela.direccion}</td>
                    <td>${infraestructura}</td>
                    <td>${rezago}</td>
                    <td>${barreras}</td>
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
