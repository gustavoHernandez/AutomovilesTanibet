package autos;

import java.sql.SQLException;
import java.util.Map;

import autos.modelos.Usuario;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
public class AltaUsuario extends ActionSupport implements ModelDriven<Usuario> {
    
	private Usuario usuario = new Usuario();
	
	private boolean vendedor;
    
    public Usuario getModel(){
        return usuario;
    }
	
	public String execute(){
    	
    	System.out.println("Valores: " + usuario.getUsuario() + ", " + usuario.getPassword() + ", " + this.isVendedor() );
    	if( this.isVendedor() ){
    		return INPUT;
    	}else{
    		
    		Conexion c = new Conexion();
    		
    		try{
        		
    			if( c.conn != null  ){
    				
    				String idUsuario = "PER" + System.currentTimeMillis();
    				/* Datos Generales de Persona */
    				String consulta = 	"INSERT INTO Persona VALUES( ?, ?, MD5( ? ), ?, ?, ?, ?, ?, ?, ?);";
    				
    				c.preparedStatement = c.conn.prepareStatement( consulta );
    				c.preparedStatement.setString( 1, idUsuario );
    				c.preparedStatement.setString( 2, usuario.getUsuario() );
    				c.preparedStatement.setString( 3, usuario.getPassword() );
    				c.preparedStatement.setString( 4, "USUARIO" );
    				c.preparedStatement.setString( 5, usuario.getUsuario() );
    				c.preparedStatement.setString( 6, "" );
    				c.preparedStatement.setString( 7, "" );
    				c.preparedStatement.setString( 8, "" );
    				c.preparedStatement.setString( 9, "usuario.png" );
    				c.preparedStatement.setString( 10, "" );
    				
    				System.out.println( c.preparedStatement );
    				c.preparedStatement.executeUpdate();
    				
    				Map<String, Object> session = ActionContext.getContext().getSession();
					session.put("tipoUsuario", "USUARIO" );
					session.put("usuario", usuario.getUsuario() );
					session.put("idUsuario", idUsuario );
    				
                }
            
    		}catch(SQLException sql ) {
                System.out.println("Error de MySQL: " + sql );
                return ERROR;
            }
    		
    		
    		
    		return SUCCESS;
    	}
    	
    	
    }

	/**
	 * @return the vendedor
	 */
	public boolean isVendedor() {
		return vendedor;
	}


	/**
	 * @param vendedor the vendedor to set
	 */
	public void setVendedor(boolean vendedor) {
		this.vendedor = vendedor;
	}

}