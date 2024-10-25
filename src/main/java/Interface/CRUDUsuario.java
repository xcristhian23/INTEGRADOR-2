/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import Modelos.Usuario;
import java.util.List;

/**
 *
 * @author LEONARDO
 */
public interface CRUDUsuario {
    public List listar();
    public int add(Usuario user);
    public int actualizar(Usuario user);
    public void eliminar(int id);
}
