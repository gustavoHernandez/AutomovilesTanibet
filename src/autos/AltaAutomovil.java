package autos;

import autos.modelos.Automovil;
import autos.modelos.Persona;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;


@SuppressWarnings("serial")
public class AltaAutomovil extends ActionSupport implements ModelDriven<Automovil> {
    
	private List<Automovil> auto = new ArrayList<Automovil>();
	private List<Persona> vendedor = new ArrayList<Persona>();
	private List<String> fotos = new ArrayList<String>();
	
	private Automovil automovil = new Automovil();
	public Automovil getModel(){
        return automovil;
    }
	
	private File archivo[]; 
	private String archivoContentType[]; 
	private String archivoFileName[];
	
	public String execute(){
    	
    	
		try {
			
			Map<String, Object> session = ActionContext.getContext().getSession();
			
			String idVendedor = session.get("idUsuario").toString();
			String idCoche = "AUT" + System.currentTimeMillis();

			Conexion c = new Conexion();
    		
    		if( c.conn != null  ){
    			
    			/* Datos Generales del Automovil */
				String consulta = 	"INSERT INTO Coche VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? );";
				
				c.preparedStatement = c.conn.prepareStatement( consulta );
				c.preparedStatement.setString( 1, idCoche );
				c.preparedStatement.setString( 2, automovil.getModelo() );
				c.preparedStatement.setString( 3, automovil.getMarca() );
				c.preparedStatement.setInt( 4, automovil.getAnio() );
				c.preparedStatement.setDouble( 5, automovil.getPrecio() );
				c.preparedStatement.setInt( 6, automovil.getKm() );
				c.preparedStatement.setInt( 7, automovil.getCilindros() );
				c.preparedStatement.setString( 8, idVendedor );
				c.preparedStatement.setString( 9, "" );
				c.preparedStatement.setInt( 10, automovil.getDuracion() );
				
				System.out.println( c.preparedStatement );
				c.preparedStatement.executeUpdate();
				
				String fullFileName = "/Users/volaverunt/Documents/workspace/automoviles/WebContent/public/vendedores/" + idVendedor + "/" + idCoche;
				File theFile = new File(fullFileName);
				FileUtils.forceMkdir(theFile);
				
				for ( int i = 0; i < archivo.length; i++ ) {
		            if( archivoContentType[i].indexOf("image") != -1 ){
						
		            	/* Relacionar imagenes */
		            	consulta = 	"INSERT INTO Imagen VALUES( ?, ? );";
						
						c.preparedStatement = c.conn.prepareStatement( consulta );
						c.preparedStatement.setString( 1, idCoche );
						c.preparedStatement.setString( 2, archivoFileName[i] );
						c.preparedStatement.executeUpdate();
		            	
		            	fullFileName = "/Users/volaverunt/Documents/workspace/automoviles/WebContent/public/vendedores/" + idVendedor + "/" + idCoche + "/" + archivoFileName[i];
						theFile = new File(fullFileName);
						FileUtils.copyFile( archivo[i], theFile, true);
						
						
						
					}
		        }
				
				auto.add( new Automovil( idCoche, automovil.getModelo(), automovil.getMarca(), automovil.getAnio(), automovil.getPrecio(), automovil.getKm(), automovil.getCilindros(), idVendedor, automovil.getCritica(), automovil.getDuracion() ) );
				
				//System.out.println( "NUMERO DE IMAGENES SUBIDAS: " +  archivo.length );
				
			}
            
    	} catch (Exception e) {
			System.out.println("ERROR: " + e.getMessage() );
			return ERROR;

		}
		
	    return SUCCESS;
		
	}

	/**
	 * @return the archivo
	 */
	public File[] getArchivo() {
		return archivo;
	}

	/**
	 * @param archivo the archivo to set
	 */
	public void setArchivo(File[] archivo) {
		this.archivo = archivo;
	}

	/**
	 * @return the archivoContentType
	 */
	public String[] getArchivoContentType() {
		return archivoContentType;
	}

	/**
	 * @param archivoContentType the archivoContentType to set
	 */
	public void setArchivoContentType(String[] archivoContentType) {
		this.archivoContentType = archivoContentType;
	}

	/**
	 * @return the archivoFileName
	 */
	public String[] getArchivoFileName() {
		return archivoFileName;
	}

	/**
	 * @param archivoFileName the archivoFileName to set
	 */
	public void setArchivoFileName(String[] archivoFileName) {
		this.archivoFileName = archivoFileName;
	}

	public List<Automovil> getAuto() {
		return auto;
	}

	public void setAuto(List<Automovil> auto) {
		this.auto = auto;
	}

	public List<Persona> getVendedor() {
		return vendedor;
	}

	public void setVendedor(List<Persona> vendedor) {
		this.vendedor = vendedor;
	}

	public List<String> getFotos() {
		return fotos;
	}

	public void setFotos(List<String> fotos) {
		this.fotos = fotos;
	}
	
}