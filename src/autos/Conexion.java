package autos;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexion {
	
	public Connection conn = null;
    public PreparedStatement preparedStatement = null;
    public ResultSet result = null;
    
    String url = "jdbc:mysql://localhost/autos_tanibet2";
	String driverName = "com.mysql.jdbc.Driver";
	String userName = "root";
	String password = "";
	
	public Conexion(){
		try{
		
			Class.forName( driverName );
			conn = (Connection) DriverManager.getConnection(url, userName, password);
        
		}catch(SQLException ex) {
            System.out.println("Hubo un problema al intentar conectarse con la base de datos " + ex.getMessage() );
        }
        catch(ClassNotFoundException ex) {
            System.out.println(ex);
        }
    }
	
	public void cerrarConexion() {
		try {
			if (conn != null) {
				conn.close();
			}
		}catch (Exception e) {
			System.out.println("Error al cerrar las conexiones: " + e );
		}
	}

}
