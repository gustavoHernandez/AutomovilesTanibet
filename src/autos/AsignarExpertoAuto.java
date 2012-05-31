package autos;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AsignarExpertoAuto extends ActionSupport {
	
	private String expertoid;
	private String autoid;
	
	public String execute(){
    	
		Map<String, Object> session = ActionContext.getContext().getSession();
		if ( session.get("tipoUsuario").toString().equals("ADMIN") ){
			
			
			try {
				
				Conexion c = new Conexion();
	    		
	    		if( c.conn != null  ){
	    			
	    			/* Obtener datos Generales del Automovil */
					String consulta = 	"INSERT INTO RelacionAutoExperto VALUES ( ?, ? )";
					c.preparedStatement = c.conn.prepareStatement( consulta );
					c.preparedStatement.setString( 1, getAutoid() );
					c.preparedStatement.setString( 2, getExpertoid() );
					c.preparedStatement.executeUpdate();
					
				}
	            
	    	} catch (Exception e) {
				System.out.println("ERROR: " + e.getMessage() );
				return INPUT;

			}
			
		    return SUCCESS;
			
		}else{
			
			return ERROR;
			
		}
		 
    }

	public String getExpertoid() {
		return expertoid;
	}

	public void setExpertoid(String expertoid) {
		this.expertoid = expertoid;
	}

	public String getAutoid() {
		return autoid;
	}

	public void setAutoid(String autoid) {
		this.autoid = autoid;
	}

}