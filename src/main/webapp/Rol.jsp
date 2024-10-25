<%-- 
    Document   : Cliente
    Created on : 11 set. 2023, 02:55:51
    Author     : LEONARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Modelos.Rol" %>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  --%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <title>Roles</title>
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
                    <form action="ControladorRoles?menu=rol" method="POST">
                        <c:out value="${nombreRol}" />
                        <div class="form-group nombres">
                            <label>Id Rol</label>
                            <input type="text" name="rol" value="${rol.getIdRol()}" class="form-control" id="rol" required>
                        </div>
                        <div class="form-group apellidos">
                            <label>Cargo</label>
                            <input type="text" name="cargo" value="${rol.getNombreRol()}" class="form-control" id="cargo" required>
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
                            <th>Id Rol</th>
                            <th>Cargo</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        // obteniendo lista de profesionales
                        List<Rol> nombreRol = (List<Rol>) request.getAttribute("nombreRol");
                        if (nombreRol != null) {
                            for (Rol nombreRoles : nombreRol) {
                    %>
                    <tr>
                        <td><%= nombreRoles.getIdRol()%></td>
                        <td><%= nombreRoles.getNombreRol()%></td>
                        <td>
                                    <a class="btn btn-warning" href="ControladorRoles?menu=rol&accion=editar&id=<%= nombreRoles.getIdRol()%>" data-toggle="tooltip"  title="Editar" data-original-title="Editar" onclick="return confirmarEditar()"><i class="fa fa-pencil-alt"></i></a>
                                    <a class="btn btn-danger" href="ControladorRoles?menu=rol&accion=eliminar&id=<%= nombreRoles.getIdRol()%>" data-toggle="tooltip"  title="Eliminar" data-original-title="Eliminar" onclick="return confirmarEliminar()"><i class="fas fa-trash"></i></a>
                                </td>
                    </tr>
                    <%
                       
                            }
                        }
                    %>
                        <%--
                        <c:forEach var="rl" items="${nombreRol}">
                            <tr class="text-center">
                                <td>${rl.getIdRol()}</td>
                                <td>${rl.getNombreRol()}</td>
                                
                                <td>
                                    <a class="btn btn-warning" href="ControladorRoles?menu=rol&accion=editar&id=${rl.getIdRol()}" data-toggle="tooltip"  title="Editar" data-original-title="Editar" onclick="return confirmarEditar()"><i class="fa fa-pencil-alt"></i></a>
                                    <a class="btn btn-danger" href="ControladorRoles?menu=rol&accion=eliminar&id=${rl.getIdRol()}" data-toggle="tooltip"  title="Eliminar" data-original-title="Eliminar" onclick="return confirmarEliminar()"><i class="fas fa-trash"></i></a>
                                </td>

                            </tr>
                        </c:forEach> --%>
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
