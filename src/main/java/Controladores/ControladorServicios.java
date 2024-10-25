/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelos.Servicios;
import Modelos.ServiciosDAO;
import jakarta.servlet.ServletException;
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
public class ControladorServicios extends HttpServlet {

    ServiciosDAO sdao = new ServiciosDAO();
    Servicios s = new Servicios();
    int id;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        
        if (menu.equals("servicios")) {
              switch (accion){
                  case "listar":
                      List lista = sdao.listar();
                      request.setAttribute("nombre", lista);
                      break;
                  
                  case "Agregar":
                      int idr = Integer.parseInt(request.getParameter("idServicio"));
                      String nombre = request.getParameter("nombre");
                      s.setIdServicio(idr);
                      s.setNombreServicio(nombre);
                      sdao.add(s);
                      request.getRequestDispatcher("ControladorServicios?menu=servicios&accion=listar").forward(request, response);
                      break;
                  
                  case "editar":
                      id = Integer.parseInt(request.getParameter("id"));
                      Servicios sv = sdao.listarId(id);
                      request.setAttribute("servicios", sv);
                      request.getRequestDispatcher("ControladorServicios?menu=servicios&accion=listar").forward(request, response);
                      break;

                  case "Actualizar":
                      int ide = Integer.parseInt(request.getParameter("idServicio"));
                      String nombreS = request.getParameter("nombre");
                      s.setIdServicio(ide);
                      s.setNombreServicio(nombreS);
                      sdao.actualizar(s);
                      request.getRequestDispatcher("ControladorServicios?menu=servicios&accion=listar").forward(request, response);
                      break;

                  case "eliminar":
                      id = Integer.parseInt(request.getParameter("id"));
                      sdao.eliminar(id);
                      request.getRequestDispatcher("ControladorServicios?menu=servicios&accion=listar").forward(request, response);
                      break;
     
              }
                    
                    request.getRequestDispatcher("Servicios.jsp").forward(request, response);
       
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
