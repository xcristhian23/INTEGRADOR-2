/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelos.Bicicleta;
import Modelos.BicicletaDAO;
import Modelos.Citas;
import Modelos.CitasDAO;
import Modelos.Servicios;
import Modelos.ServiciosDAO;
import Modelos.Usuario;
import Modelos.UsuarioDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladorUsuario extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();
    BicicletaDAO bdao = new BicicletaDAO();
    CitasDAO cdao = new CitasDAO();
    ServiciosDAO sdao = new ServiciosDAO();
    Usuario u = new Usuario();
    Bicicleta b = new Bicicleta();
    Citas c = new Citas();
    Servicios s = new Servicios();
    int ide;
    int cantidad;
    int r;
    int idTipo;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        
        if (menu.equals("Emp")) {
            switch (accion) {
                case "listar":
                    //ide = Integer.parseInt(request.getParameter("id"));
                    List lista = dao.listar();
                    request.setAttribute("empleado", lista);
                    break;

                case "Agregar":
                    String claveRandom = "12345678";
                    String correo = request.getParameter("correo");
                    int celular = Integer.parseInt(request.getParameter("celular"));
                    String cargo = request.getParameter("nom_Cargo");
                    String tipo = request.getParameter("nom_Tipo");
                    int documento = Integer.parseInt(request.getParameter("documento"));
                    String nombres = request.getParameter("nombres");
                    String apellidos = request.getParameter("apellidos");
                    String direccion = request.getParameter("direccion");
                    cantidad = dao.ValidarDuplicado(correo, documento);
                    if (cantidad == 0) {
                        if (cargo.equals("Administrador")) {
                            u.setIdRol(1);
                        } else {
                            u.setIdRol(2);
                        }
                        if (tipo.equals("DNI")) {
                            u.setIdTipoDocumento(1);
                        } else {
                            if (tipo.equals("CE")) {
                                u.setIdTipoDocumento(2);
                            } else {
                                u.setIdTipoDocumento(3);
                            }
                        }
                        u.setNombre(nombres);
                        u.setApellido(apellidos);
                        u.setDocumento(documento);
                        u.setCorreo(correo);
                        u.setTelefono(celular);
                        u.setDireccion(direccion);
                        u.setPassword(claveRandom);
                        u.setEstado(true);
                        dao.add(u);
                        request.setAttribute("mensajeExito", "¡Se realizó el registro satisfactoriamente!");
                        request.getRequestDispatcher("ControladorUsuario?menu=Emp&accion=listar").forward(request, response);
                    } else {
                        request.setAttribute("mensajeError", "Correo y/o Nro. de documento ya se encuentran registrados");
                        request.getRequestDispatcher("ControladorUsuario?menu=Emp&accion=listar").forward(request, response);
                    }
                    break;

                case "editar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    Usuario us = dao.listarId(ide);
                    request.setAttribute("usuario", us);
                    request.getRequestDispatcher("ControladorUsuario?menu=Emp&accion=listar").forward(request, response);
                    break;

                case "Actualizar":
                    String cargo1 = request.getParameter("nom_Cargo");
                    String tipo1 = request.getParameter("nom_Tipo");
                    int documento1 = Integer.parseInt(request.getParameter("documento"));
                    String nombres1 = request.getParameter("nombres");
                    String apellidos1 = request.getParameter("apellidos");
                    String correo1 = request.getParameter("correo");
                    String direccion1 = request.getParameter("direccion");
                    int celular1 = Integer.parseInt(request.getParameter("celular"));
                    if (cargo1.equals("Administrador")) {
                        u.setIdRol(1);
                    } else {
                        u.setIdRol(2);
                    }
                    if (tipo1.equals("DNI")) {
                        u.setIdTipoDocumento(1);
                    } else {
                        if (tipo1.equals("CE")) {
                            u.setIdTipoDocumento(2);
                        } else {
                            u.setIdTipoDocumento(3);
                        }
                    }
                    u.setNombre(nombres1);
                    u.setApellido(apellidos1);
                    u.setDocumento(documento1);
                    u.setCorreo(correo1);
                    u.setTelefono(celular1);
                    u.setDireccion(direccion1);
                    u.setIdUsuario(ide);
                    dao.actualizar(u);
                    request.setAttribute("mensajeExito", "¡Registro actualizado satisfactoriamente!");
                    request.getRequestDispatcher("ControladorUsuario?menu=Emp&accion=listar").forward(request, response);
                    break;

                case "delete":
                    ide = Integer.parseInt(request.getParameter("id"));
                    dao.eliminar(ide);
                    request.setAttribute("mensajeExito", "¡Registro eliminado!");
                    request.getRequestDispatcher("ControladorUsuario?menu=Emp&accion=listar").forward(request, response);
                    break;

                case "desactivar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    u.setIdUsuario(ide);
                    u.setEstado(false);
                    dao.actualizarEstado(u);
                    request.setAttribute("mensajeExito", "¡Se cambió estado de usuario!");
                    request.getRequestDispatcher("ControladorUsuario?menu=Emp&accion=listar").forward(request, response);
                    break;

                case "activar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    u.setIdUsuario(ide);
                    u.setEstado(true);
                    dao.actualizarEstado(u);
                    request.setAttribute("mensajeExito", "¡Se cambió estado de usuario!");
                    request.getRequestDispatcher("ControladorUsuario?menu=Emp&accion=listar").forward(request, response);
                    break;

            }

            request.getRequestDispatcher("Empleados.jsp").forward(request, response);

        }

        if (menu.equals("Adm")) {
            switch (accion) {
                case "listar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    Usuario usu = dao.listarId(ide);
                    request.setAttribute("usuario", usu);
                    break;

                case "Actualizar":
                    int id = Integer.parseInt(request.getParameter("idUsuario"));
                    String clave = request.getParameter("nuevaContrasena");
                    String clave1 = request.getParameter("confirmarContrasena");
                    if (clave.equals(clave1)) {
                        u.setPassword(clave);
                        u.setIdUsuario(id);
                        r = dao.actualizarContrasena(u);
                        request.setAttribute("mensajeExito", "Se actualizó satisfactoriamente");
                        request.getRequestDispatcher("Password.jsp").forward(request, response);

                    } else {
                        request.setAttribute("mensajeError", "No se realizó la solicitud, las contraseñas no coinciden. Intente de nuevo");
                        request.getRequestDispatcher("ControladorUsuario?menu=Adm&accion=listar&id=" + id).forward(request, response);
                    }

                    request.getRequestDispatcher("ControladorUsuario?menu=Adm&accion=listar&id=" + id).forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Password.jsp").forward(request, response);

        }

        if (menu.equals("Perfil")) {
            switch (accion) {
                case "listar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    Usuario usu = dao.listarId(ide);
                    request.setAttribute("usuario", usu);
                    break;

                case "Actualizar":
                    int idu = Integer.parseInt(request.getParameter("idUsuario"));
                    String nombres = request.getParameter("nombres");
                    String apellidos = request.getParameter("apellidos");
                    int nroDocumento = Integer.parseInt(request.getParameter("documento"));
                    int celular = Integer.parseInt(request.getParameter("celular"));
                    String direccion = request.getParameter("direccion");
                    String tipo = request.getParameter("nom_Tipo");

                    if (tipo.equals("DNI")) {
                        u.setIdTipoDocumento(1);
                        idTipo = 1;
                    } else if (tipo.equals("CE")) {
                        u.setIdTipoDocumento(2);
                        idTipo = 2;
                    } else if (tipo.equals("Pasaporte")) {
                        u.setIdTipoDocumento(3);
                        idTipo = 3;
                    } else {
                        idTipo = 0;
                    }

                    u.setNombre(nombres);
                    u.setApellido(apellidos);
                    u.setDocumento(nroDocumento);
                    u.setTelefono(celular);
                    u.setDireccion(direccion);
                    u.setIdUsuario(idu);
                    r = dao.actualizarPerfil(u);

                    if (r > 0 && idTipo > 0) {
                        request.setAttribute("mensajeExito", "Se actualizó satisfactoriamente");
                        request.getRequestDispatcher("ControladorUsuario?menu=Perfil&accion=listar&id=" + idu).forward(request, response);

                    } else {
                        request.setAttribute("mensajeError", "No se realizó la solicitud. Debe seleccionar tipo de documento");
                        request.getRequestDispatcher("ControladorUsuario?menu=Perfil&accion=listar&id=" + idu).forward(request, response);
                    }

                    request.getRequestDispatcher("ControladorUsuario?menu=Perfil&accion=listar").forward(request, response);
                    break;

                case "Desactivar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    u.setIdUsuario(ide);
                    u.setEstado(false);
                    dao.actualizarEstado(u);
                    request.setAttribute("mensajeError", "¡Cuenta desactivada!");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            request.getRequestDispatcher("Editar.jsp").forward(request, response);

        }

        if (menu.equals("Bici")) {
            switch (accion) {
                case "listar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    b.setIdUsuario(ide);
                    List lista = bdao.listar(ide);
                    request.setAttribute("bicicleta", lista);
                    break;

                case "Actualizar":
                    ide = Integer.parseInt(request.getParameter("idBicicleta"));
                    String marca = request.getParameter("marca");
                    String modelo = request.getParameter("modelo");
                    int aro = Integer.parseInt(request.getParameter("aro"));
                    String color = request.getParameter("color");
                    b.setMarca(marca);
                    b.setModelo(modelo);
                    b.setAro(aro);
                    b.setColor(color);
                    b.setIdBicicleta(ide);
                    r = bdao.actualizar(b);
                    request.setAttribute("mensajeExito", "¡Éxito!. Se actualizó el registro satisfactoriamente");
                    request.getRequestDispatcher("ControladorUsuario?menu=Bici&accion=listar&id=" + b.getIdUsuario()).forward(request, response);
                    break;

                case "editar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    Bicicleta bicicleta = bdao.listarId(ide);
                    request.setAttribute("marca", bicicleta);
                    request.getRequestDispatcher("ControladorUsuario?menu=Bici&accion=listar&id=" + b.getIdUsuario()).forward(request, response);
                    break;

                case "delete":
                    ide = Integer.parseInt(request.getParameter("id"));
                    bdao.eliminar(ide);
                    request.setAttribute("mensajeExito", "¡Registro eliminado!");
                    request.getRequestDispatcher("ControladorUsuario?menu=Bici&accion=listar&id=" + b.getIdUsuario()).forward(request, response);
                    break;

                case "desactivar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    b.setIdBicicleta(ide);
                    b.setEstado(false);
                    bdao.actualizarEstado(b);
                    request.setAttribute("mensajeExito", "¡Éxito!. Se realizó el cambio de estado de bicicleta!");
                    request.getRequestDispatcher("ControladorUsuario?menu=Bici&accion=listar&id=" + b.getIdUsuario()).forward(request, response);
                    break;

                case "activar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    b.setIdBicicleta(ide);
                    b.setEstado(true);
                    bdao.actualizarEstado(b);
                    request.setAttribute("mensajeExito", "¡Éxito!. Se realizó el cambio de estado de bicicleta!");
                    request.getRequestDispatcher("ControladorUsuario?menu=Bici&accion=listar&id=" + b.getIdUsuario()).forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Bicicletas.jsp").forward(request, response);

        }

        if (menu.equals("Clientes")) {
            switch (accion) {
                case "listar":
                    List lista = dao.listarClientes();
                    request.setAttribute("cliente", lista);
                    break;

                case "Desactivar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    b.setIdBicicleta(ide);
                    b.setEstado(false);
                    bdao.actualizarEstado(b);
                    request.setAttribute("mensajeError", "¡Cuenta desactivada!");
                    response.sendRedirect("index.jsp");
                    break;
                
                    case "activar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    u.setIdUsuario(ide);
                    u.setEstado(true);
                    dao.actualizarEstado(u);
                    request.setAttribute("mensajeExito", "¡Se realizó la activación de la cuenta satisfactoriamente!");
                    request.getRequestDispatcher("ControladorUsuario?menu=Clientes&accion=listar").forward(request, response);
                    break;

            }
            request.getRequestDispatcher("ListarClientes.jsp").forward(request, response);

        }

        if (menu.equals("Cita")) {
            switch (accion) {
                case "listar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    b = bdao.listarId(ide);
                    List lista = sdao.listar();
                    request.setAttribute("nombreServicio", lista);
                    request.setAttribute("bicicleta", b);
                    break;

                case "Registrar":
                    String fechaStr = request.getParameter("fecha");
                    String horaStr = request.getParameter("hora");
                    Date fecha = new SimpleDateFormat("yyyy-MM-dd").parse(fechaStr);
                    int idUser = Integer.parseInt(request.getParameter("idUsuario"));
                    int idBix = Integer.parseInt(request.getParameter("idBicicleta"));
                    String comentario = request.getParameter("comentario");
                    String marca = request.getParameter("marca");
                    String servicio = request.getParameter("Tipo");
                    int nuevoId = cdao.obtenerNuevoIdCita();
                    b.setMarca(marca);
                    c.setServicio(servicio);
                    c.setIdCitas(nuevoId);
                    c.setIdUsuario(idUser);
                    c.setIdBicicleta(idBix);
                    c.setFecha(fecha);
                    c.setHora(horaStr);
                    c.setComentario(comentario);
                    c.setEstado(true);
                    cdao.insertar(c);
                    request.setAttribute("mensajeExito", "¡Se realizó el registro satisfactoriamente!");
                    request.getRequestDispatcher("ControladorUsuario?menu=Cita&accion=listar&id=" + idBix).forward(request, response);

                    break;
            }
            request.getRequestDispatcher("Cita.jsp").forward(request, response);
        }

        if (menu.equals("ReporteCitas")) {
            switch (accion) {
                case "listarCitas":
                    List lista = cdao.listarCitas();
                    List lista1 = dao.listar();
                    request.setAttribute("nombre", lista1);
                    request.setAttribute("citas", lista);
                    break;

                case "Tecnico":
                    
                    int numero = Integer.parseInt(request.getParameter("idCita"));
                    int idT = Integer.parseInt(request.getParameter("idTecnico"));
                    String fechaCitaStr = request.getParameter("fechaCita");
                    String horaCitaStr = request.getParameter("horaCita");
                    u = dao.listarId(idT);
                    String nom = u.getNombre();
                    String ape = u.getApellido();
                    String nom_ape = nom + " " + ape;
                    c = cdao.ValidarDuplicado(horaCitaStr, nom_ape);

                    if (c.getHora() != null) {
                        if (c.getFecha().toString().equals(fechaCitaStr)) {
                            request.setAttribute("mensajeError", "¡Error!. Técnico " + nom_ape + " ya tiene asignada una cita el día: " + fechaCitaStr + " a las " + horaCitaStr);
                            request.getRequestDispatcher("ControladorUsuario?menu=ReporteCitas&accion=listarCitas").forward(request, response);
                        } else {
                            c.setIdCitas(numero);
                            c.setTecnico(nom_ape);
                            cdao.actualizar(c);
                            request.setAttribute("mensajeExito", "¡Éxito!. Se asignó Técnico " + nom_ape + " al Nro. Cita " + numero);
                            request.getRequestDispatcher("ControladorUsuario?menu=ReporteCitas&accion=listarCitas").forward(request, response);
                        }
                    } else {
                        c.setIdCitas(numero);
                        c.setTecnico(nom_ape);
                        cdao.actualizar(c);
                        request.setAttribute("mensajeExito", "¡Éxito!. Se asignó Técnico " + nom_ape + " al Nro. Cita " + numero);
                        request.getRequestDispatcher("ControladorUsuario?menu=ReporteCitas&accion=listarCitas").forward(request, response);
                    }
                    break;
                    
                case "desactivar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    c.setIdCitas(ide);
                    c.setEstado(false);
                    cdao.actualizarCita(c);
                    request.setAttribute("mensajeError", "Se procedió a cancelar la cita Nro: "+ide);
                    request.getRequestDispatcher("ControladorUsuario?menu=ReporteCitas&accion=listarCitas").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("ListarCitas.jsp").forward(request, response);
        }
        
        if (menu.equals("Tec")) {
            switch (accion) {
                case "listarT":
                    ide = Integer.parseInt(request.getParameter("id"));
                    u = dao.listarId(ide);
                    String nom1 = u.getNombre();
                    String ape1 = u.getApellido();
                    String nomape = nom1 + " " + ape1;
                    List listaT = cdao.listarCN(nomape);
                    request.setAttribute("tecnico", listaT);
                    break;
                
                case "si":
                    ide = Integer.parseInt(request.getParameter("id"));
                    c.setIdCitas(ide);
                    c.setEstado(false);
                    c.setAtendido(true);
                    cdao.actualizarCita(c);
                    request.setAttribute("mensajeExito", "¡Éxito!. Se realizó la atención de la cita Nro: "+ide);
                    request.getRequestDispatcher("ControladorUsuario?menu=Tec&accion=listarT&id="+u.getIdUsuario()).forward(request, response);
                    break;
                
                case "no":
                    ide = Integer.parseInt(request.getParameter("id"));
                    c.setIdCitas(ide);
                    c.setEstado(false);
                    c.setAtendido(false);
                    cdao.actualizarCita(c);
                    request.setAttribute("mensajeError", "¡Upss!. No se realizó la atención de la cita Nro: "+ide);
                    request.getRequestDispatcher("ControladorUsuario?menu=Tec&accion=listarT").forward(request, response);
                    break;
          
            }
            request.getRequestDispatcher("TareasTecnico.jsp").forward(request, response);
        }
        
        if (menu.equals("CitasCl")) {
            switch (accion) {
                case "listarC":
                    ide = Integer.parseInt(request.getParameter("id"));
                    List listaC = cdao.listarCitasId(ide);
                    request.setAttribute("citas", listaC);
                    break;
                
                case "reprogramar":
                    ide = Integer.parseInt(request.getParameter("idCita"));
                    String fechaCitaStr = request.getParameter("fechaCita");
                    String horaCitaStr = request.getParameter("horaCita");
                    Date fecha = new SimpleDateFormat("yyyy-MM-dd").parse(fechaCitaStr);
                    c.setIdCitas(ide);
                    c.setFecha(fecha);
                    c.setHora(horaCitaStr);
                    Citas cita = new Citas();
                    cita = cdao.ListadoCitas(ide);
                    cdao.reprogramarCita(c);
                    request.setAttribute("mensajeExito", "¡Éxito!. Se procedió a reprogramar la cita Nro: "+ide);
                    request.getRequestDispatcher("ControladorUsuario?menu=CitasCl&accion=listarC&id="+c.getIdUsuario()).forward(request, response);
                    break;

                case "desactivar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    Citas citasC = new Citas();
                    citasC = cdao.ListadoCitas(ide);
                    c.setIdCitas(ide);
                    c.setEstado(false);
                    c.setAtendido(false);
                    cdao.actualizarCita(c);
                    request.setAttribute("mensajeExito", "Se realizó la cancelación de la cita Nro: "+ide);
                    request.getRequestDispatcher("ControladorUsuario?menu=CitasCl&accion=listarC&id="+citasC.getIdUsuario()).forward(request, response);
                    break;
            }
            request.getRequestDispatcher("CitasClientes.jsp").forward(request, response);
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
