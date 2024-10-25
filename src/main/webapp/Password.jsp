<%-- 
    Document   : Cliente
    Created on : 11 set. 2023, 02:55:51
    Author     : LEONARDO
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <script src="alertifyjs/alertify.js"></script>
        <script src="alertifyjs/alertify.min.js"></script>


        <link rel="stylesheet" type="text/css" href="alertifyjs/css/alertify.css"/>
        <link rel="stylesheet" type="text/css" href="alertifyjs/css/themes/default.css"/>
        <!-- Semantic UI theme -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
        <!-- Bootstrap theme -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>

        <title>Cambiar Contraseña</title>
    </head>
    <body>

        <br>
        <div class="d-flex">
            <div class="card col-sm-4 mx-auto" style="border: 1px solid lightgray;">
                <div class="card-body">
                    <br>
                    <h2 style="text-align: center; color: blue;"><b>Cambiar contraseña</b></h2>
                    <br>
                    <form id="cambiarContrasenaForm" action="ControladorUsuario?menu=Adm" method="POST" onsubmit="return validarContrasena()">
                        <div class="form-group">
                            <label for="nuevaContrasena">Nueva Contraseña</label>
                            <input type="password" class="form-control" id="nuevaContrasena" name="nuevaContrasena" placeholder="Ingrese la nueva contraseña" maxlength="8">
                            <p id="error-Pass1" style="color: red;"></p>
                        </div>
                        <div class="form-group">
                            <label for="confirmarContrasena">Confirmar Contraseña</label>
                            <input type="password" class="form-control" id="confirmarContrasena" name="confirmarContrasena" placeholder="Confirme la contraseña" maxlength="8">
                            <p id="error-Pass2" style="color: red;"></p>
                        </div>
                        <div id="mensaje-container">
                            <div class="alert alert-light" role="alert" id="mensajeError" style="color: red; font-size: 1.3em;">
                                <p class="text-bold"><b>${mensajeError}</p>
                            </div>
                            <div class="alert alert-light" role="alert" id="mensajeExito" style="color: green; font-size: 1.3em;">
                                <p class="text-bold"><b>${mensajeExito}</p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" id="idUsuario" name="idUsuario" value="${usuario.getIdUsuario()}">
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-success btn-info" id="btnActualizar" style="width: 100%">

                        </div>
                    </form>
                </div>
            </div>


    </body>

    <script>


        function validarContrasena() {

            var nuevaContrasenaInput = document.getElementById('nuevaContrasena');
            var confirmarContrasenaInput = document.getElementById('confirmarContrasena');
            var errorPass1 = document.getElementById("error-Pass1");
            var errorPass2 = document.getElementById("error-Pass2");

            var nuevaContrasena = nuevaContrasenaInput.value;
            var confirmarContrasena = confirmarContrasenaInput.value;

            if (nuevaContrasena.trim() === '' || confirmarContrasena.trim() === '') {
                alert('Por favor, complete ambos campos de contraseña.');
                return false;
            }

            const expPass = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            if (!expPass.test(nuevaContrasena)) {
                errorPass1.textContent = "Contrasena no cumple el formato requerido. Debe tener una letra mayuscula, minuscula, numeros y caracter especial.";
                nuevaContrasenaInput.focus();
                return false;

            } else {
                errorPass1.textContent = '';
            }

            if (!expPass.test(confirmarContrasena)) {
                errorPass2.textContent = "Contrasena no cumple el formato requerido. Debe tener una letra mayuscula, minuscula, numeros y caracter especial.";
                confirmarContrasenaInput.focus();
                return false;

            } else {
                errorPass2.textContent = '';
            }
            return true;
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
