/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelos;

import Config.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class CitasDAO {
    Citas c = new Citas();
    UsuarioDAO dao = new UsuarioDAO();
    Usuario u = new Usuario();
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    int cant;
    
     public int obtenerNuevoIdCita() {
        int nuevoIdCita = 0;
        String sql = "SELECT MAX(idCita) AS maxId FROM citas";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                nuevoIdCita = rs.getInt("maxId") + 1;
            }
                   
            rs.close();
            ps.close();
        } catch (Exception ex) {
            return 0;
        }
        return nuevoIdCita;
    }
     
    public int insertar(Citas c) {
        String sql = "insert into citas (idCita,fecha,hora,servicio,comentario, estado, idUsuario, idBicicleta) values(?,?,?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1,c.getIdCitas());
            ps.setDate(2,new java.sql.Date(c.getFecha().getTime()));
            ps.setString(3, c.getHora());
            ps.setString(4, c.getServicio());
            ps.setString(5,c.getComentario());
            ps.setBoolean(6, true);
            ps.setInt(7,c.getIdUsuario());
            ps.setInt(8,c.getIdBicicleta());
            r = ps.executeUpdate();
         } catch(Exception e){
        }
        return r;
    }
    
    public List listarCitas() {
        ArrayList<Citas>list = new ArrayList<>();
        String sql = "select * from citas";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Citas cs = new Citas();
                cs.setIdCitas(rs.getInt("idCita"));
                cs.setIdUsuario(rs.getInt("idUsuario"));
                cs.setIdBicicleta(rs.getInt("idBicicleta"));
                cs.setFecha(new java.sql.Date(rs.getDate("fecha").getTime()));
                cs.setServicio(rs.getString("servicio"));
                cs.setComentario(rs.getString("comentario"));
                cs.setHora(rs.getString("hora"));
                cs.setEstado(rs.getBoolean("estado"));
                cs.setTecnico(rs.getString("tecnico"));
                cs.setAtendido(rs.getBoolean("atendido"));
                u = dao.listarId(cs.getIdUsuario());
                String nombre = u.getNombre()+ " " + u.getApellido();
                cs.setNombreCliente(nombre);
                list.add(cs);
            }
        } catch(Exception e){
        }
        return list;
    }
    
    public Citas ListadoCitas(int id) {
        Citas cs = new Citas();
        String sql = "select * from citas where idCita="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                cs.setIdCitas(rs.getInt("idCita"));
                cs.setIdUsuario(rs.getInt("idUsuario"));
                cs.setIdBicicleta(rs.getInt("idBicicleta"));
                cs.setFecha(new java.sql.Date(rs.getDate("fecha").getTime()));
                cs.setServicio(rs.getString("servicio"));
                cs.setComentario(rs.getString("comentario"));
                cs.setHora(rs.getString("hora"));
                cs.setEstado(rs.getBoolean("estado"));
                cs.setTecnico(rs.getString("tecnico"));
                u = dao.listarId(cs.getIdUsuario());
                String nombre = u.getNombre()+ " " + u.getApellido();
                cs.setNombreCliente(nombre);
                
            }
        } catch(Exception e){
        }
        return cs;
    }
    
    
    public List listarCN(String tecnico) {
        
        ArrayList<Citas>list = new ArrayList<>();
        String sql = "select * from citas where tecnico = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, tecnico);
            rs = ps.executeQuery();
            while(rs.next()){
                Citas cs = new Citas();
                cs.setIdCitas(rs.getInt("idCita"));
                cs.setIdUsuario(rs.getInt("idUsuario"));
                cs.setIdBicicleta(rs.getInt("idBicicleta"));
                cs.setFecha(new java.sql.Date(rs.getDate("fecha").getTime()));
                cs.setServicio(rs.getString("servicio"));
                cs.setComentario(rs.getString("comentario"));
                cs.setHora(rs.getString("hora"));
                cs.setEstado(rs.getBoolean("estado"));
                cs.setTecnico(rs.getString("tecnico"));
                cs.setAtendido(rs.getBoolean("atendido"));
                
                u = dao.listarId(cs.getIdUsuario());
                String nombre = u.getNombre()+ " " + u.getApellido();
                cs.setNombreCliente(nombre);
                list.add(cs);
                
            }
        } catch(Exception e){
        }
        return list;
    }
    
    public List listarCitasId(int id) {
        ArrayList<Citas>list = new ArrayList<>();
        String sql = "select * from citas where idUsuario = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                Citas cs = new Citas();
                cs.setIdCitas(rs.getInt("idCita"));
                cs.setIdUsuario(rs.getInt("idUsuario"));
                cs.setIdBicicleta(rs.getInt("idBicicleta"));
                cs.setFecha(new java.sql.Date(rs.getDate("fecha").getTime()));
                cs.setServicio(rs.getString("servicio"));
                cs.setComentario(rs.getString("comentario"));
                cs.setHora(rs.getString("hora"));
                cs.setEstado(rs.getBoolean("estado"));
                cs.setTecnico(rs.getString("tecnico"));
                cs.setAtendido(rs.getBoolean("atendido"));
                
                u = dao.listarId(cs.getIdUsuario());
                String nombre = u.getNombre()+ " " + u.getApellido();
                cs.setNombreCliente(nombre);
                list.add(cs);
                                
            }
        } catch(Exception e){
        }
        return list;
    }
    
    public int actualizar(Citas c) {
        String sql = "update citas set tecnico=? where idCita=?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1,c.getTecnico());
            ps.setInt(2,c.getIdCitas());
            ps.executeUpdate();
         } catch(Exception e){
        }
        return r;
    }
    
    public Citas ValidarDuplicado(String horaCita, String nombreTecnico) {
        Citas citas = new Citas();
        String sql = "select * from citas where hora = ? AND tecnico=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, horaCita);
            ps.setString(2, nombreTecnico);
            rs = ps.executeQuery();
        
            while (rs.next()) {
                citas.setHora(rs.getNString("hora"));
                citas.setTecnico(rs.getNString("tecnico"));
                citas.setFecha(new java.sql.Date(rs.getDate("fecha").getTime()));
     
            }
                
        }catch(Exception ex){
        }
        return citas;

        }
    
    public int actualizarEstado(Citas c) {
        String sql = "update usuarios set estado=? where idUsuario=?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setBoolean(1,c.isEstado());
            ps.setInt(2,c.getIdUsuario());
            r = ps.executeUpdate();
         } catch(Exception e){
             
        }
        return r;
     }
    
    public int actualizarCita(Citas c) {
        String sql = "update citas set estado=?, atendido=? where idCita=?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setBoolean(1,c.isEstado());
            ps.setBoolean(2,c.isAtendido());
            ps.setInt(3,c.getIdCitas());
            r = ps.executeUpdate();
         } catch(Exception e){
             
        }
        return r;
     }
    
     public int reprogramarCita(Citas c) {
        String sql = "update citas set fecha=?, hora=? where idCita=?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDate(1,new java.sql.Date(c.getFecha().getTime()));
            ps.setString(2,c.getHora());
            ps.setInt(3,c.getIdCitas());
            ps.executeUpdate();
         } catch(Exception e){
        }
        return r;
    }
    
    
   
}
