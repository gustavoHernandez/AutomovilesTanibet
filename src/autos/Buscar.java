package autos;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import autos.modelos.Automovil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class Buscar extends ActionSupport{
    
	private String criterio;
	private String modelo;
	private String marca;
	private String anio;
    private String precio;
    private String km;
    private String cilindros;
	private List<Automovil> autos = new ArrayList<Automovil>();
	private List<String> fotos = new ArrayList<String>();
	
	public String execute(){
    	
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		if( session.get("tipoUsuario") == null ){
			session.put("tipoUsuario", "VISITANTE" );
		}
		
		if ( ! session.get("tipoUsuario").toString().equals("EXPERTO") ){
			
			try {
				
				Conexion c = new Conexion();
	    		
	    		if( c.conn != null  ){
	    			
	    			/* Obtener datos Generales del Automovil */
					String consulta = 	"SELECT * FROM Coche, Categorias " +
										"WHERE id = idcoche " +
										"AND categoria = ?" +
										"AND duracion != 0";
					
					if( getPrecio() != null ){
						
						if( !getPrecio().equals("%") ){  consulta += " AND ( precio > " + getPrecio() + " )" ; }
						if( !getKm().equals("%") ){  consulta += " AND ( km > " + getKm() + " )" ; }
						if( !getCilindros().equals("%") ){  consulta += " AND cilindros LIKE '" + getCilindros() + "'"; }
						if( !getMarca().equals("%") ){  consulta += " AND marca LIKE '" + getMarca() + "'"; }
						if( !getAnio().equals("%") ){  consulta += " AND a–o LIKE '" + getAnio() + "'"; }
						
					}
					
					c.preparedStatement = c.conn.prepareStatement( consulta );
					c.preparedStatement.setString( 1, getCriterio() );
					
					System.out.println( c.preparedStatement );
					
					ResultSet rs = c.preparedStatement.executeQuery();
					
					while ( rs.next() ) {
						
						autos.add( new Automovil( rs.getString("id"), rs.getString("modelo"), "", 0, rs.getDouble("precio"), 0, 0, rs.getString("idPersona"), "", 0 ) );
					
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
    
   	public String getCriterio() {
		return criterio;
	}

	public void setCriterio(String criterio) {
		this.criterio = criterio;
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

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getAnio() {
		return anio;
	}

	public void setAnio(String anio) {
		this.anio = anio;
	}

	public String getPrecio() {
		return precio;
	}

	public void setPrecio(String precio) {
		this.precio = precio;
	}

	public String getKm() {
		return km;
	}

	public void setKm(String km) {
		this.km = km;
	}

	public String getCilindros() {
		return cilindros;
	}

	public void setCilindros(String cilindros) {
		this.cilindros = cilindros;
	}

}