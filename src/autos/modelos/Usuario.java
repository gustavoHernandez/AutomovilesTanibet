package autos.modelos;

public class Usuario extends Persona {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String usuario;
	private String password;
	private String tipo;
	
	public String getUsuario() {
        return usuario;
    }
    
	public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
	
	public String getPassword(){
    	return password;
    }
    
    public void setPassword( String password ){
    	this.password = password;
    }
    public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public Usuario(){}

    public Usuario(String id, String email, String web, String descripcion, String foto, String nombre_vendedor, String tipo ){
    	
    	super( id, email, web, descripcion, foto, nombre_vendedor );
    	this.tipo = tipo;
    }
}
