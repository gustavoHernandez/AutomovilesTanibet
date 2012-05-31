package autos;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import autos.modelos.Automovil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DescripcionAutomovil extends ActionSupport{
    
	private String id = "";
	private List<Automovil> auto = new ArrayList<Automovil>();
	private List<String> fotos = new ArrayList<String>();
	
	public String execute(){
    	
    	Map<String, Object> session = ActionContext.getContext().getSession();
    	String usuarioSesion = "";
    	try{
    		usuarioSesion = session.get("idUsuario").toString();
    	}catch( NullPointerException npe ){
    		usuarioSesion = "VISITANTE";
    		System.out.println("Es visitante");
    	}
    	
    	try {
			
			Conexion c = new Conexion();
    		
    		if( c.conn != null  ){
    			
    			String idVendedor = "";
    			boolean anuncioHabilitado = false;
    			
    			/* Obtener datos Generales del Automovil */
				String consulta = 	"SELECT * FROM Coche WHERE id = ? AND duracion != 0";
				
				c.preparedStatement = c.conn.prepareStatement( consulta );
				c.preparedStatement.setString( 1, getId() );
				ResultSet rs = c.preparedStatement.executeQuery();
				
				while ( rs.next() ) {
					auto.add( new Automovil( rs.getString("id"), rs.getString("modelo"), rs.getString("marca"), rs.getInt("a–o"), rs.getDouble("precio"), rs.getInt("km"), rs.getInt("cilindros"), rs.getString("idPersona"), rs.getString("critica"), rs.getInt("duracion") ) );
					idVendedor = rs.getString("idPersona");
					anuncioHabilitado = true;
				}
				
				/* Obtener fotografias disponibles del Automovil */
				consulta = 	"SELECT * FROM Imagen WHERE id_coche = ?";
				c.preparedStatement = c.conn.prepareStatement( consulta );
				c.preparedStatement.setString( 1, getId() );
				rs = c.preparedStatement.executeQuery();
				while ( rs.next() ) {
					fotos.add( rs.getString("imagen_nombre") );
				}
				
				/* Si la persona que consulta el auto no es el vendedor del mismo, se agrega una consulta */
				if( ! idVendedor.equals( usuarioSesion ) && !usuarioSesion.equals("VISITANTE") && anuncioHabilitado ){
					
					/* Obtenemos fecha actual */
					java.util.Date utilDate = new java.util.Date(); // Fecha actual
					long lnMilisegundos = utilDate.getTime();
					java.sql.Date sqlDate = new java.sql.Date(lnMilisegundos);
					//System.out.println( "FECHA: " + sqlDate );
				
					/* A–adir hit de consulta por el usuario */
					consulta = 	"SELECT * FROM Consultas WHERE idcoche = ? AND idcliente = ?";
					c.preparedStatement = c.conn.prepareStatement( consulta );
					c.preparedStatement.setString( 1, getId() );
					c.preparedStatement.setString( 2, usuarioSesion );
					rs = c.preparedStatement.executeQuery();
					
					boolean consultado = false;
					
					while ( rs.next() ) {
						
						/* Comparamos fechas. Se registra 1 consulta del cliente por dia. */
						//System.out.println( sqlDate.toString() + " | " + rs.getDate("ultima").toString() );
						if( ! sqlDate.toString().equals( rs.getDate("ultima").toString() ) ){
							consulta = 	"UPDATE Consultas SET consultas = ? WHERE idcliente = ?";
							c.preparedStatement = c.conn.prepareStatement( consulta );
							c.preparedStatement.setInt( 1, rs.getInt("consultas") + 1 );
							c.preparedStatement.setString( 2, usuarioSesion );
							c.preparedStatement.executeUpdate();
						}
						
						consultado = true;
					}
					
					if( !consultado ){
						
						consulta = 	"INSERT INTO Consultas VALUES( ?, ?, ?, ? )";
						c.preparedStatement = c.conn.prepareStatement( consulta );
						c.preparedStatement.setString( 1, getId() );
						c.preparedStatement.setString( 2, usuarioSesion );
						c.preparedStatement.setInt( 3, 1 );
						c.preparedStatement.setDate( 4, (Date) sqlDate );
						c.preparedStatement.executeUpdate();
					}
					
				}
				
			}
            
    	} catch (Exception e) {
			System.out.println("ERROR: " + e.getMessage() );
			return ERROR;

		}
        return SUCCESS;
    }
	
	public List<String> getFotos() {
		return fotos;
	}
	public void setFotos(List<String> fotos) {
		this.fotos = fotos;
	}
	public List<Automovil> getAuto() {
		return auto;
	}
	public void setAuto(List<Automovil> auto) {
		this.auto = auto;
	}
	public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    
}