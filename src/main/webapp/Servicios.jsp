<%-- 
    Document   : Cliente
    Created on : 11 set. 2023, 02:55:51
    Author     : LEONARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <title>Servicios</title>
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
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="ControladorServicios?menu=servicios" method="POST">
                        <div class="form-group id">
                            <label>Id Servicio</label>
                            <input type="text" name="idServicio" value="${servicios.getIdServicio()}" class="form-control" id="idServicio" required>
                        </div>
                        <div class="form-group nombre">
                            <label>Servicio</label>
                            <input type="text" name="nombre" value="${servicios.getNombreServicio()}" class="form-control" id="nombre" required>
                        </div>
                        <br>
                        <div style="float: right">
                            <input type="submit" name="accion" value="Agregar" class="btn btn-warning btn-info" id="btnAgregar">
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-success btn-info" id="btnActualizar">
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-7">
                <table class="table table-hover">
                    <thead>
                        <tr class="text-center">
                            <th>Id Servicio</th>
                            <th>Servicio</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${nombre}">
                            <tr class="text-center">
                                <td>${s.getIdServicio()}</td>
                                <td>${s.getNombreServicio()}</td>
                                <td>
                                    <a class="btn btn-warning" href="ControladorServicios?menu=servicios&accion=editar&id=${s.getIdServicio()}" data-toggle="tooltip"  title="Editar" data-original-title="Editar" onclick="return confirmarEditar()"><i class="fa fa-pencil-alt"></i></a>
                                    <a class="btn btn-danger" href="ControladorServicios?menu=servicios&accion=eliminar&id=${s.getIdServicio()}" data-toggle="tooltip"  title="Eliminar" data-original-title="Eliminar" onclick="return confirmarEliminar()"><i class="fas fa-trash"></i></a>
                                </td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>    
        </div>
        
    </body>
    <script>
        
        function confirmarEditar() {
            // Muestra un cuadro de diálogo de confirmación
            var confirmacion = confirm('¿Deseas editar el registro?');

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
        
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.2/dist/umd/popper.min.js" integrity="sha384-q9CRHqZndzlxGLOj+xrdLDJa9ittGte1NksRmgJKeCV9DrM7Kz868XYqsKWPpAmn" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</html>
