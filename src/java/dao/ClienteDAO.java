
package dao;

import java.util.List;
import java.sql.*;
import java.util.*;

import modelado.Cliente;

public class ClienteDAO extends Conexion implements DAO{
    
    @Override
    public void insertar(Object obj) throws Exception {
        Cliente c = (Cliente) obj;
        PreparedStatement pst = null;
        String sql="INSERT INTO clientes (ruc_dni, nom, email, tel_fij, tel_cel, direc) VALUES(?,?,?,?,?,?)";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, c.getRuc_dni());
            pst.setString(2, c.getNom());
            pst.setString(3, c.getEmail());
            pst.setString(4, c.getTel_fij());
            pst.setString(5, c.getTel_cel());
            pst.setString(6, c.getDirec());
            pst.executeUpdate();            
                      
        } catch ( SQLException e) {           
        }
        finally{
                pst.close();
                this.cerrar();
        }
    }

    @Override
    public void eliminar(Object obj) throws Exception {
        Cliente c = (Cliente) obj;
        PreparedStatement pst;
        String sql="UPDATE clientes set estado = 0 WHERE id = ?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setInt(1, c.getId());
            pst.executeUpdate();            
                      
        } catch (SQLException e) {
        }
        finally{
                this.cerrar();
        }
        
    }

    @Override
    public void modificar(Object obj) throws Exception{
        Cliente c = (Cliente) obj;
        PreparedStatement pst;
        String sql="UPDATE clientes SET ruc_dni=?, nom=?, email=?, tel_fij=?, tel_cel=?, direc=? WHERE id=?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, c.getRuc_dni());
            pst.setString(2, c.getNom());
            pst.setString(3, c.getEmail());
            pst.setString(4, c.getTel_fij());
            pst.setString(5, c.getTel_cel());
            pst.setString(6, c.getDirec());
            pst.setInt(7, c.getId());

             pst.executeUpdate();            
                       
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }

    }

    @Override
    public List<Cliente> consultar() throws Exception{
        List<Cliente> datos = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM clientes WHERE estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add(new Cliente(
                        rs.getInt("id"),
                        rs.getString("ruc_dni"),
                        rs.getString("nom"),
                        rs.getString("email"),
                        rs.getString("tel_fij"),
                        rs.getString("tel_cel"),
                        rs.getString("direc"))
                );
            }
        } catch (SQLException e ) {            
        }
        finally{
            this.cerrar();
        }
        return datos;
    }

    @Override
    public Cliente BuscarPorId(int id) throws Exception{        
           Cliente c = new Cliente();
           PreparedStatement pst;
           ResultSet res;
           String sql = "SELECT * FROM clientes WHERE id =?";
           try {
               this.conectar();
               pst = conexion.prepareStatement(sql);
               pst.setInt(1,id);                                
               res = pst.executeQuery();               
                if (res.next()) {
                    c.setRuc_dni(res.getString("ruc_dni"));
                    c.setNom(res.getString("nom"));            
                    c.setEmail(res.getString("email"));
                    c.setTel_fij(res.getString("tel_fij"));
                    c.setTel_cel(res.getString("tel_cel"));
                    c.setDirec(res.getString("direc"));
                    c.setId(res.getInt("id"));
                }                   
     
           } catch ( SQLException e ) {
           }
           finally{
               this.cerrar();
           }
           return c;
    }

    @Override
    public boolean ConsultarNombre(String nom) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean ConsultarRUCDNI(String nombre) throws SQLException{
        PreparedStatement pst;
        ResultSet res = null;
        String sql = "SELECT * FROM clientes WHERE ruc_dni='"+nombre+"'";

        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            res = pst.executeQuery();
        } catch (Exception e) {
        }
         return res.next();
    }     
    
    public boolean ConsultarEmail(String email) throws SQLException{
        PreparedStatement pst;
        ResultSet res = null;
        String sql = "SELECT * FROM clientes WHERE email='"+email+"'";

        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            res = pst.executeQuery();
        } catch (Exception e) {
        }
         return res.next();
    }      
    
}
