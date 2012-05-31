package autos;

import autos.modelos.Usuario;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
public class Login extends ActionSupport implements ModelDriven<Usuario> {
    
	private Usuario usuario = new Usuario();
	
    private Connection conn = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    
    public Usuario getModel(){
        return usuario;
    }
    
    public String execute(){
    	
    	boolean esUsuarioValido = false;
    	Map<String, Object> session = ActionContext.getContext().getSession();
    	
    	String url = "jdbc:mysql://localhost/autos_tanibet2";
    	String driverName = "com.mysql.jdbc.Driver";
    	String userName = "root";
    	String password = "";
    	
    	try {
            
    		Class.forName(driverName);
            conn = (Connection) DriverManager.getConnection(url, userName, password);
            if (conn != null) {
            	
            	String user = "", pass = "", tipo = "", idUsuario = "", cypher_pass = "";
                
            	preparedStatement = conn.prepareStatement("SELECT * FROM Persona WHERE nombre = ? AND contrase–a = MD5( ? );");
            	preparedStatement.setString( 1, usuario.getUsuario() );
    			preparedStatement.setString( 2, usuario.getPassword() );
            	resultSet = preparedStatement.executeQuery();
            	
            	while (resultSet.next()) {
    				user = resultSet.getString("nombre");
    				pass = resultSet.getString("contrase–a");
    				tipo = resultSet.getString("tipo");
    				idUsuario = resultSet.getString("id"); 
    				System.out.println("User de Bd: " + user + "\nPassword de BD: " + pass + "\nTipo: " + tipo + "\nId: " + idUsuario );
    			}
            	
            	preparedStatement = conn.prepareStatement("SELECT MD5( ? ) AS pass");
            	preparedStatement.setString( 1, usuario.getPassword() );
            	resultSet = preparedStatement.executeQuery();
            	
            	while (resultSet.next()) {
            		cypher_pass = resultSet.getString("pass");
    				//System.out.println("Contrase–a cifrada: " + cypher_pass );
    			}
            	
            	if( user.equalsIgnoreCase( usuario.getUsuario() ) && pass.equalsIgnoreCase( cypher_pass ) ){
					esUsuarioValido = true;
					
					session.put("tipoUsuario", tipo );
					session.put("usuario", user );
					session.put("idUsuario", idUsuario );
					
					//System.out.println( "Variable de Sesion: " + session.get("tipoUsuario") );
				}
    			
    		}
    		
        }
        catch(SQLException ex) {
            System.out.println("Hubo un problema al intentar conectarse con la base de datos: "+ ex.getMessage() );
        }
        catch(ClassNotFoundException ex) {
            System.out.println(ex);
            usuario.setUsuario( ex.toString() );
        }
    	
    	if( esUsuarioValido ){
        	
    		return ( session.get("tipoUsuario").toString().equals("EXPERTO") ) ? INPUT : SUCCESS;
    	
        }else{
    		System.out.println("Usuario: [" + usuario.getUsuario() + "] y password: [" + usuario.getPassword() + "] no encontrados.");
    		return ERROR;
    	}

    }
   
}