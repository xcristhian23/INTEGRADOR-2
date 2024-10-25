/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelos;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LEONARDO
 */
public class ServiciosDAO {
    Servicios s = new Servicios();
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r; 
    
    public List listar() {
        ArrayList<Servicios>list = new ArrayList<>();
        String sql = "select * from servicios";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Servicios sv = new Servicios();
                sv.setIdServicio(rs.getInt("idServicio"));
                sv.setNombreServicio(rs.getString("nombreServicio"));
                list.add(sv);
                
            }
        } catch(Exception e){
        }
        return list;
    }
    
    public int add(Servicios s) {
        String sql = "insert into servicios (idServicio, nombreServicio) values(?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1,s.getIdServicio());
            ps.setString(2,s.getNombreServicio());
            ps.executeUpdate();
         } catch(Exception e){
        }
        return r;
    }
    
    public Servicios listarId(int id){
        Servicios serv = new Servicios();
        String sql = "select * from servicios where idServicio = "+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                serv.setIdServicio(rs.getInt(1));
                serv.setNombreServicio(rs.getString(2));
                
            }
         } catch(Exception e){
        }
        return serv;
    }
    
    public int actualizar(Servicios s) {
        String sql = "update servicios set nombreServicio=? where idServicio=?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1,s.getNombreServicio());
            ps.setInt(2,s.getIdServicio());
            ps.executeUpdate();
         } catch(Exception e){
        }
        return r;
    }
    
    public void eliminar(int id) {
        String sql = "delete from servicios where idServicio=" +id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
         } catch(Exception e){
        }

    }
}
