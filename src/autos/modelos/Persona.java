package autos.modelos;

import java.io.Serializable;

public class Persona implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String email;
	private String web;
	private String telefono;
	private String descripcion;
	private String foto;
	private int visitasVendedor;
	
	public Persona(){}
	
    public Persona(String id, String email, String web, String descripcion, String foto,
			String nombre_vendedor) {
		super();
		this.id = id;
		this.email = email;
		this.web = web;
		this.descripcion = descripcion;
		this.foto = foto;
		this.nombre_vendedor = nombre_vendedor;
	}
    
    public Persona( String id, String nombre_vendedor, int visitas ){
    	super();
    	this.id = id;
    	this.nombre_vendedor = nombre_vendedor;
    	this.visitasVendedor = visitas;
    }
    
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	private String nombre_vendedor;
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the web
	 */
	public String getWeb() {
		return web;
	}
	/**
	 * @param web the web to set
	 */
	public void setWeb(String web) {
		this.web = web;
	}
	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	/**
	 * @return the descripcion
	 */
	public String getDescripcion() {
		return descripcion;
	}
	/**
	 * @param descripcion the descripcion to set
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	/**
	 * @return the nombre_vendedor
	 */
	public String getNombre_vendedor() {
		return nombre_vendedor;
	}
	/**
	 * @param nombre_vendedor the nombre_vendedor to set
	 */
	public void setNombre_vendedor(String nombre_vendedor) {
		this.nombre_vendedor = nombre_vendedor;
	}

	public int getVisitasVendedor() {
		return visitasVendedor;
	}

	public void setVisitasVendedor(int visitasVendedor) {
		this.visitasVendedor = visitasVendedor;
	}
    
}
