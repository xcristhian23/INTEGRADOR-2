<%-- 
    Document   : Cliente
    Created on : 11 set. 2023, 02:55:51
    Author     : LEONARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Citas Registradas</title>
    </head>
    <body>
        <div class="d-flex justify-content-end align-items-center">
            <label class="me-2">
                <i class="fas fa-search"></i></label>
            <div class="col-auto">
                <input id="searchInput" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            </div>
        </div>
        <div class="d-flex">
            <div class="col-sm-12">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th class="text-center">Nro. Cita</th>
                            <th class="text-center">Cliente</th>
                            <th class="text-center">Fecha</th>
                            <th class="text-center">Hora</th>
                            <th>Servicio</th>
                            <th>Comentario</th>
                            <th class="text-center">Estado</th>
                            <th>Técnico asignado:</th>
                            <th class="text-center">Atendido</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="ct" items="${citas}">
                            <tr>
                                <td class="text-center">${ct.getIdCitas()}</td>
                                <td class="text-center">${ct.getNombreCliente()}</td>
                                <td class="text-center">${ct.getFecha()}</td>
                                <td class="text-center">${ct.getHora()}</td>
                                <td>${ct.getServicio()}</td>
                                <td>${ct.getComentario()}</td>
                                <c:set var="today" value='<%= new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()) %>'/>
                                <c:if test="${ct.isEstado() == true}">
                                    <c:if test="${ct.getFecha() <= today}">
                                        <td class="text-center"><span class="badge badge-warning">En proceso</span></td>
                                    </c:if>
                                    <c:if test="${ct.getFecha() > today}">
                                        <td class="text-center"><span class="badge badge-success">Activo</span></td>
                                    </c:if>
                                </c:if>
                                <c:if test="${ct.isEstado() == false}">
                                    <c:if test="${ct.getFecha() < today}">
                                        <td class="text-center"><span class="badge badge-danger">Terminado</span></td>
                                    </c:if>    
                                    <c:if test="${ct.getFecha() > today}">
                                        <td class="text-center"><span class="badge badge-danger">Terminado</span></td>
                                    </c:if> 
                                </c:if>
                                <td>${ct.getTecnico()}</td>
                                <c:if test="${ct.isAtendido() == true}">
                                    <td class="text-center"><span class="badge badge-success">Si</span></td>   
                                </c:if> 
                                <c:if test="${ct.isAtendido() == false}">
                                    <td class="text-center"><span class="badge badge-danger">No</span></td>   
                                </c:if> 
                                <td class="text-center">
                                    <c:if test="${ct.isEstado() == true}">
                                        <c:if test="${ct.getFecha() == today}">
                                        </c:if>
                                        <c:if test="${ct.getFecha() > today}">
                                            <a class="btn btn-danger" href="ControladorUsuario?menu=CitasCl&accion=desactivar&id=${ct.getIdCitas()}" data-toggle="tooltip"  title="Terminar Cita" data-original-title="Terminar Cita"><i class="fas fa-times"></i></a>
                                            <a class="btn btn-primary" href="" data-toggle="tooltip" title="Reprogramar cita" data-original-title="Reprogramar cita" data-bs-toggle="modal" data-bs-target="#reprogramarCita" onclick="enviarId(${ct.getIdCitas()}, '${ct.getFecha()}')"><i class="fas fa-calendar-plus"></i></a>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${ct.isEstado() == false}">

                                    </c:if>
                                </td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div id="mensaje-container">
                    <div class="alert alert-light" role="alert" id="mensajeError" style="color: red; font-size: 1.3em;">
                        <p class="text-bold"><b>${mensajeError}</b></p>
                    </div>
                    <div class="alert alert-light" role="alert" id="mensajeExito" style="color: green; font-size: 1.3em;">
                        <p class="text-bold"><b>${mensajeExito}</b></p>
                    </div>
                </div>
            </div>    
        </div>
        <style>
            .modal-dialog {
                max-width: 900px;
            }

            .table th {
                background-color: lightgray;
            }

            .table tbody tr {
                background-color: white;
            }

        </style>
        <div class="modal fade" id="reprogramarCita" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="asignarModal">Reprogramar cita:</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ControladorUsuario?menu=CitasCl" method="POST">
                          <div class="form-group row">  
                            <div class="form-group col-sm-3">
                                <label><b>Nro. Cita:</b></label>
                                <input type="text" id="numero" name="numero" class="form-control" disabled>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="fecha">Seleccione fecha:</label>
                                <input type="date" id="fecha" name="fecha" class="form-control" required>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="hora">Seleccione hora:</label>
                                <input type="time" id="hora" name="hora" class="form-control" required>
                            </div>

                            <input type="hidden" id="fechaCita" name="fechaCita">
                            
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <a id="enlace" class="btn btn-success" href="#" data-toggle="tooltip"  title="Grabar" data-original-title="Grabar" onclick="return confirmarCita()"><i class="fas fa-check-circle"></i></a>
                        <a type="button" class="btn btn-danger" data-bs-dismiss="modal" title="Cancelar"><i class="fas fa-times"></i></a>
                    </div>
                </div>
            </div>
        </div>               
    </body>

    <script>
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
            var fechaC = document.getElementById("fechaCita");
            var fechaCita = new Date(fechaC.value);
            var fechaSeleccionada = new Date(fechaInput.value);

            // Calcula la fecha mínima (hoy)
            var hoy = new Date();
            hoy.setHours(0, 0, 0, 0); // Establece la hora a las 00:00:00 para evitar problemas de zona horaria
            
            // Calcula la fecha máxima (30 días en el futuro)
            var fechaMaxima = new Date(hoy);
            fechaMaxima.setDate(fechaMaxima.getDate() + 30);

            // Comprueba si la fecha seleccionada está dentro del rango
            if (fechaSeleccionada <= fechaCita || fechaSeleccionada > fechaMaxima) {
                alert("La fecha seleccionada debe ser mayor a la fecha original de la cita");
                fechaInput.value = ""; // Borra la fecha si está fuera del rango
            }
        });
        
        function enviarId(idNumero, fCita) {
            $('#numero').val(idNumero).text();
            var fCitaFormateada = fCita;
            $('#fechaCita').val(fCitaFormateada);
       
            console.log(idNumero);
            console.log(fCita);
    
        }
        
        function obtenerId() {
            var numeroCita = document.getElementById("numero").value;
            return numeroCita;
        }

        function confirmarCita() {
            var idCita = obtenerId();
            var fechaC = document.getElementById("fecha").value;
            var horaC = document.getElementById("hora").value;
            var url = "ControladorUsuario?menu=CitasCl&accion=reprogramar&idCita=" + idCita + "&fechaCita=" + fechaC + "&horaCita=" + horaC;

            window.location.href = url;

            return false;
        }
        
         document.getElementById("searchInput").addEventListener("input", function () {
            const searchString = this.value.toLowerCase();
            const rows = document.querySelectorAll(".table tbody tr");

            rows.forEach(row => {
                let text = row.textContent.toLowerCase();
                if (text.includes(searchString)) {
                    row.style.display = "table-row";
                } else {
                    row.style.display = "none";
                }
            });
        });
        
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
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
