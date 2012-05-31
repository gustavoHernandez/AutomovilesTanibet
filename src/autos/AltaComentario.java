package autos;

/*
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
*/
import java.sql.SQLException;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class AltaComentario extends ActionSupport {
    
	private String categoria;
	private String comentario;// The caption of the file entered by user.
	private String id;

	public String execute(){
		
		Conexion c = new Conexion();
		
		Map<String, Object> session = ActionContext.getContext().getSession();

		
		if( session.get("tipoUsuario") == null ){
			session.put("tipoUsuario", "VISITANTE" );
		}
		
		if( session.get("tipoUsuario").toString().equals("EXPERTO") ){
		
			try{
	    		
				if( c.conn != null  ){
					
					/* Insertar Comentario */
					String consulta = 	"UPDATE COCHE SET critica = ? WHERE id = ?";
					
					c.preparedStatement = c.conn.prepareStatement( consulta );
					c.preparedStatement.setString( 1, getComentario() );
					c.preparedStatement.setString( 2, getId() );
					c.preparedStatement.executeUpdate();
					
					/* Insertar categoria */
					consulta = 	"INSERT INTO Categorias VALUES( ?, ? )";
					c.preparedStatement = c.conn.prepareStatement( consulta );
					c.preparedStatement.setString( 1, getId() );
					c.preparedStatement.setString( 2, getCategoria() );
					c.preparedStatement.executeUpdate();
					
					/* Quitar relacion experto auto */
					consulta = 	"DELETE FROM RelacionAutoExperto WHERE idCoche = ? AND idExperto = ?";
					c.preparedStatement = c.conn.prepareStatement( consulta );
					c.preparedStatement.setString( 1, getId() );
					c.preparedStatement.setString( 2, session.get("idUsuario").toString() );
					c.preparedStatement.executeUpdate();
					
					
				}
	        
			}catch(SQLException sql ) {
	            System.out.println("Error de MySQL: " + sql );
	            return ERROR;
	        }
			
			
			
			return SUCCESS;
	    	
		}else{
			
			return ERROR;
			
		}
    	
	}


	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getCategoria() {
		return categoria;
	}


	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

}