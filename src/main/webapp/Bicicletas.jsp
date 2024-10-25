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

        <div class="d-flex">
            <div class="card col-sm-3">
                <div class="card-body">
                    <form id="form-emp" action="ControladorUsuario?menu=Bici" method="POST">
                        <input type="hidden" name="idUsuario" value="${marca.getIdUsuario()}">
                        <input type="hidden" name="idBicicleta" value="${marca.getIdBicicleta()}">
                        <input type="hidden" name="marca" value="${marca.getMarca()}">
                        <input type="hidden" name="modelo" value="${marca.getModelo()}">
                        
                        <div class="form-group aro"> 
                            <label>Aro</label>
                            <input type="text" name="aro" value="${marca.getAro()}" class="form-control" id="aro" maxlength="4" required></div>
                        <div class="form-group color">
                            <label>Color</label>
                            <input type="text" name="color" class="form-control" value="${marca.getColor()}" id="color" maxlength="10" required>
                        </div>
                        <div style="float: right">
                            
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-success btn-info" id="btnActualizar"></div>
                    </form>
                </div>
            </div>

            <div class="col-sm-9">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th class="text-center">Id_Bicicleta</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Aro</th>
                            <th>Color</th>
                            <th>Estado</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                         
                        <c:forEach var="bx" items="${bicicleta}">
                            <tr>
                                <td class="text-center">${bx.getIdBicicleta()}</td>
                                <td>${bx.getMarca()}</td>
                                <td>${bx.getModelo()}</td>
                                <td>${bx.getAro()}</td>
                                <td>${bx.getColor()}</td>
                                <c:if test="${bx.isEstado() == true}">
                                    <td><span class="badge badge-success ">Activo</span></td> 
                                </c:if>
                                <c:if test="${bx.isEstado() == false}">
                                    <td><span class="badge badge-danger">Inactivo</span></td> 
                                </c:if>
                                <td class="text-center">
                                    <c:if test="${bx.isEstado() == true}">
                                    <a class="btn btn-warning" href="ControladorUsuario?menu=Bici&accion=editar&id=${bx.getIdBicicleta()}" data-toggle="tooltip"  title="Editar" data-original-title="Editar" onclick="return confirmarEditar()"><i class="fa fa-pencil-alt"></i></a>
                                    <a class="btn btn-danger" href="ControladorUsuario?menu=Bici&accion=delete&id=${bx.getIdBicicleta()}" data-toggle="tooltip"  title="Eliminar" data-original-title="Eliminar" onclick="return confirmarEliminar()"><i class="fas fa-trash"></i></a>
                                    <a class="btn btn-primary" href="ControladorUsuario?menu=Cita&accion=listar&id=${bx.getIdBicicleta()}" data-toggle="tooltip"  title="Programar cita" data-original-title="Programar cita"><i class="fas fa-calendar-plus"></i></a>
                                    </c:if>
                                    <c:if test="${bx.isEstado() == false}">
                                    
                                    </c:if>
                                    <c:choose>
                                            <c:when test="${bx.isEstado() == true}">
                                            <a id="desactivarBicicleta" href="ControladorUsuario?menu=Bici&accion=desactivar&id=${bx.getIdBicicleta()}" class="btn btn-danger"  data-toggle="tooltip" title="Desactivar" data-original-title="Desactivar">
                                                <i class="fa fa-power-off"></i></a>
                                            </c:when>
                                            <c:otherwise>
                                            <a id="activarBicicleta" href="ControladorUsuario?menu=Bici&accion=activar&id=${bx.getIdBicicleta()}" class="btn btn-primary" data-toggle="tooltip" title="Activar" data-original-title="Activar">
                                                <i class="fas fa-check-circle"></i></a>
                                            </c:otherwise>
                                        </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div id="mensaje-container">
                    <div class="alert alert-light" role="alert" id="mensajeError" style="color: red; font-size: 1.1em;">
                        <p class="text-bold"><b>${mensajeError}</b></p>
                    </div>
                    <div class="alert alert-light" role="alert" id="mensajeExito" style="color: green; font-size: 1.1em;">
                        <p class="text-bold"><b>${mensajeExito}</b></p>
                    </div>
                </div>
            </div>    
        </div>

    </body>

    <script>

        function confirmarEditar() {
            // Muestra un cuadro de diálogo de confirmación
            var confirmacion = confirm('¿Deseas editar este registro?');
            
            // Si el usuario elige cancelar, devuelve falso y evita que el enlace se siga
            if (!confirmacion) {
                alert("¡Edición cancelada!");
                return false;
                
            } else {
                return true;
            }
        }

        function confirmarEliminar() {
            // Muestra un cuadro de diálogo de confirmación
            var confirmacion = confirm('¿Seguro que desea eliminar este registro?');
            // Si el usuario elige cancelar, devuelve falso y evita que el enlace se siga
            if (confirmacion) {
                return true;
            } else {
                return false;
            }
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
