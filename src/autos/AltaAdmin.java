package autos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import autos.modelos.Usuario;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class AltaAdmin extends ActionSupport {
    
	private String idUsuario;
	private String privilegio;
	private List<Usuario> usuario = new ArrayList<Usuario>();
	
	public String execute(){
		
		Conexion c = new Conexion();
		
		Map<String, Object> session = ActionContext.getContext().getSession();

		if( session.get("tipoUsuario") == null ){
			session.put("tipoUsuario", "VISITANTE" );
		}
		
		if( session.get("tipoUsuario").toString().equals("ADMIN") ){
		
			try{
	    		
				if( c.conn != null  ){
					
					
					/* Obtener datos Generales del Usuario */
					String consulta = "SELECT * FROM Persona";
					c.preparedStatement = c.conn.prepareStatement( consulta );
					ResultSet rs = c.preparedStatement.executeQuery();
					while ( rs.next() ) {
						usuario.add( new Usuario( rs.getString("id"), rs.getString("nombre"), "", "", "", "", "" ) );
					}
					
					if( getIdUsuario() != null ){
					
					
						/* Actualizar tipo de usuario */
						consulta = 	"UPDATE Persona SET tipo = ? WHERE id = ?";
					
						c.preparedStatement = c.conn.prepareStatement( consulta );
						c.preparedStatement.setString( 1, getPrivilegio() );
						c.preparedStatement.setString( 2, getIdUsuario() );
						c.preparedStatement.executeUpdate();
					
					}
					
					
				}
	        
			}catch(SQLException sql ) {
	            System.out.println("Error de MySQL: " + sql );
	            return ERROR;
	        }
			
			return SUCCESS;
	    	
		}else{
			
			return INPUT;
			
		}
    	
	}

	public List<Usuario> getUsuario() {
		return usuario;
	}

	public void setUsuario(List<Usuario> usuario) {
		this.usuario = usuario;
	}

	public String getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getPrivilegio() {
		return privilegio;
	}

	public void setPrivilegio(String privilegio) {
		this.privilegio = privilegio;
	}
}