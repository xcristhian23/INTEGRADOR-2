<%-- 
    Document   : Cliente
    Created on : 11 set. 2023, 02:55:51
    Author     : LEONARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

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
        <style>
            .table th {
                background-color: lightgray;
            }

            .table tbody tr {
                background-color: white;
            }

        </style>
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
                            <th class="text-center">Código</th>
                            <th>Cargo</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Nro. Documento</th>
                            <th>Correo</th>
                            <th>Celular</th>
                            <th>Direccion</th>
                            <th class="text-center">Estado</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cl" items="${cliente}">
                            <tr>
                                <td class="text-center">${cl.getIdUsuario()}</td>
                                <c:if test="${cl.getIdRol() == 3}">
                                    <td>Cliente</td>
                                </c:if>
                                <td>${cl.getNombre()}</td>
                                <td>${cl.getApellido()}</td>
                                <td>${cl.getDocumento()}</td>
                                <td>${cl.getCorreo()}</td>
                                <td>${cl.getTelefono()}</td>
                                <td>${cl.getDireccion()}</td>
                                <c:if test="${cl.isEstado() == true}">
                                    <td class="text-center"><span class="badge badge-success ">Activo</span></td> 
                                </c:if>
                                <c:if test="${cl.isEstado() == false}">
                                    <td class="text-center"><span class="badge badge-danger">Inactivo</span></td> 
                                </c:if>
                                <td class="text-center">
                                    <c:if test="${cl.isEstado() == false}">
                                        <a id="activarUsuario" href="ControladorUsuario?menu=Clientes&accion=activar&id=${cl.getIdUsuario()}" class="btn btn-primary" data-toggle="tooltip" title="Activar" data-original-title="Activar">
                                            <i class="fas fa-check-circle"></i></a>
                                        </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div id="mensaje-container">
                    <div class="alert alert-light" role="alert" id="mensajeError" style="color: red; font-size: 1.1em;">
                        <p class="text-bold"><b>${mensajeError}</p>
                    </div>
                    <div class="alert alert-light" role="alert" id="mensajeExito" style="color: green; font-size: 1.1em;">
                        <p class="text-bold"><b>${mensajeExito}</p>
                    </div>
                </div>
                <div style="float: right">
                    <button id="exportButton" class="btn btn-success">Exportar a excel <i class="fas fa-file-excel"></i></button>  
                </div>
            </div>    
        </div>

    </body>

    <script>

        function confirmarEditar() {
            // Muestra un cuadro de diálogo de confirmación
            var confirmacion = confirm('¿Deseas editar este empleado?');
            // Si el usuario elige cancelar, devuelve falso y evita que el enlace se siga
            if (!confirmacion) {
                return false;
            }
        }

        function confirmarEliminar() {
            // Muestra un cuadro de diálogo de confirmación
            var confirmacion = confirm('¿Seguro que desea eliminar este registro?');
            // Si el usuario elige cancelar, devuelve falso y evita que el enlace se siga
            if (!confirmacion) {
                return false;
            }
        }

        function ShowSelected(selectorId) {
            if (selectorId === 'select1') {
                $('#cargoSelecionado').val($("#select1 option:selected").text());
            } else if (selectorId === 'select2') {
                $('#tipoSelecionado').val($("#select2 option:selected").text());
            }
        }


        function validarDatos() {
            var correoInput = document.getElementById("correo");
            var errorCelular = document.getElementById("error-celular");
            var celularInput = document.getElementById("celular");
            var errorCorreo = document.getElementById("error-correo");
            var correo = correoInput.value;
            var celular = celularInput.value;


            // Expresión regular para validar un correo electrónico
            var regexCorreo = /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;

            if (!regexCorreo.test(correo)) {
                errorCorreo.textContent = 'Correo electrónico no válido';
                correoInput.focus();
                return false; // Evita que el formulario se envíe

            } else {
                errorCorreo.textContent = '';
            }

            // Validación del número de celular
            const expTel = /^9[0-9]{8}$/;
            if (!expTel.test(celular)) {
                errorCelular.textContent = 'Número de celular no válido (debe comenzar con 9)';
                celularInput.focus();
                return false; // Evita que el formulario se envíe

            } else {
                errorCelular.textContent = '';
            }

            return true; // Permite que el formulario se envíe
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


        document.getElementById("exportButton").addEventListener("click", () => {
            const rows = Array.from(document.querySelectorAll("table tbody tr"));
            const data = rows.map(row => {
                return Array.from(row.querySelectorAll("td")).map(cell => cell.innerText);
            });

            const headerRow = ["Código", "Cargo", "Nombres", "Apellidos", "Nro. Documento", "Correo", "Celular", "Dirección", "Estado"];
            const titleRow = ["Lista de Clientes"];

            const workbook = XLSX.utils.book_new();
            const worksheet = XLSX.utils.aoa_to_sheet([titleRow, headerRow].concat(data));

            XLSX.utils.book_append_sheet(workbook, worksheet, "Clientes");
            XLSX.writeFile(workbook, "clientes.xlsx");
        });



    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.0/xlsx.full.min.js"></script>
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
