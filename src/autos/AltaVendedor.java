package autos;

import autos.modelos.Usuario;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.io.File;
import java.util.Map;

import org.apache.commons.io.FileUtils;


@SuppressWarnings("serial")
public class AltaVendedor extends ActionSupport implements ModelDriven<Usuario> {
	
	private Usuario usuario = new Usuario();
	public Usuario getModel(){
        return usuario;
    }
	
	private File archivo; 
	private String archivoContentType; 
	private String archivoFileName; 
	private String fileCaption;


	public String execute(){
    	
    	try {
			
			String idVendedor = "VEN" + System.currentTimeMillis();
			Conexion c = new Conexion();
    		
    		if( c.conn != null  ){
    				
				/* Datos Generales de Persona */
				String consulta = 	"INSERT INTO Persona VALUES( ?, ?, MD5( ? ), ?, ?, ?, ?, ?, ?, ?);";
				
				c.preparedStatement = c.conn.prepareStatement( consulta );
				c.preparedStatement.setString( 1, idVendedor );
				c.preparedStatement.setString( 2, usuario.getUsuario() );
				c.preparedStatement.setString( 3, usuario.getPassword() );
				c.preparedStatement.setString( 4, "VENDEDOR" );
				c.preparedStatement.setString( 5, usuario.getEmail() );
				c.preparedStatement.setString( 6, usuario.getWeb() );
				c.preparedStatement.setString( 7, usuario.getTelefono() );
				c.preparedStatement.setString( 8, usuario.getDescripcion() );
				c.preparedStatement.setString( 9, getArchivoFileName() );
				c.preparedStatement.setString( 10, usuario.getNombre_vendedor() );
				
				System.out.println( c.preparedStatement );
				c.preparedStatement.executeUpdate();
				
				String fullFileName = "/Users/volaverunt/Documents/workspace/automoviles/WebContent/public/vendedores/" + idVendedor;
				File theFile = new File(fullFileName);
				FileUtils.forceMkdir(theFile);
				
				fullFileName = "/Users/volaverunt/Documents/workspace/automoviles/WebContent/public/vendedores/" + idVendedor + "/" + getArchivoFileName();
				theFile = new File(fullFileName);
				FileUtils.copyFile( archivo, theFile);
				
				Map<String, Object> session = ActionContext.getContext().getSession();
				session.put("tipoUsuario", "VENDEDOR" );
				session.put("usuario", usuario.getUsuario() );
				session.put("idUsuario", idVendedor );
				
				//System.out.println( this.getArchivoFileName() );
				
				
            }
            
    		return SUCCESS;

		} catch (Exception e) {

			//addActionError(e.getMessage());
			System.out.println("ERROR: " + e.getMessage() );
			return ERROR;

		}

	}


	/**
	 * @return the archivoContentType
	 */
	public String getArchivoContentType() {
		return archivoContentType;
	}


	/**
	 * @param archivoContentType the archivoContentType to set
	 */
	public void setArchivoContentType(String archivoContentType) {
		this.archivoContentType = archivoContentType;
	}


	/**
	 * @return the archivoFileName
	 */
	public String getArchivoFileName() {
		return archivoFileName;
	}


	/**
	 * @param archivoFileName the archivoFileName to set
	 */
	public void setArchivoFileName(String archivoFileName) {
		this.archivoFileName = archivoFileName;
	}


	/**
	 * @return the archivo
	 */
	public File getArchivo() {
		return archivo;
	}


	/**
	 * @param archivo the archivo to set
	 */
	public void setArchivo(File archivo) {
		this.archivo = archivo;
	}


	/**
	 * @return the fileCaption
	 */
	public String getFileCaption() {
		return fileCaption;
	}


	/**
	 * @param fileCaption the fileCaption to set
	 */
	public void setFileCaption(String fileCaption) {
		this.fileCaption = fileCaption;
	}
	
	
}