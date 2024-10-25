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
import java.net.http.WebSocket;
import java.util.HashSet;
import java.util.List;

@WebServlet(name = "Validar", urlPatterns = {"/Validar"})
public class Validar extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();
    Usuario u = new Usuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        if (accion.equals("Ingresar")) {
            String email = request.getParameter("correo");
            String pass = request.getParameter("password");
            u = dao.Validar(email, pass);
            if (u.getCorreo() != null && u.getIdRol() == 1 && u.isEstado() == true) {
                request.setAttribute("correo", u);
                request.getRequestDispatcher("Administrador.jsp").forward(request, response);
            } else if (u.getCorreo() != null && u.getIdRol() == 2 && u.isEstado() == true) {
                request.setAttribute("correo", u);
                request.getRequestDispatcher("Tecnico.jsp").forward(request, response);
            } else if (u.getCorreo() != null && u.getIdRol() == 3 && u.isEstado() == true) {
                request.setAttribute("correo", u);
                request.getRequestDispatcher("Clientes.jsp").forward(request, response);
            } else if(u.getCorreo() != null && u.getIdRol() == 1 && u.isEstado() == false){
                // Las credenciales son incorrectas, establece un mensaje de error
                request.setAttribute("mensajeError", "Usuario inactivo. Por favor, comuniquese con el administrador.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else if(u.getCorreo() != null && u.getIdRol() == 2 && u.isEstado() == false){
                // Las credenciales son incorrectas, establece un mensaje de error
                request.setAttribute("mensajeError", "Usuario inactivo. Por favor, comuniquese con el administrador.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else if(u.getCorreo() != null && u.getIdRol() == 3 && u.isEstado() == false){
                // Las credenciales son incorrectas, establece un mensaje de error
                request.setAttribute("mensajeError", "Usuario inactivo. Por favor, comuniquese con el administrador.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.setAttribute("mensajeError", "Correo y/o contraseña incorrectos. Por favor, inténtelo nuevamente.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                  } 
            } else{
                request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
    

        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
