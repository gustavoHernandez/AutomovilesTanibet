package autos;


import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.util.*;


@SuppressWarnings("serial")
public class Logout extends ActionSupport {
    
	public String execute(){
    	
		Map<String,Object> session = ActionContext.getContext().getSession();
		session.remove("tipoUsuario"); 
		session.remove("idUsuario");
		session.remove("usuario");
    	return SUCCESS;
	}
	
}