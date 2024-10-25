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
        <div class="d-flex">
            <div class="card col-sm-3">
                <div class="card-body">
                    <form id="form-emp" action="ControladorUsuario?menu=Emp" method="POST" onsubmit="return validarDatos()">
                        <div class="form-group nombres">
                            <label>Nombres</label>
                            <input type="text" name="nombres" value="${usuario.getNombre()}" class="form-control"id="nombres" required>
                        </div>
                        <div class="form-group apellidos">
                            <label>Apellidos</label>
                            <input type="text" name="apellidos" value="${usuario.getApellido()}" class="form-control" id="apellidos" required>
                        </div>
                        <div class="form-group">
                            <label>Cargo:</label>
                            <select id="select1" class="form-control" onchange="ShowSelected('select1');">
                                <option value="0">Seleccione una opción</option>
                                <option value="1">Administrador</option>
                                <option value="2">Tecnico</option>
                            </select>
                            <input type="hidden" id="cargoSelecionado" name="nom_Cargo" >
                        </div>
                        <div class="form-group">
                            <label>Tipo de documento:</label>
                            <select id="select2" class="form-control" onchange="ShowSelected('select2');" >
                                <option value="0">Seleccione una opción</option>
                                <option value="1">DNI</option>
                                <option value="2">CE</option>
                                <option value="3">Pasaporte</option>
                            </select>
                            <input type="hidden" id="tipoSelecionado" name="nom_Tipo" >
                        </div>
                        <div class="form-group documento"> 
                            <label>Nro. Documento</label>
                            <input type="text" name="documento" value="${usuario.getDocumento()}" class="form-control" id="documento" maxlength="10" required></div>
                        <div class="form-group correo"> 
                            <label>Correo electrónico</label>
                            <input type="email" name="correo" value="${usuario.getCorreo()}" class="form-control" id="correo" required></div>
                        <p id="error-correo" style="color: red;"></p>
                        <div class="form-group celular">
                            <label>Celular</label>
                            <input type="tel" name="celular" class="form-control" value="${usuario.getTelefono()}" id="celular" maxlength="9" required>
                            <p id="error-celular" style="color: red;"></p>
                        </div>
                        <div class="form-group direccion">
                            <label>Dirección</label>
                            <input type="text" name="direccion" value="${usuario.getDireccion()}" class="form-control" id="direccion" required>
                        </div><br>
                        <div style="float: right">
                            <input type="submit" name="accion" value="Agregar" class="btn btn-warning btn-info" id="btnAgregar">
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-success btn-info" id="btnActualizar"></div>
                    </form>
                </div>
            </div>

            <div class="col-sm-9">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th class="text-center">Código</th>
                            <th class="text-center">Cargo</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th class="text-center">Nro. Documento</th>
                            <th>Correo</th>
                            <th>Celular</th>
                            <th>Direccion</th>
                            <th class="text-center">Estado</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="em" items="${empleado}">
                            <tr>
                                <td class="text-center">${em.getIdUsuario()}</td>
                                <c:if test="${em.getIdRol() == 2}">
                                <td class="text-center">Tecnico</td>
                                </c:if>
                                <td>${em.getNombre()}</td>
                                <td>${em.getApellido()}</td>
                                <td class="text-center">${em.getDocumento()}</td>
                                <td>${em.getCorreo()}</td>
                                <td>${em.getTelefono()}</td>
                                <td>${em.getDireccion()}</td>
                                <c:if test="${em.isEstado() == true}">
                                    <td class="text-center"><span class="badge badge-success ">Activo</span></td> 
                                </c:if>
                                <c:if test="${em.isEstado() == false}">
                                    <td class="text-center"><span class="badge badge-danger">Inactivo</span></td> 
                                </c:if>
                                <td class="text-center">
                                    <a class="btn btn-warning" href="ControladorUsuario?menu=Emp&accion=editar&id=${em.getIdUsuario()}" data-toggle="tooltip"  title="Editar" data-original-title="Editar" onclick="return confirmarEditar()"><i class="fa fa-pencil-alt"></i></a>
                                    <a class="btn btn-danger" href="ControladorUsuario?menu=Emp&accion=delete&id=${em.getIdUsuario()}" data-toggle="tooltip"  title="Eliminar" data-original-title="Eliminar" onclick="return confirmarEliminar()"><i class="fas fa-trash"></i></a>
                                        <c:choose>
                                            <c:when test="${em.isEstado() == true}">
                                            <a id="desactivarUsuario" href="ControladorUsuario?menu=Emp&accion=desactivar&id=${em.getIdUsuario()}" class="btn btn-danger"  data-toggle="tooltip" title="Desactivar" data-original-title="Desactivar">
                                                <i class="fa fa-power-off"></i></a>
                                            </c:when>
                                            <c:otherwise>
                                            <a id="activarUsuario" href="ControladorUsuario?menu=Emp&accion=activar&id=${em.getIdUsuario()}" class="btn btn-primary" data-toggle="tooltip" title="Activar" data-original-title="Activar">
                                                <i class="fas fa-check-circle"></i></a>
                                            </c:otherwise>
                                        </c:choose>
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



    </script>
   
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
