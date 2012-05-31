package autos;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import autos.modelos.Automovil;

@SuppressWarnings("serial")
public class Principal extends ActionSupport {
    
	private List<Automovil> autos = new ArrayList<Automovil>();
	private List<Automovil> autop = new ArrayList<Automovil>();
	private List<String> fotos = new ArrayList<String>();
	private List<String> fotostop = new ArrayList<String>();
	
	public String execute(){
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		if( session.get("tipoUsuario") == null ){
			session.put("tipoUsuario", "VISITANTE" );
		}
		
		
		if( ! session.get("tipoUsuario").toString().equals("EXPERTO") ){
    	
	    	try {
				
				Conexion c = new Conexion();
	    		
	    		if( c.conn != null  ){
	    			
	    			/* Obtener datos Generales del Automovil */
					String consulta = 	"SELECT * FROM Coche WHERE duracion != 0";
					c.preparedStatement = c.conn.prepareStatement( consulta );
					ResultSet rs = c.preparedStatement.executeQuery();
					
					while ( rs.next() ) {
						
						autos.add( new Automovil( rs.getString("id"), rs.getString("modelo"), rs.getString("marca"), rs.getInt("a–o"), rs.getDouble("precio"), rs.getInt("km"), rs.getInt("cilindros"), rs.getString("idPersona"), rs.getString("critica"), rs.getInt("duracion") ) );
					
						/* Obtener foto principal del Automovil */
						consulta = 	"SELECT * FROM Imagen WHERE id_coche = ? LIMIT 1";
						c.preparedStatement = c.conn.prepareStatement( consulta );
						c.preparedStatement.setString(1, rs.getString("id") );
						ResultSet rs2 = c.preparedStatement.executeQuery();
						
						while ( rs2.next() ) {
							fotos.add( rs2.getString("imagen_nombre") );
						}
					
					}
					
					/* Obtener Automoviles con mas busquedas */
					consulta = 	"SELECT idcoche, modelo, a–o, precio, idpersona, duracion, SUM(consultas) as hits FROM Consultas, Coche " +
								"WHERE id = idcoche AND duracion != 0 GROUP BY idcoche ORDER BY hits DESC LIMIT 5";
					c.preparedStatement = c.conn.prepareStatement( consulta );
					rs = c.preparedStatement.executeQuery();
					
					while ( rs.next() ) {
						autop.add( new Automovil( rs.getString("idcoche"), rs.getString("modelo"), rs.getInt("a–o"), rs.getDouble("precio"), rs.getString("idPersona") ) );
					
						/* Obtener foto principal del Automovil */
						consulta = 	"SELECT * FROM Imagen WHERE id_coche = ? LIMIT 1";
						c.preparedStatement = c.conn.prepareStatement( consulta );
						c.preparedStatement.setString(1, rs.getString("idcoche") );
						ResultSet rs2 = c.preparedStatement.executeQuery();
						
						while ( rs2.next() ) {
							fotostop.add( rs2.getString("imagen_nombre") );
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

	public List<Automovil> getAutop() {
		return autop;
	}

	public void setAutop(List<Automovil> autop) {
		this.autop = autop;
	}

	public List<String> getFotostop() {
		return fotostop;
	}

	public void setFotostop(List<String> fotostop) {
		this.fotostop = fotostop;
	}
}