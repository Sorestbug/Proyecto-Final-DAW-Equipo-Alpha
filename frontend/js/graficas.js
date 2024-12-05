
            // Simulando datos de cada gráfico
            var infraestructuraData = [70, 20, 10]; // Ejemplo: Infraestructura Básica
            var barrerasEconomicasData = [50, 30, 20]; // Ejemplo: Barreras Económicas
            var infraestructuraEstadoData = [60, 25, 15]; // Ejemplo: Estado de la Infraestructura
            var rezagoEducativoData = [40, 35, 25]; // Ejemplo: Problemas de Rezago Educativo
            var escuelasData = [30, 40, 30]; // Ejemplo: Distribución de Escuelas
            var usuariosData = [40, 30, 30]; // Ejemplo: Distribución de Usuarios

            // Gráfico de Infraestructura Básica
            var ctx1 = document.getElementById('graficoInfraestructura').getContext('2d');
            var graficoInfraestructura = new Chart(ctx1, {
                type: 'pie',
                data: {
                    labels: ['Si', 'No', 'Intermitente'],
                    datasets: [{
                        label: 'Infraestructura Básica',
                        data: infraestructuraData,
                        backgroundColor: ['#36A2EB', '#FF6384', '#FFCD56'],
                        hoverBackgroundColor: ['#2A88D8', '#FF4B6F', '#FFBB33']
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        }
                    }
                }
            });

            // Gráfico de Barreras Económicas
            var ctx2 = document.getElementById('graficoBarrerasEconomicas').getContext('2d');
            var graficoBarrerasEconomicas = new Chart(ctx2, {
                type: 'bar',
                data: {
                    labels: ['Si', 'No', 'A Veces'],
                    datasets: [{
                        label: 'Barreras Económicas',
                        data: barrerasEconomicasData,
                        backgroundColor: ['#4BC0C0', '#FF9F40', '#FF8C1A'],
                        hoverBackgroundColor: ['#36A2EB', '#FF6384', '#FFCD56']
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            // Gráfico de Estado de la Infraestructura
            var ctx3 = document.getElementById('graficoInfraestructuraEstado').getContext('2d');
            var graficoInfraestructuraEstado = new Chart(ctx3, {
                type: 'pie',
                data: {
                    labels: ['Bueno', 'Regular', 'Malo'],
                    datasets: [{
                        label: 'Estado de la Infraestructura',
                        data: infraestructuraEstadoData,
                        backgroundColor: ['#36A2EB', '#FF6384', '#FFCD56'],
                        hoverBackgroundColor: ['#2A88D8', '#FF4B6F', '#FFBB33']
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        }
                    }
                }
            });

            // Gráfico de Problemas de Rezago Educativo
            var ctx4 = document.getElementById('graficoRezagoEducativo').getContext('2d');
            var graficoRezagoEducativo = new Chart(ctx4, {
                type: 'bar',
                data: {
                    labels: ['Si', 'No', 'A Veces'],
                    datasets: [{
                        label: 'Problemas de Rezago Educativo',
                        data: rezagoEducativoData,
                        backgroundColor: ['#36A2EB', '#FF6384', '#FFCD56'],
                        hoverBackgroundColor: ['#2A88D8', '#FF4B6F', '#FFBB33']
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            // Gráfico de Distribución de Escuelas
            var ctx5 = document.getElementById('graficoEscuelas').getContext('2d');
            var graficoEscuelas = new Chart(ctx5, {
                type: 'pie',
                data: {
                    labels: ['Escuela Pública', 'Escuela Privada', 'Escuela Técnica'],
                    datasets: [{
                        label: 'Distribución de Escuelas',
                        data: escuelasData,
                        backgroundColor: ['#36A2EB', '#FF6384', '#FFCD56'],
                        hoverBackgroundColor: ['#2A88D8', '#FF4B6F', '#FFBB33']
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        }
                    }
                }
            });

            // Gráfico de Distribución de Usuarios
            var ctx6 = document.getElementById('graficoUsuarios').getContext('2d');
            var graficoUsuarios = new Chart(ctx6, {
                type: 'bar',
                data: {
                    labels: ['Administrador', 'Docente', 'Estudiante'],
                    datasets: [{
                        label: 'Distribución de Usuarios',
                        data: usuariosData,
                        backgroundColor: ['#4BC0C0', '#FF9F40', '#FF8C1A'],
                        hoverBackgroundColor: ['#36A2EB', '#FF6384', '#FFCD56']
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
