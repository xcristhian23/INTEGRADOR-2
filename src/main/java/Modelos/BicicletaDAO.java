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
import java.util.HashSet;
import java.util.List;

/**
 *
 * @author LEONARDO
 */
public class BicicletaDAO {
    Bicicleta b = new Bicicleta();
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List listar(int id){
        String sql = "SELECT idUsuario, idBicicleta, marca.Marca, modelos.nombreModelo, aro, color, estado FROM bicicleta JOIN marca ON bicicleta.idMarca = marca.idMarca JOIN modelos ON bicicleta.idModelo = modelos.idModelo WHERE bicicleta.idUsuario = " +id;
        List<Bicicleta>lista = new ArrayList();
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Bicicleta bici = new Bicicleta();
                bici.setIdUsuario(rs.getInt("idUsuario"));
                bici.setIdBicicleta(rs.getInt("idBicicleta"));
                bici.setMarca(rs.getString("marca"));
                bici.setModelo(rs.getString("nombreModelo"));
                bici.setAro(rs.getInt("aro"));
                bici.setColor(rs.getString("color"));
                bici.setEstado(rs.getBoolean("estado"));
                lista.add(bici);
              
            }
        } catch(Exception e){
            
        }
        return lista;
       
    }
    
    public Bicicleta listarId(int id){
        Bicicleta bx = new Bicicleta();
        String sql = "SELECT idUsuario, idBicicleta, marca.Marca, modelos.nombreModelo, aro, color, estado FROM bicicleta JOIN marca ON bicicleta.idMarca = marca.idMarca JOIN modelos ON bicicleta.idModelo = modelos.idModelo WHERE bicicleta.idBicicleta = " +id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                bx.setMarca(rs.getString("marca"));
                bx.setModelo(rs.getString("nombreModelo"));
                bx.setAro(rs.getInt("aro"));
                bx.setColor(rs.getString("color"));
                bx.setIdBicicleta(rs.getInt("idbicicleta"));
                bx.setIdUsuario(rs.getInt("idusuario"));
                
            }
         } catch(Exception e){
        }
        return bx;
    }
    
    public int agregar(Bicicleta b){
        String sql = "insert into bicicleta (idMarca, idTipoModelo, Aro, Color) values (?,?,?,?))";
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setInt(1, b.getIdMarca());
            ps.setInt(2, b.getIdModelo());
            ps.setFloat(3, b.getAro());
            ps.setString(4, b.getColor());
            ps.executeUpdate();
        } catch(Exception e){
            
        }
        return r;
    }
        
    public int actualizar(Bicicleta b){
        String sql = "UPDATE bicicleta INNER JOIN marca ON bicicleta.idMarca = marca.idMarca INNER JOIN modelos ON bicicleta.idModelo = modelos.idModelo SET marca = marca.Marca, nombreModelo = modelos.nombreModelo, aro = ?, color = ? WHERE idbicicleta = ?";
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setInt(1, b.getAro());
            ps.setString(2, b.getColor());
            ps.setInt(3, b.getIdBicicleta());
            ps.executeUpdate();
        } catch(Exception e){
            
        }
        return r;
    }
    
    public void eliminar(int id) {
        String sql = "delete from bicicleta where idBicicleta=" +id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
         } catch(Exception e){
        }
    }
    
    public int actualizarEstado(Bicicleta b) {
        String sql = "update bicicleta set estado=? where idbicicleta=?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setBoolean(1,b.isEstado());
            ps.setInt(2,b.getIdBicicleta());
            r = ps.executeUpdate();
         } catch(Exception e){
             
        }
        return r;
     }
    
    public List listarMarcas() {
        ArrayList<Bicicleta>list = new ArrayList<>();
        String sql = "select * from marca";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Bicicleta bs = new Bicicleta();
                bs.setIdMarca(rs.getInt("idMarca"));
                bs.setMarca(rs.getString("Marca"));
                list.add(bs);
                
            }
        } catch(Exception e){
        }
        return list;
    }
    
}
