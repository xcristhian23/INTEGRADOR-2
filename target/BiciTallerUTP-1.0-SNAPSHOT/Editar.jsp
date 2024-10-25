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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

        <title>JSP Page</title>
    </head>
    <body onload="seleccionarTipoDocumento(${usuario.getIdTipoDocumento()})">
        <br>
        <div class="container">
            <div class="card-body" style="border: 1px solid lightgray;">
                <br>
                <form id="form-emp" action="ControladorUsuario?menu=Perfil" method="POST" class="row g-2 needs-validation" onsubmit="return validarDatos()">
                    <h3><b>Información de usuario</b></h3>
                    <div class="form-group col-md-2">
                        <label><b>Id Usuario</b></label>
                        <input type="text" name="usuario" value="${usuario.getIdUsuario()}" class="form-control" id="idUsuario" disabled>
                        <input type="hidden" name="idUsuario" value="${usuario.getIdUsuario()}">
                    </div>
                    <div class="form-group col-md-2">
                        <label><b>Cargo</b></label>
                        <c:if test="${usuario.getIdRol() == 1}">
                        <input type="text" value="Administrador" class="form-control" id="idRol" disabled>
                        </c:if>
                        <c:if test="${usuario.getIdRol() == 2}">
                        <input type="text" value="Tecnico" class="form-control" id="idRol" disabled>
                        </c:if>
                        <c:if test="${usuario.getIdRol() == 3}">
                        <input type="text" value="Cliente" class="form-control" id="idRol" disabled>
                        </c:if>
                    </div>
                    <div class="form-group col-md-8">
                        <label><b>Correo electrónico</b></label>
                        <input type="email" name="correo" value="${usuario.getCorreo()}" class="form-control" id="correo" disabled>
                    </div>
                     <div class="d-flex justify-content-end">
                            <input type="submit" name="accion" value="Editar" class="btn btn-warning btn-info" id="btnEditar" onclick="return editar()">
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-success btn-info" id="btnActualizar" disabled>
                            
                     </div>
                    <div class="divider">
                        <hr class="my-4 w-100 border-info">
                    </div>
                    <br>
                    <h3><b>Actualizar información</b></h3>
                    <br>
                    <div class="form-group col-md-6">
                        <label for="nombres">Nombres:</label>
                        <input type="text" id="nombres" name="nombres" class="form-control" value="${usuario.getNombre()}" required disabled>

                    </div>
                    <div class="form-group col-md-6">
                        <label for="apellidos">Apellidos:</label>
                        <input type="text" id="apellidos" name="apellidos" class="form-control" value="${usuario.getApellido()}" required disabled>

                    </div>
                    <div class="form-group col-md-4">
                        <label for="tipo">Tipo de documento:</label>
                        <select id="select2" class="form-control" onchange="ShowSelected();" disabled>
                            <option value="0">Seleccione una opción</option>
                            <option value="1">DNI</option>
                            <option value="2">CE</option>
                            <option value="3">Pasaporte</option>
                        </select>
                        <input type="hidden" id="tipoSelecionado" name="nom_Tipo" >
                    </div>
                    <div class="form-group col-md-4"> 
                        <label>Nro. Documento</label>
                        <input type="text" name="documento" value="${usuario.getDocumento()}" class="form-control" id="documento" maxlength="10" required disabled></div>

                    <div class="form-group col-md-4">
                        <label>Celular</label>
                        <input type="tel" name="celular" class="form-control" value="${usuario.getTelefono()}" id="celular" maxlength="9" required disabled>
                        <p id="error-celular" style="color: red;"></p>
                    </div>
                    <div class="form-group direccion">
                        <label>Dirección</label>
                        <input type="text" name="direccion" value="${usuario.getDireccion()}" class="form-control" id="direccion" required disabled>
                    </div>
                    <div id="mensaje-container">
                        <div class="alert alert-light" role="alert" id="mensajeError" style="color: red; font-size: 1.3em;">
                            <p class="text-bold"><b>${mensajeError}</b></p>
                        </div>
                        <div class="alert alert-light" role="alert" id="mensajeExito" style="color: green; font-size: 1.3em;">
                            <p class="text-bold"><b>${mensajeExito}</b></p>
                        </div>
                    </div>
                </form>
            </div>

        </div>

    </body>

    <script>

        function seleccionarTipoDocumento(tipoDocumento) {
            var select2 = document.getElementById("select2");

            for (var i = 0; i < select2.options.length; i++) {
                if (select2.options[i].value == tipoDocumento) {
                    select2.selectedIndex = i;
                    break;
                }
            }
        }

        function editar() {
            // Muestra un cuadro de diálogo de confirmación
            var confirmacion = confirm('¿Deseas editar sus datos?');
            


            // Si el usuario elige cancelar, devuelve falso y evita que el enlace se siga
            if (!confirmacion) {
                alert("¡Edición cancelada!");
                document.getElementById("btnEditar").disabled = false;
                document.getElementById("nombres").disabled = true;
                document.getElementById("apellidos").disabled = true;
                document.getElementById("select2").disabled = true;
                document.getElementById("documento").disabled = true;
                document.getElementById("celular").disabled = true;
                document.getElementById("direccion").disabled = true;
                // Habilitar el botón "Actualizar"
                document.getElementById("btnActualizar").disabled = true;
                return false;
            } else{
                document.getElementById("btnEditar").disabled = true;

                // Habilitar los campos de nombre, apellidos, tipo de documento, nro documento, celular y direccion
                document.getElementById("nombres").disabled = false;
                document.getElementById("apellidos").disabled = false;
                document.getElementById("select2").disabled = false;
                document.getElementById("documento").disabled = false;
                document.getElementById("celular").disabled = false;
                document.getElementById("direccion").disabled = false;
                document.getElementById("nombres").focus();
                // Habilitar el botón "Actualizar"
                document.getElementById("btnActualizar").disabled = false;
                return true;
            }
        }

        function ShowSelected() {
            $('#tipoSelecionado').val($("#select2 option:selected").text());

        }


        function validarDatos() {
            var errorCelular = document.getElementById("error-celular");
            var celularInput = document.getElementById("celular");
            var celular = celularInput.value;

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
