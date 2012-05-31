package autos;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import autos.modelos.Persona;
import autos.modelos.Usuario;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class PerfilUsuario extends ActionSupport{
    
	private String id = "";
	private List<Usuario> usuario = new ArrayList<Usuario>();
	private List<Persona> detalleVendedores = new ArrayList<Persona>();
	
	public String execute(){
    	
    	Map<String, Object> session = ActionContext.getContext().getSession();
    	String usuarioSesion; 
    	boolean registrarVisita = false;
    	if( getId().equals( "" ) ){ 
    		usuarioSesion = session.get("idUsuario").toString(); // Revisar perfil de usuario actual.
    	}else{ 
    		usuarioSesion = getId(); 
    		registrarVisita = true; // El visitante viene desde descripcion de automovil.
    	};
    	
    	System.out.println("session: " + session.get("idUsuario").toString() + " ID: " + getId() + " usuarioSesion: " + usuarioSesion );
    	
    	try {
			
			Conexion c = new Conexion();
    		
    		if( c.conn != null  ){
    			
    			/* Obtener datos Generales del Usuario */
				String consulta = "SELECT * FROM Persona WHERE id = ?";
				c.preparedStatement = c.conn.prepareStatement( consulta );
				c.preparedStatement.setString( 1, usuarioSesion );
				ResultSet rs = c.preparedStatement.executeQuery();
				while ( rs.next() ) {
					usuario.add( new Usuario( rs.getString("id"), rs.getString("e-mail"), rs.getString("web"), rs.getString("descripcion"), rs.getString("foto"), rs.getString("nombre_vendedor"), rs.getString("tipo") ) );
					
					/* Si es administrador, mostramos detalles de pago de vendedores */
					if( rs.getString("tipo").equals("ADMIN") ){
						
						consulta = "SELECT id, nombre_vendedor, SUM( numeroVisitas ) as visitas FROM VisitasVendedor, Persona " +  
								   "WHERE id = idVendedor GROUP BY idVendedor";
						c.preparedStatement = c.conn.prepareStatement( consulta );
						ResultSet rs2 = c.preparedStatement.executeQuery();
						
						while( rs2.next() ){
							System.out.println("Agregando detalles de vendedores.");
							detalleVendedores.add( new Persona( rs2.getString("id"), rs2.getString("nombre_vendedor"), rs2.getInt("visitas") ) );
						}
					}
					
				}
				
				/* Si la persona que consulta el auto no es el vendedor del mismo, se agrega una visita al vendedor */
				if( ! session.get("idUsuario").toString().equals( usuarioSesion ) && registrarVisita ){
					
					/* Obtenemos fecha actual */
					java.util.Date utilDate = new java.util.Date(); // Fecha actual
					long lnMilisegundos = utilDate.getTime();
					java.sql.Date sqlDate = new java.sql.Date(lnMilisegundos);
					System.out.println( "FECHA: " + sqlDate );
				
					/* A–adir hit de consulta por el usuario */
					consulta = 	"SELECT * FROM VisitasVendedor WHERE idVendedor = ? AND idCliente = ?";
					c.preparedStatement = c.conn.prepareStatement( consulta );
					c.preparedStatement.setString( 1, getId() );
					c.preparedStatement.setString( 2, session.get("idUsuario").toString() );
					rs = c.preparedStatement.executeQuery();
					
					boolean consultado = false;
					
					while ( rs.next() ) {
						
						/* Comparamos fechas. Se registra 1 consulta del cliente por dia. */
						if( ! sqlDate.toString().equals( rs.getDate("ultimaVisita").toString() ) ){
							consulta = 	"UPDATE VisitasVendedor SET numeroVisitas = ? WHERE idCliente = ?";
							c.preparedStatement = c.conn.prepareStatement( consulta );
							c.preparedStatement.setInt( 1, rs.getInt("consultas") + 1 );
							c.preparedStatement.setString( 2, usuarioSesion );
							c.preparedStatement.executeUpdate();
						}
						
						consultado = true;
					}
					
					if( !consultado ){
						
						consulta = 	"INSERT INTO VisitasVendedor VALUES( ?, ?, ?, ? )";
						c.preparedStatement = c.conn.prepareStatement( consulta );
						c.preparedStatement.setString( 1, getId() );
						c.preparedStatement.setString( 2, session.get("idUsuario").toString() );
						c.preparedStatement.setDate( 3, (Date) sqlDate  );
						c.preparedStatement.setInt( 4, 1 );
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
	
	public List<Usuario> getUsuario() {
		return usuario;
	}

	public void setUsuario(List<Usuario> usuario) {
		this.usuario = usuario;
	}

	public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }

	public List<Persona> getDetalleVendedores() {
		return detalleVendedores;
	}

	public void setDetalleVendedores(List<Persona> detalleVendedores) {
		this.detalleVendedores = detalleVendedores;
	}
    
}