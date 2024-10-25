<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="css/estilos.css" type="text/css" media="all">
       	<link rel="shortcut icon" type="image/png" href="favicon.png" />

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

        <title>Crea tu cuenta</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url('fondo.png'); /* Reemplaza 'tu_logo.png' con la ruta de tu logo */
                background-size: cover;
                background-attachment: fixed;
                background-blur: 5px; /* Ajusta el valor de desenfoque que desees */
            }
            .container {
                max-width: 1000px;
                margin: 0 auto;
                padding: 20px;
                background-color: rgba(255, 255, 255, 0.8);
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
            }
            input[type="text"],
            input[type="email"],
            input[type="password"],
            input[type="tel"],
            select,
            textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .btn-container {
                text-align: center;
            }
            .btn {
                padding: 10px 20px;
                background-color: #007bff; /* Cambia el color del botón según tus preferencias */
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .btn.cancel {
                background-color: #007bff; /* Cambia el color del botón Cancelar según tus preferencias */
            }
        </style>
    </head>
    <body>
        <div class="container">
            <br>
            <h2 align="center"><b>Ingresa a Bicitaller. ¡Completa tu registro!</b></h2>
            <br>
            <form id="contact-form" method = "POST" action="Registrar" class="row g-3 needs-validation" onsubmit="return validarDatos()">
                <div class="form-group nombres col-md-6">
                    <label for="nombres">Nombres:</label>
                    <input type="text" id="nombres" name="nombres" class="form-control" required>

                </div>
                <div class="form-group apellidos col-md-6">
                    <label for="apellidos">Apellidos:</label>
                    <input type="text" id="apellidos" name="apellidos" class="form-control" required>

                </div>
                <div class="form-group col-md-4">
                    <label for="tipoDocumento">Tipo de documento:</label>
                    <select id="tipoDocumento" class="form-control" onchange="ShowSelected()">
                        <option value="0">DNI</option>
                        <option value="1">CE</option>
                        <option value="2">Pasaporte</option>
                    </select>
                    <input type="hidden" id="selecionado" name="Tipo" >
                </div>
                <div class="form-group col-md-4">
                    <label for="nroDocumento">Nro. Documento:</label>
                    <input type="text" id="nroDocumento" name="nroDocumento" class="form-control" required minlength="8" maxlength="10">

                </div>
                <div class="form-group telefono col-md-4">
                    <label for="telefono">Teléfono:</label>
                    <input type="tel" id="telefono" name="telefono" class="form-control" required maxlength="9">
                    <p id="error-celular" style="color: red;"></p>
                </div>
                <div class="form-group correo col-md-4">
                    <label for="correo">Correo Electrónico:</label>
                    <input type="email" id="correo" name="correo" class="form-control" required>
                    <p id="error-correo" style="color: red;"></p>
                </div>
                <div class="form-group contrasena col-md-4">
                    <label for="contrasena">Contraseña:</label>
                    <input type="password" id="contrasena" name="contrasena"  class="form-control"required maxlength="8">
                    <p id="error-Pass" style="color: red;"></p>
                </div>

                <div class="form-group direccion col-md-4">
                    <label for="direccion">Dirección:</label>
                    <textarea id="direccion" name="direccion" rows="4" class="form-control" required></textarea>
                    <p id="error-message" style="color: red;"></p>
                </div>
                
                <div id="mensaje-container">
                    <div class="alert alert-success d-flex align-items-center" role="alert" style="color: green; font-size: 1.2em;">
                       <p class="text-bold"><b>${mensajeExito}</p>
                    </div>
                    <div class="alert alert-danger d-flex align-items-center" role="alert" style="color: red; font-size: 1.2em;">
                       <p class="text-bold"><b>${mensajeError}</p>
                    </div>
                </div>
                <div class="btn-container">
                    <button type="submit" class="btn btn-primary btn-lg" name="accion" value="insertar">Registrarse</button>
                    <button type="button" class="btn cancel btn-lg">Cancelar</button>
                </div>
            </form>
        </div>

        <script>

            document.querySelector(".btn.cancel").addEventListener("click", function () {
                window.location.href = "index.jsp"; // Reemplaza con la URL de tu página principal
            });

            function ShowSelected() {
                $('#selecionado').val($("#tipoDocumento option:selected").text());
            }

            function validarDatos() {
                var correoInput = document.getElementById("correo");
                var errorCelular = document.getElementById("error-celular");
                var celularInput = document.getElementById("telefono");
                var errorCorreo = document.getElementById("error-correo");
                var passInput = document.getElementById("contrasena");
                var errorPass = document.getElementById("error-Pass");
                var correo = correoInput.value;
                var celular = celularInput.value;
                var pass = passInput.value;


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

                const expPass = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                if (!expPass.test(pass)) {
                    errorPass.textContent = "Contrasena no cumple el formato requerido. Debe tener una letra mayuscula, minuscula, numeros y caracter especial.";
                    passInput.focus();
                    return false;

                } else {
                    errorPass.textContent = '';
                }

                return true; // Permite que el formulario se envíe
            }


        </script>

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


    </body>
</html>