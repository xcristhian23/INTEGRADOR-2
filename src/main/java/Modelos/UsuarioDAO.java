/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelos;

import Config.Conexion;
import Interface.CRUDUsuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.security.SecureRandom;

/**
 *
 * @author leonardo.aldazabal
 */
public class UsuarioDAO implements CRUDUsuario{
    Usuario user = new Usuario();
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    int cant = 0;
     
    public Usuario Validar(String correo, String pass) {
        Usuario usuario =new Usuario();
        String sql = "SELECT * FROM usuarios WHERE correo = ? and password = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuario.setCorreo(rs.getNString("Correo"));
                usuario.setPassword(rs.getNString("Password"));
                usuario.setNombre(rs.getString("Nombre"));
                usuario.setApellido(rs.getString("Apellidos"));
                usuario.setIdRol(rs.getInt("idRol"));
                usuario.setIdTipoDocumento(rs.getInt("idTipoDocumento"));
                usuario.setDocumento(rs.getInt("documento"));
                usuario.setIdUsuario(rs.getInt("idUsuario"));
                usuario.setEstado(rs.getBoolean("estado"));
                
                
            }
           
        }catch(Exception ex){
        }
        return usuario;
        }
    
    
    public int ValidarDuplicado(String correo, int documento) {
        
        String sql = "select count(*) from usuarios where correo = ? OR documento = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setInt(2, documento);
            rs = ps.executeQuery();
            if (rs.next()) {
                cant = rs.getInt(1);
            }
                
        }catch(Exception ex){
        }
        return cant;

        }

    public Usuario Reset(String correo) {
        Usuario usuario =new Usuario();
        String sql = "SELECT * FROM usuarios WHERE password = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuario.setCorreo(rs.getNString("Correo"));
                usuario.setPassword(rs.getNString("Password"));
                usuario.setNombre(rs.getString("Nombre"));
                usuario.setApellido(rs.getString("Apellidos"));
                usuario.setIdRol(rs.getInt("idRol"));
                usuario.setIdTipoDocumento(rs.getInt("idTipoDocumento"));
                usuario.setDocumento(rs.getInt("documento"));
                usuario.setIdUsuario(rs.getInt("idUsuario"));
                usuario.setEstado(rs.getBoolean("estado"));
                
                
            }
           
        }catch(Exception ex){
        }
        return usuario;
        }
   
       
    @Override
    public List listar() {
        ArrayList<Usuario>list = new ArrayList<>();
        String sql = "select * from usuarios where IdRol = 2";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setIdRol(rs.getInt("idRol"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellidos"));
                u.setDocumento(rs.getInt("documento"));
                u.setCorreo(rs.getString("correo"));
                u.setTelefono(rs.getInt("telefono"));
                u.setDireccion(rs.getString("direccion"));
                u.setIdTipoDocumento(rs.getInt("idTipoDocumento"));
                u.setEstado(rs.getBoolean("estado"));
                list.add(u);
                
            }
        } catch(Exception e){
        }
        return list;
    }
    
    public List listarClientes() {
        ArrayList<Usuario>list = new ArrayList<>();
        String sql = "select * from usuarios where IdRol = 3";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setIdRol(rs.getInt("idRol"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellidos"));
                u.setDocumento(rs.getInt("documento"));
                u.setCorreo(rs.getString("correo"));
                u.setTelefono(rs.getInt("telefono"));
                u.setDireccion(rs.getString("direccion"));
                u.setIdTipoDocumento(rs.getInt("idTipoDocumento"));
                u.setEstado(rs.getBoolean("estado"));
                list.add(u);
                
            }
        } catch(Exception e){
        }
        return list;
    }

    public Usuario listarId(int id){
        Usuario usu = new Usuario();
        String sql = "select * from usuarios where IdUsuario = "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                usu.setIdUsuario(rs.getInt(1));
                usu.setIdRol(rs.getInt(2));
                usu.setIdTipoDocumento(rs.getInt(3));
                usu.setDocumento(rs.getInt(4));
                usu.setTelefono(rs.getInt(5));
                usu.setNombre(rs.getString(6));
                usu.setApellido(rs.getString(7));
                usu.setCorreo(rs.getString(8));
                usu.setDireccion(rs.getString(10));
                usu.setEstado(rs.getBoolean(11));
            }
         } catch(Exception e){
        }
        return usu;
    }

    public int insertar(Usuario user) {
        String sql = "insert into usuarios (nombre, apellidos, idTipoDocumento, documento, correo, password, telefono, idRol, direccion, estado) values(?,?,?,?,?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1,user.getNombre());
            ps.setString(2,user.getApellido());
            ps.setInt(3,user.getIdTipoDocumento());
            ps.setInt(4,user.getDocumento());
            ps.setString(5,user.getCorreo());
            ps.setString(6,user.getPassword());
            ps.setInt(7,user.getTelefono());
            ps.setInt(8,user.getIdRol());
            ps.setString(9,user.getDireccion());
            ps.setBoolean(10,true);
            ps.executeUpdate();
         } catch(Exception e){
        }
        return r;
    }
    
    @Override
    public int add(Usuario user) {
        String sql = "insert into usuarios (nombre, apellidos, idTipoDocumento, documento, correo, telefono, idRol, direccion, password, estado) values(?,?,?,?,?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1,user.getNombre());
            ps.setString(2,user.getApellido());
            ps.setInt(3,user.getIdTipoDocumento());
            ps.setInt(4,user.getDocumento());
            ps.setString(5,user.getCorreo());
            ps.setInt(6,user.getTelefono());
            ps.setInt(7,user.getIdRol());
            ps.setString(8,user.getDireccion());
            ps.setString(9,user.getPassword());
            ps.setBoolean(10, true);
            ps.executeUpdate();
         } catch(Exception e){
        }
        return r;
    }

    @Override
    public int actualizar(Usuario user) {
        String sql = "update usuarios set nombre=?, apellidos=?,idTipoDocumento=?,documento=?, correo=?, telefono=?, idRol=?, direccion=? where idUsuario=?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1,user.getNombre());
            ps.setString(2,user.getApellido());
            ps.setInt(3,user.getIdTipoDocumento());
            ps.setInt(4,user.getDocumento());
            ps.setString(5,user.getCorreo());
            ps.setInt(6,user.getTelefono());
            ps.setInt(7,user.getIdRol());
            ps.setString(8,user.getDireccion());
            ps.setInt(9,user.getIdUsuario());
            ps.executeUpdate();
         } catch(Exception e){
        }
        return r;
    }

    @Override
     public void eliminar(int id) {
        String sql = "delete from usuarios where idUsuario=" +id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
         } catch(Exception e){
        }

    }
     
    
    public int actualizarContrasena(Usuario user) {
        String sql = "update usuarios set password=? where idUsuario=?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1,user.getPassword());
            ps.setInt(2,user.getIdUsuario());
            r = ps.executeUpdate();
         } catch(Exception e){
             
        }
        return r;
     }
    
    public int actualizarPerfil(Usuario user) {
        String sql = "update usuarios set idTipoDocumento=?, documento=?, telefono=?, nombre=?, apellidos=?, direccion=? where idUsuario=?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1,user.getIdTipoDocumento());
            ps.setInt(2,user.getDocumento());
            ps.setInt(3,user.getTelefono());
            ps.setString(4,user.getNombre());
            ps.setString(5,user.getApellido());
            ps.setString(6,user.getDireccion());
            ps.setInt(7,user.getIdUsuario());
            r = ps.executeUpdate();
         } catch(Exception e){
             
        }
        return r;
     }
    
    public int actualizarEstado(Usuario user) {
        String sql = "update usuarios set estado=? where idUsuario=?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setBoolean(1,user.isEstado());
            ps.setInt(2,user.getIdUsuario());
            r = ps.executeUpdate();
         } catch(Exception e){
             
        }
        return r;
     }
    
}
    
    
  


    
