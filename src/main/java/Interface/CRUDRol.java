/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Interface;

import Modelos.Rol;
import java.util.List;

/**
 *
 * @author LEONARDO
 */
public interface CRUDRol {
    public List listar();
    public int add(Rol roles);
    public int actualizar(Rol roles);
    public void eliminar(int id);
}
