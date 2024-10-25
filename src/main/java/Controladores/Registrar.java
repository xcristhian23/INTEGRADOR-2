/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelos.Usuario;
import Modelos.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author LEONARDO
 */
public class Registrar extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();
    Usuario u = new Usuario();
    int cantidad = 0;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
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
        processRequest(request, response);
       
        
        
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
        processRequest(request, response);
        String accion = request.getParameter("accion");
        if (accion.equals("insertar")) {
                    
                    String correo2 = request.getParameter("correo");
                    String pass2 = request.getParameter("contrasena");
                    int celular2 = Integer.parseInt(request.getParameter("telefono"));
                    String tipo2 = request.getParameter("Tipo");
                    int documento2 = Integer.parseInt(request.getParameter("nroDocumento"));
                    String nombres2 = request.getParameter("nombres");
                    String apellidos2 = request.getParameter("apellidos");
                    String direccion2 = request.getParameter("direccion");
                    cantidad = dao.ValidarDuplicado(correo2, documento2);
                    if (cantidad <= 0) {
                        if (tipo2.equals("DNI")) {
                            u.setIdTipoDocumento(1);
                        } else {
                            if (tipo2.equals("CE")) {
                                u.setIdTipoDocumento(2);
                            } else {
                                u.setIdTipoDocumento(3);
                            }
                        }
                        u.setPassword(pass2);
                        u.setIdRol(3);
                        u.setNombre(nombres2);
                        u.setApellido(apellidos2);
                        u.setDocumento(documento2);
                        u.setCorreo(correo2);
                        u.setTelefono(celular2);
                        u.setDireccion(direccion2);
                        u.setEstado(true);
                        dao.insertar(u);
                        request.setAttribute("mensajeExito","Registro realizado satisfactoriamente");
                        request.getRequestDispatcher("Registro.jsp").forward(request, response);
                      
                    } else {
                        request.setAttribute("mensajeError","Correo y/o Nro. Documento ya se encuentra registrado");  
                        request.getRequestDispatcher("Registro.jsp").forward(request, response);
                    }
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
