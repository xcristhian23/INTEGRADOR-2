/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelos;

import java.sql.Time;
import java.time.LocalTime;
import java.util.Date;


public class Citas {
    
    int idCitas;
    int idUsuario;
    int idBicicleta;
    Date fecha;
    String hora;
    String comentario;
    String servicio;
    String tecnico;
    String nombreCliente;
    boolean estado;
    boolean atendido;
    
    
    public Citas(){
    }

    public Citas(int idCitas, int idUsuario, int idBicicleta, Date fecha, String hora, String comentario, String servicio, String tecnico, String nombreCliente, boolean estado, boolean atendido) {
        this.idCitas = idCitas;
        this.idUsuario = idUsuario;
        this.idBicicleta = idBicicleta;
        this.fecha = fecha;
        this.hora = hora;
        this.comentario = comentario;
        this.servicio = servicio;
        this.tecnico = tecnico;
        this.nombreCliente = nombreCliente;
        this.estado = estado;
        this.estado = atendido;
    }

    public boolean isAtendido() {
        return atendido;
    }

    public void setAtendido(boolean atendido) {
        this.atendido = atendido;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    

    public int getIdCitas() {
        return idCitas;
    }

    public void setIdCitas(int idCitas) {
        this.idCitas = idCitas;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdBicicleta() {
        return idBicicleta;
    }

    public void setIdBicicleta(int idBicicleta) {
        this.idBicicleta = idBicicleta;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getServicio() {
        return servicio;
    }

    public void setServicio(String servicio) {
        this.servicio = servicio;
    }

    public String getTecnico() {
        return tecnico;
    }

    public void setTecnico(String tecnico) {
        this.tecnico = tecnico;
    }

   

}


