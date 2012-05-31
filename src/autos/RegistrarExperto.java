package autos;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RegistrarExperto extends ActionSupport {
    
	public String execute(){
    	
		Map<String, Object> session = ActionContext.getContext().getSession();
		//System.out.println("TIPO: " + session.get("tipoUsuario") );
		return ( session.get("tipoUsuario").toString().equals("ADMIN") ) ? SUCCESS : ERROR;
		 
    }
}