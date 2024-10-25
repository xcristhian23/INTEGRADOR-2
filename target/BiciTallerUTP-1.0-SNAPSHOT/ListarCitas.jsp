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
<!-- (A) LOAD HTML2PDF -->
<!-- https://cdnjs.com/libraries/html2pdf.js -->

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
        <title>JSP Page</title>
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
                <table class="table table-hover" id="Citas">
                    <thead>
                        <tr>
                            <th class="text-center">Nro. Cita</th>
                            <th class="text-center">Cliente</th>
                            <th class="text-center">Fecha</th>
                            <th class="text-center">Hora</th>
                            <th>Servicio</th>
                            <th>Información adicional</th>
                            <th class="text-center">Estado</th>
                            <th>Tecnico asignado:</th>
                            <th class="text-center">Atendido</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${citas}">
                            <tr>
                                <td class="text-center">${c.getIdCitas()}</td>
                                <td class="text-center">${c.getNombreCliente()}</td>
                                <td class="text-center">${c.getFecha()}</td>
                                <td class="text-center">${c.getHora()}</td>
                                <td>${c.getServicio()}</td>
                                <td>${c.getComentario()}</td>
                                <c:set var="today" value='<%= new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()) %>'/>
                                <c:if test="${c.isEstado() == true}">
                                    <c:if test="${c.getFecha() <= today}">
                                        <td class="text-center"><span class="badge badge-warning">En proceso</span></td>
                                    </c:if>
                                    <c:if test="${c.getFecha() > today}">
                                        <td class="text-center"><span class="badge badge-success">Activo</span></td>
                                    </c:if>
                                </c:if>
                                <c:if test="${c.isEstado() == false}">
                                    <c:if test="${c.getFecha() < today}">
                                        <td class="text-center"><span class="badge badge-danger">Terminado</span></td> 
                                    </c:if>
                                    <c:if test="${c.getFecha() > today}">
                                        <td class="text-center"><span class="badge badge-danger">Terminado</span></td> 
                                    </c:if>
                                </c:if>
                                <td>${c.getTecnico()}</td>
                                <c:if test="${c.isAtendido() == true}">
                                    <td class="text-center"><span class="badge badge-success">Si</span></td>   
                                </c:if> 
                                <c:if test="${c.isAtendido() == false}">
                                    <td class="text-center"><span class="badge badge-danger">No</span></td>   
                                </c:if>
                                <td class="text-center">
                                    <c:if test="${c.isEstado() == true}">
                                        <c:if test="${c.getFecha() >= today}">
                                            <a class="btn btn-primary" href="#" data-toggle="tooltip"  title="Asignar Tecnico" data-original-title="Asignar Tecnico" data-bs-toggle="modal" data-bs-target="#asignarTecnico" onclick="enviarId(${c.getIdCitas()}, '${c.getFecha()}', '${c.getHora()}')"><i class="fas fa-user-plus"></i></a>
                                            <a class="btn btn-danger" href="ControladorUsuario?menu=ReporteCitas&accion=desactivar&id=${c.getIdCitas()}" data-toggle="tooltip"  title="Terminar Cita" data-original-title="Terminar Cita"><i class="fas fa-times"></i></a>
                                            </c:if>
                                            <c:if test="${c.isEstado() == false}">


                                        </c:if>
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
                <div style="float: right">
                    <button id="exportButton" class="btn btn-success">Exportar a excel <i class="fas fa-file-excel"></i></button>  
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
        <div class="modal fade" id="asignarTecnico" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="asignarModal">Seleccione Técnico:</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="d-flex justify-content-end align-items-center">
                            <label class="me-2">
                                <i class="fas fa-search"></i></label>
                            <div class="col-auto">
                                <input id="searchInput1" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            </div>
                        </div>
                        <br>
                        <form action="ControladorUsuario?menu=ReporteCitas" method="POST">
                            <input type="hidden" id="numero" name="numero">
                            <input type="hidden" id="fechaCita" name="fechaCita">
                            <input type="hidden" id="horaCita" name="horaCita">
                            <table class="table table-hover" id="tecnicoCitas">
                                <thead>
                                    <tr>
                                        <th class="text-center">Id_Tecnico</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th class="text-center">Estado</th>
                                        <th class="text-center">Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="n" items="${nombre}">
                                        <tr data-id-tecnico="${n.getIdUsuario()}">
                                            <td class="text-center">${n.getIdUsuario()}</td>
                                            <td>${n.getNombre()}</td>
                                            <td>${n.getApellido()}</td>
                                            <c:if test="${n.isEstado() == true}">
                                                <td class="text-center"><span class="badge badge-success ">Activo</span></td> 
                                            </c:if>
                                            <c:if test="${n.isEstado() == false}">
                                                <td class="text-center"><span class="badge badge-danger">Inactivo</span></td> 
                                            </c:if>
                                            <c:if test="${n.isEstado() == true}">
                                                <td class="text-center"> 
                                                    <a id="enlace" class="btn btn-primary" href="#" data-toggle="tooltip"  title="Asignar Tecnico" data-original-title="Asignar Tecnico" onclick="return confirmarTecnico()"><i class="fas fa-check-circle"></i></a></td> 
                                                    </c:if>
                                                    <c:if test="${n.isEstado() == false}">

                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>                
    </body>

    <script>
        function enviarId(idNumero, fCita, hCita) {
            $('#numero').val(idNumero).text();
            var fCitaFormateada = fCita;
            $('#fechaCita').val(fCitaFormateada);
            $('#horaCita').val(hCita);

            console.log(idNumero);
            console.log(fCita);
            console.log(hCita);

        }

        function obtenerId() {
            var numeroCita = document.getElementById("numero").value;
            return numeroCita;
        }

        function confirmarTecnico() {
            var tr = event.target.closest("tr");
            var idTecnico = tr.dataset.idTecnico;
            var idCita = obtenerId();
            var fechaC = document.getElementById("fechaCita").value;
            var horaC = document.getElementById("horaCita").value;
            console.log(idTecnico);
            console.log(idCita);

            var url = "ControladorUsuario?menu=ReporteCitas&accion=Tecnico&idTecnico=" + idTecnico + "&idCita=" + idCita + "&fechaCita=" + fechaC + "&horaCita=" + horaC;

            window.location.href = url;

            return false;
        }

        document.getElementById("searchInput").addEventListener("input", function () {
            const searchString = this.value.toLowerCase();
            const rows = document.querySelectorAll("#Citas tbody tr");

            rows.forEach(row => {
                let text = row.textContent.toLowerCase();
                if (text.includes(searchString)) {
                    row.style.display = "table-row";
                } else {
                    row.style.display = "none";
                }
            });
        });

        document.getElementById("searchInput1").addEventListener("input", function () {
            const searchString = this.value.toLowerCase();
            const rows = document.querySelectorAll("#tecnicoCitas tbody tr");

            rows.forEach(row => {
                let text = row.textContent.toLowerCase();
                if (text.includes(searchString)) {
                    row.style.display = "table-row";
                } else {
                    row.style.display = "none";
                }
            });
        });
        
        document.getElementById("exportButton").addEventListener("click", () => {
            const rows = Array.from(document.querySelectorAll("#Citas tbody tr"));
            const data = rows.map(row => {
                return Array.from(row.querySelectorAll("td")).map(cell => cell.innerText);
            });

            const headerRow = ["Nro. Cita", "Cliente", "Fecha", "Hora", "Servicio", "Comentario", "Estado", "Tecnico asignado", "Atendido"];
            const titleRow = ["Lista de Citas"];

            const workbook = XLSX.utils.book_new();
            const worksheet = XLSX.utils.aoa_to_sheet([titleRow, headerRow].concat(data));

            XLSX.utils.book_append_sheet(workbook, worksheet, "Citas");
            XLSX.writeFile(workbook, "citas.xlsx");
        });


    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.0/xlsx.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.7.0/jspdf.plugin.autotable.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
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
