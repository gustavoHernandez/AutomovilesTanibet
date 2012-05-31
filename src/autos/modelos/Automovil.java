package autos.modelos;

import java.io.Serializable;

public class Automovil implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String modelo;
	private String marca;
	private int anio;
    private double precio;
    private int km;
    private int cilindros;
    private String idPersona;
    private String critica;
    private int duracion;
    private String fotoPrincipal;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getAnio() {
		return anio;
	}
	public void setAnio(int anio) {
		this.anio = anio;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public int getKm() {
		return km;
	}
	public void setKm(int km) {
		this.km = km;
	}
	public int getCilindros() {
		return cilindros;
	}
	public void setCilindros(int cilindros) {
		this.cilindros = cilindros;
	}
	public String getIdPersona() {
		return idPersona;
	}
	public void setIdPersona(String idPersona) {
		this.idPersona = idPersona;
	}
	public int getDuracion() {
		return duracion;
	}
	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}
	public String getCritica() {
		return critica;
	}
	public void setCritica(String critica) {
		this.critica = critica;
	}
	
	public String getFotoPrincipal() {
		return fotoPrincipal;
	}
	public void setFotoPrincipal(String fotoPrincipal) {
		this.fotoPrincipal = fotoPrincipal;
	}
	public Automovil(){}
	
	public Automovil(String id, String modelo, String marca, int anio,
			double precio, int km, int cilindros, String idPersona,
			String critica, int duracion) {
		//super();
		this.id = id;
		this.modelo = modelo;
		this.marca = marca;
		this.anio = anio;
		this.precio = precio;
		this.km = km;
		this.cilindros = cilindros;
		this.idPersona = idPersona;
		this.critica = critica;
		this.duracion = duracion;
	}
	
	public Automovil(String id, String modelo, int anio, double precio, String idPersona ) {
		this.id = id;
		this.modelo = modelo;
		this.anio = anio;
		this.precio = precio;
		this.idPersona = idPersona;
	}
    
}
