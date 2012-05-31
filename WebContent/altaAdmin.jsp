<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Alta Administrador</title>

<link href="public/css/style.css" rel="stylesheet" type="text/css" />
<link href="public/css/slideshow.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="public/css/slide.css" type="text/css" media="screen" />
<link rel="stylesheet" href="public/css/uniform.default.css" type="text/css" media="screen" />


<script type="text/javascript" src="public/js/jquery.min.js"></script>
<script type="text/javascript" src="public/js/jquery.cycle.js"></script>
<script type="text/javascript" src="public/js/jquery.functions.js"></script>
<script type="text/javascript" src="public/js/jquery.uniform.min.js"></script>

<script src="public/js/cufon-yui.js" type="text/javascript"></script>
<script src="public/js/Comfortaa_400.font.js" type="text/javascript"></script>

<script type="text/javascript">
			Cufon.replace('h1', { fontFamily: 'Comfortaa' });
			Cufon.replace('h2', { fontFamily: 'Comfortaa' });
			Cufon.replace('h3', { fontFamily: 'Comfortaa' });
			Cufon.replace('h4', { fontFamily: 'Comfortaa' });
		</script>
	<!--script type="text/javascript" src="http://www.fruitblu.com/oxo/assets/js/font-delicious.js"></script-->

	<!-- PNG FIX for IE6 -->
  	<!-- http://24ways.org/2007/supersleight-transparent-png-in-ie6 -->
	<!--[if lte IE 6]>
		<script type="text/javascript" src="public/js/pngfix/supersleight-min.js"></script>
	<![endif]-->

	<!-- Sliding effect -->
	<script src="public/js/slide.js" type="text/javascript"></script>
	
	<script src="public/js/sitio.js" type="text/javascript"></script>
	
	<s:if test="idUsuario != null">
	
		<script type="text/javascript">
			$(document).ready(function(){
				
				$('#aviso').click();
				
			
			});
		</script>
	
	</s:if>
	
	<script type="text/javascript">
			$(document).ready(function(){
				$("select").uniform({
					width: "100px",
				});
			
			});
	</script>
	
</head>

<body>

<div id="Layout">
  <!-- BEGIN HEADER -->
  <div id="Top">
    <div id="Logo">
      <h1><a href="index.html"><img src="public/images/escom.jpg" alt="ESCOM" width="89" height="46" /></a></h1>
    </div>
    <!-- end div #Logo -->
    
    <!-- end div #TopContent -->
    <div id="Nav">
      <div class="NavBody">
        <ul>
          <li> <a href="principal">Pagina de Inicio</a></li>
          
          <s:if test="#session.tipoUsuario == 'ADMIN'">
  				<li> <a href="registrarExperto">Registrar Experto</a></li>
  				<li> <a href="asignarExpertos">Asignar Expertos</a></li>  
  		  </s:if>
  		  
          <s:if test="#session.idUsuario != null">
          	<li> <a href="perfil">Mi cuenta</a></li>
          	<li><a href="logout">Cerrar Sesion</a></li>
          </s:if>
        
        </ul>
      </div>
    </div>
    <!-- end div #Nav -->
  </div>
  <!-- end div #Top -->
  <!-- END HEADER -->
  
  
  <!-- BEGIN CONTENT -->
  <div id="Content">
    
    <div class="RightSideAlone">
    	
    	<div class="detailInfo" style="padding-left:50px;margin-bottom:20px;">
			<h2>Cambiar tipo de cuenta de usuario.</h2>
			<h3>Seleccione un usuario y el tipo de cuenta con la que ingrese al sistema.</h3>
		</div>
    	
		<div id="tabs-vendedor" style="width: 700px; margin-bottom:100px; padding-left:50px;">
			<form action="altaAdmin" id="formAltaAdmin" method="post">
					
					<table>
						<tr>
							<td>
								<label for="idUsuario">Usuario:</label>
							</td>
							<td>
								<select name="idUsuario">
									<s:iterator value="usuario">
										<option value="<s:property value="id" />"><s:property value="email" /></option>
									</s:iterator>
								</select>
							</td>
							<td>
								<label for="privilegio">Tipo de Cuenta:</label>
							</td>
							<td>
								<select name="privilegio">
									<option value="ADMIN">ADMINISTRADOR</option>
									<option value="EXPERTO">EXPERTO</option>
									<option value="VENDEDOR">VENDEDOR</option>
									<option value="USUARIO">USUARIO</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="4" align="right">
								<input type="submit" value="Asignar Privilegio" />
							</td>
						</tr>
					</table>
				
			</form>
		</div>
	
    	
    	
    	
    </div>
    
    <div class="clr"></div>
    <!-- BEGIN FOOTER -->
    <div id="Footer">
      <div class="footerbody">
        <div class="footercontent">Copyright 2012 <span class="blue">Venta de Autos</span> <a href="index.html#">Quienes somos?</a> | <a href="index.html#">Condiciones de uso</a> | <a href="http://www.escom.ipn.mx/" target="_new">ESCOM</a></div>
      </div>
    </div>
    <!-- END FOOTER -->
  </div>
  <!-- END CONTENT -->
  <div id="Footerimg"> </div>
</div>
<!-- end div #Layout -->


<!-- Oculto: Mensaje de advertencia  -->

	<div id="boxes">

		<div id="mask" style="width:1279px; opacity: 0.8; "></div>

		<a href="#dialog2" name="modal" id="aviso" style="display:none">Sticky Note</a>
		<div id="dialog2" class="window" align="center" style="top: 236.5px; left: 428px; display: none; ">
      		
      		<h1><span id="mensajeAlerta">Privilegio asignado correctamente.</span></h1>
        	<br/><br/>
        	
        	<input type="button" value="OK" class="noactivar" />
       
    	</div>
    	
    	
    	
	</div>

</body>
</html>
