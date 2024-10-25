<%-- 
    Document   : Cliente
    Created on : 11 set. 2023, 02:55:51
    Author     : LEONARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="alertifyjs/alertify.js"></script>
        <script src="alertifyjs/alertify.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

        <title>JSP Page</title>
    </head>
    <body>
        <br>
        <div class="container">
            <div class="card-body" style="border: 1px solid lightgray;">
                <br>
                <form id="form-emp" action="ControladorUsuario?menu=Cita" method="POST" class="row g-2 needs-validation" onsubmit="return validarDatos()">
                    <h3><b>Información de usuario</b></h3>
                    <div class="form-group col-md-2">
                        <label><b>Id Usuario</b></label>
                        <input type="text" name="usuario" value="${bicicleta.getIdUsuario()}" class="form-control" id="idUsuario" disabled>
                        <input type="hidden" name="idUsuario" value="${bicicleta.getIdUsuario()}">
                    </div>
                    <div class="form-group col-md-2">
                        <label><b>Id Bicicleta</b></label>
                        <input type="text" name="bicicleta" value="${bicicleta.getIdBicicleta()}" class="form-control" id="idRol" disabled>
                        <input type="hidden" name="idBicicleta" value="${bicicleta.getIdBicicleta()}">
                    </div>
                    <div class="form-group col-md-4">
                        <label><b>Marca</b></label>
                        <input type="text" name="marca" value="${bicicleta.getMarca()}" class="form-control" id="marca" disabled>
                        <input type="hidden" name="marca" value="${bicicleta.getMarca()}">
                    </div>
                    <div class="form-group col-md-4">
                        <label><b>Modelo</b></label>
                        <input type="text" name="modelo" value="${bicicleta.getModelo()}" class="form-control" id="modelo" disabled>
                    </div>
                    <div class="d-flex justify-content-end">
                        <input type="submit" name="accion" value="Programar" class="btn btn-warning btn-info" id="btnProgramar" onclick="return programar()">
                        <input type="submit" name="accion" value="Registrar" class="btn btn-success btn-info" id="btnRegistrar" disabled>
                    </div>
                    <div class="divider">
                        <hr class="my-4 w-100 border-info">
                    </div>
                    <br>
                    <h3><b>Registrar Cita</b></h3>
                    <br>
                    <div class="form-group col-md-4">
                        <label for="fecha">Seleccione fecha:</label>
                        <input type="date" id="fecha" name="fecha" class="form-control" required disabled>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="hora">Seleccione hora:</label>
                        <input type="time" id="hora" name="hora" class="form-control" required disabled>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="servicios">Seleccione servicio:</label>
                        <select id="servicios" class="form-control" onchange="ShowSelected()" required disabled>
                            <option value="">Seleccionar un servicio</option>
                            <c:forEach var="srv" items="${nombreServicio}">
                                <option value="${srv.idServicio}">${srv.nombreServicio}</option>
                            </c:forEach>
                        </select>
                        <input type="hidden" id="servicioSelecionado" name="Tipo" >
                    </div>
                    <div class="form-group comentario">
                        <label>Información adicional</label>
                        <textarea type="text" name="comentario" class="form-control" id="comentario" style="width: 100%; height: 80px;" required disabled></textarea>
                    </div>
                    <div id="mensaje-container">
                        <div class="alert alert-light" role="alert" id="mensajeError" style="color: blue;">
                            ${mensajeExito}
                        </div>
                        <div class="alert alert-light" role="alert" id="mensajeError" style="color: red;">
                            ${mensajeError}
                        </div>
                    </div>
                </form>
            </div>

        </div>

    </body>

    <script>

        function ShowSelected() {
            $('#servicioSelecionado').val($("#servicios option:selected").text());
        }

        function programar() {
            // Muestra un cuadro de diálogo de confirmación
            var confirmacion = confirm('¿Deseas programar una cita?');
            document.getElementById("btnProgramar").disabled = true;

            // Habilitar los campos de nombre, apellidos, tipo de documento, nro documento, celular y direccion
            document.getElementById("fecha").disabled = false;
            document.getElementById("hora").disabled = false;
            document.getElementById("comentario").disabled = false;
            document.getElementById("servicios").disabled = false;
            document.getElementById("fecha").focus();
            // Habilitar el botón "Actualizar"
            document.getElementById("btnRegistrar").disabled = false;


            // Si el usuario elige cancelar, devuelve falso y evita que el enlace se siga
            if (!confirmacion) {
                return false;
            }
        }

        const inputHora = document.getElementById("hora");

        // Escuchar el evento "blur" para verificar la hora ingresada
        inputHora.addEventListener("blur", function () {
            const horaIngresada = inputHora.value;

            // Convertir la hora ingresada en formato HH:mm a minutos desde la medianoche
            const horaMinutos = calcularMinutos(horaIngresada);

            // Definir límites de tiempo (en minutos) - 8:00 AM a 8:00 PM
            const limiteInferior = calcularMinutos("8:00");
            const limiteSuperior = calcularMinutos("20:00");

            // Verificar si la hora ingresada está dentro del rango permitido
            if (horaMinutos < limiteInferior || horaMinutos > limiteSuperior) {
                // La hora ingresada está fuera del rango permitido
                alert("La hora debe estar entre las 8:00 y las 20:00 Horas");
                inputHora.value = ""; // Limpiar el campo de entrada
            }
        });

        // Función para convertir una hora en formato HH:mm a minutos desde la medianoche
        function calcularMinutos(hora) {
            const partes = hora.split(":");
            const horas = parseInt(partes[0], 10);
            const minutos = parseInt(partes[1], 10);
            return horas * 60 + minutos;
        }


        // Obtén el elemento de input de fecha
        var fechaInput = document.getElementById("fecha");

        // Agrega un evento de cambio al campo de fecha
        fechaInput.addEventListener("change", function () {
            // Obten la fecha seleccionada por el usuario
            var fechaSeleccionada = new Date(fechaInput.value);

            // Calcula la fecha mínima (hoy)
            var hoy = new Date();
            hoy.setHours(0, 0, 0, 0); // Establece la hora a las 00:00:00 para evitar problemas de zona horaria
            var fechaMinima = new Date(hoy);

            // Calcula la fecha máxima (30 días en el futuro)
            var fechaMaxima = new Date(hoy);
            fechaMaxima.setDate(fechaMaxima.getDate() + 30);

            // Comprueba si la fecha seleccionada está dentro del rango
            if (fechaSeleccionada < fechaMinima || fechaSeleccionada > fechaMaxima) {
                alert("La fecha seleccionada está fuera del rango permitido. Debe ser mayor al día de hoy");
                fechaInput.value = ""; // Borra la fecha si está fuera del rango
            }
        });


    </script>
    <script src="https://cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.2/dist/umd/popper.min.js" integrity="sha384-q9CRHqZndzlxGLOj+xrdLDJa9ittGte1NksRmgJKeCV9DrM7Kz868XYqsKWPpAmn" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


</html>
