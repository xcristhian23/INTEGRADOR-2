/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelos;

/**
 *
 * @author LEONARDO
 */
public class Bicicleta {
    int idBicicleta;
    int idMarca;
    int idModelo;
    int idUsuario;
    int aro;
    boolean estado;
    String color;
    String marca;
    String modelo;

    public Bicicleta() {
    }
    
    public Bicicleta(int idBicicleta, int idMarca, int idModelo, int idUsuario, int aro, boolean estado, String color, String marca, String modelo) {
        this.idBicicleta = idBicicleta;
        this.idMarca = idMarca;
        this.idModelo = idModelo;
        this.idUsuario = idUsuario;
        this.aro = aro;
        this.estado = estado;
        this.color = color;
        this.marca = marca;
        this.modelo = modelo;
    }

    public int getIdBicicleta() {
        return idBicicleta;
    }

    public void setIdBicicleta(int idBicicleta) {
        this.idBicicleta = idBicicleta;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public int getIdModelo() {
        return idModelo;
    }

    public void setIdModelo(int idModelo) {
        this.idModelo = idModelo;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getAro() {
        return aro;
    }

    public void setAro(int aro) {
        this.aro = aro;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    
    
}
