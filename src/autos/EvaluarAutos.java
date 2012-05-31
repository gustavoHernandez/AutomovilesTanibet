package autos;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import autos.modelos.Automovil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class EvaluarAutos extends ActionSupport {
	
	private List<Automovil> autos = new ArrayList<Automovil>();
	private List<String> fotos = new ArrayList<String>();
	
	private String accion;
	
	public String execute(){
    	
		Map<String, Object> session = ActionContext.getContext().getSession();
		if ( session.get("tipoUsuario").toString().equals("EXPERTO") ){
			
			
			try {
				
				Conexion c = new Conexion();
	    		
	    		if( c.conn != null  ){
	    			
	    			/* Obtener datos Generales del Automovil */
					String consulta = 	"SELECT * FROM RelacionAutoExperto, Coche " + 
										"WHERE idcoche = id " +
										"AND idExperto = ?";
					c.preparedStatement = c.conn.prepareStatement( consulta );
					c.preparedStatement.setString( 1,  session.get("idUsuario").toString() );
					ResultSet rs = c.preparedStatement.executeQuery();
					
					while ( rs.next() ) {
						
						autos.add( new Automovil( rs.getString("id"), rs.getString("modelo"), "", 0, 0, 0, 0, rs.getString("idPersona"), "", 0 ) );
					
						/* Obtener foto principal del Automovil */
						consulta = 	"SELECT * FROM Imagen WHERE id_coche = ? LIMIT 1";
						c.preparedStatement = c.conn.prepareStatement( consulta );
						c.preparedStatement.setString(1, rs.getString("id") );
						ResultSet rs2 = c.preparedStatement.executeQuery();
						
						while ( rs2.next() ) {
							fotos.add( rs2.getString("imagen_nombre") );
						}
					
					}
					
	    		}
	            
	    	} catch (Exception e) {
				System.out.println("ERROR: " + e.getMessage() );
				return ERROR;

			}
			
		    return SUCCESS;
			
		}else{
			
			return INPUT;
			
		}
		 
    }

	public List<Automovil> getAutos() {
		return autos;
	}

	public void setAutos(List<Automovil> autos) {
		this.autos = autos;
	}

	public List<String> getFotos() {
		return fotos;
	}

	public void setFotos(List<String> fotos) {
		this.fotos = fotos;
	}

	public String getAccion() {
		return accion;
	}

	public void setAccion(String accion) {
		this.accion = accion;
	}
}