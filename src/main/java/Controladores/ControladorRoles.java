/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelos.Rol;
import Modelos.RolDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author LEONARDO
 */
@WebServlet(name = "ControladorRoles", urlPatterns = {"/ControladorRoles"})
public class ControladorRoles extends HttpServlet {
    
    RolDAO rdao = new RolDAO();
    Rol rol = new Rol();
    int ide1;
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        
        if (menu.equals("rol")) {
              switch (accion){
                  case "listar":
                      List lista = rdao.listar();
                      request.setAttribute("nombreRol", lista);
                      System.out.println(lista+"mensaje");
                      break;

                  case "Agregar":
                      int idr = Integer.parseInt(request.getParameter("rol"));
                      String cargo = request.getParameter("cargo");
                      rol.setIdRol(idr);
                      rol.setNombreRol(cargo);
                      rdao.add(rol);
                      request.getRequestDispatcher("ControladorRoles?menu=rol&accion=listar").forward(request, response);
                      break;

                  case "editar":
                      ide1 = Integer.parseInt(request.getParameter("id"));
                      Rol rs = rdao.listarId(ide1);
                      request.setAttribute("rol", rs);
                      request.getRequestDispatcher("ControladorRoles?menu=rol&accion=listar").forward(request, response);
                      break;

                  case "Actualizar":
                      int idr1 = Integer.parseInt(request.getParameter("rol"));
                      String cargo1 = request.getParameter("cargo");
                      rol.setIdRol(idr1);
                      rol.setNombreRol(cargo1);
                      rdao.actualizar(rol);
                      request.getRequestDispatcher("ControladorRoles?menu=rol&accion=listar").forward(request, response);
                      break;

                      case "eliminar":
                      ide1 = Integer.parseInt(request.getParameter("id"));
                      rdao.eliminar(ide1);
                      request.getRequestDispatcher("ControladorRoles?menu=rol&accion=listar").forward(request, response);
                      break;
                    
                      
              }
                    
                    request.getRequestDispatcher("Rol.jsp").forward(request, response);
       
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
