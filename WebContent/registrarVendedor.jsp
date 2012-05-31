<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Registrar Vendedor</title>

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
	
</head>

<body>
<!-- Panel -->
<div id="toppanel">
	<div id="panel">
		<div class="content clearfix">
			<div class="left">
				<h1>Bienvenido a nuestra pagina!</h1>
				<h2>Registro de usuario al sistema.</h2>		
				<p class="grey">Desde este panel puede entrar en el sistema si es un usuario registrado, o registrarse si aun no es miembro.</p>
				<h2>Ingresar al sistema</h2>
				<p class="grey">Ingrese sus datos en los campos correspondientes si ya es miembro de nuestra pagina.</p>
			</div>
			<div class="left">
				<!-- Login Form -->
				<form class="clearfix" action="#" method="post">
					<h1>Login Miembros</h1>
					<label class="grey" for="log">Usuario:</label>
					<input class="field" type="text" name="log" id="log" value="" size="23" />
					<label class="grey" for="pwd">Password:</label>
					<input class="field" type="password" name="pwd" id="pwd" size="23" />
	            	<label><input name="rememberme" id="rememberme" type="checkbox" checked="checked" value="forever" /> &nbsp;Recuerdame</label>
        			<div class="clear"></div>
					<input type="submit" name="submit" value="Entrar" class="bt_login" />
					
				</form>
			</div>
			<div class="left right">			
				<!-- Register Form -->
				<form id="formRegistroPop" action="registro" method="post">
					<h1>No es miembro aun? Registrese!</h1>				
					
					<label class="grey" for="usuario">e-mail:</label>
					<input class="field" type="text" name="usuario" id="usuario" value="" size="23" />
					
					<label class="grey" for="pass">Contrase&ntilde;a:</label>
					<input class="field" type="password" name="pass" id="pass" size="23" />
					
					<label class="grey" for="pass2">Confirmar Contrase&ntilde;a:</label>
					<input class="field" type="password" name="pass2" id="pass2" size="23" />
					
					<label><input name="vendedor" id="vendedor" type="checkbox" value="false" /> &nbsp;Soy vendedor.</label>
					<input type="button" name="button" value="Registrar" class="bt_register" onclick="registrar();" />
				
				</form>
			</div>
		</div>
</div> <!-- /login -->	

	<!-- The tab on top -->	
	<div class="tab">
		<ul class="login">
			<li class="left">&nbsp;</li>
			<li>Bienvenido Gustavo!</li>
			<li class="sep">|</li>
			<li id="toggle">
				<a id="open" class="open" href="#">Log In | Registro</a>
				<a id="close" style="display: none;" class="close" href="#">Cerrar Panel</a>			
			</li>
			<li class="right">&nbsp;</li>
		</ul> 
	</div> <!-- / top -->
	
</div> <!--panel -->






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
          
          <s:if test="#session.tipoUsuario == 'VENDEDOR'">
  				<li> <a href="registrarAuto">Registrar Auto</a></li>  
  		  </s:if>
  		  
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
			<h2>Detalle de Vendedor.</h2>
			<h3>Rellene los siguientes campos para completar su perfil de vendedor en el sistema.</h3>
		</div>
    	
		<div id="tabs-vendedor" style="width: 700px; margin-bottom:100px; padding-left:50px;">
			<form action="registrarVendedor" id="formRegistrarVendedor" enctype="multipart/form-data" method="post">
					
					<table>
						<tr>
							<td><label for="usuario">Usuario:</label>
							</td>
							<td><input type="text" id="us" name="usuario" value="<s:property value="usuario"></s:property>" size="80"/>
							</td>
						</tr>
						<tr>
							<td><label for="password">Password:</label>
							</td>
							<td><input type="password" id="pa" name="password" value="<s:property value="password"></s:property>" size="80"/>
							</td>
						</tr>
						<tr>
							<td><label for="nombre_vendedor">Nombre del vendedor:</label>
							</td>
							<td><input type="text" id="no" name="nombre_vendedor" size="80"/>
							</td>
						</tr>
						<tr>
							<td align="right"><label for="descripcion">Descripci&oacute;n:</label>
							</td>
							<td><textarea cols="82" rows="5" id="de" name="descripcion"></textarea>
							</td>
						</tr>
						<tr>
							<td align="right"><label for="email">e-mail:</label>
							</td>
							<td><input type="text" id="em" name="email" value="<s:property value="usuario"></s:property>" size="80" />
							</td>
						</tr>
						<tr>
							<td align="right"><label for="web">Pagina web:</label>
							</td>
							<td><input type="text" id="web" name="web" size="80" />
							</td>
						</tr>
						<tr>
							<td align="right"><label for="archivo">Subir imagen:</label></td>
							<td>
								<input type="file" id="ar" name="archivo" value="Buscar..."/>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<input type="button" value="Completar registro" onclick="validaRegistroVendedor();" />
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
      		
      		<h1><span id="mensajeAlerta">Experto registrado correctamente.</span></h1>
        	<br/><br/>
        	
        	<input type="button" value="OK" class="noactivar" />
       
    	</div>
    	
    	
    	
	</div>

</body>
</html>
