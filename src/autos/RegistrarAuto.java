package autos;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RegistrarAuto extends ActionSupport {
    
	public String execute(){
    	
		Map<String, Object> session = ActionContext.getContext().getSession();
		return ( session.get("tipoUsuario").toString().equals("VENDEDOR") ) ? SUCCESS : ERROR;
		
    }
}