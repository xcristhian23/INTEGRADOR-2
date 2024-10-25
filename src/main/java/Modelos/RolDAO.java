/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelos;

import Config.Conexion;
import Interface.CRUDRol;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LEONARDO
 */
   public class RolDAO implements CRUDRol{
    Rol roles = new Rol();
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
     
    @Override
    public List listar() {
        ArrayList<Rol>list = new ArrayList<>();
        String sql = "select * from roles";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Rol ro = new Rol();
                ro.setIdRol(rs.getInt("idRol"));
                ro.setNombreRol(rs.getString("nombreRol"));
                list.add(ro);
                
            }
        } catch(Exception e){
        }
        return list;
    }

    public Rol listarId(int id){
        Rol rl = new Rol();
        String sql = "select * from roles where idRol = "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                rl.setIdRol(rs.getInt(1));
                rl.setNombreRol(rs.getString(2));
                
            }
         } catch(Exception e){
        }
        return rl;
    }

    @Override
    public int add(Rol roles) {
        String sql = "insert into roles (idRol, nombreRol) values(?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1,roles.getIdRol());
            ps.setString(2,roles.getNombreRol());
            ps.executeUpdate();
         } catch(Exception e){
        }
        return r;
    }

    @Override
    public int actualizar(Rol roles) {
        String sql = "update roles set nombreRol=? where idRol=?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1,roles.getNombreRol());
            ps.setInt(2,roles.getIdRol());
            ps.executeUpdate();
         } catch(Exception e){
        }
        return r;
    }

    @Override
    public void eliminar(int id) {
        String sql = "delete from roles where idRol=" +id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
         } catch(Exception e){
        }

    }
   
   
}
