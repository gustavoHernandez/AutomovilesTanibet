<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Registrar Automovil</title>

<link href="public/css/style.css" rel="stylesheet" type="text/css" />
<link href="public/css/slideshow.css" rel="stylesheet" type="text/css" />

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

	<script src="public/js/sitio.js" type="text/javascript"></script>
	
	<s:if test="usuario != null">
	
		<script type="text/javascript">
			$(document).ready(function(){
				
				$('#aviso').click();
			
			});
		</script>
	
	</s:if>
	
</head>

<body>


<div id="Layout">
  <!-- BEGIN HEADER -->
  <div id="Top">
    <div id="Logo">
      <h1><a href="index.html"><img src="public/images/escom.jpg" alt="ESCOM" width="89" height="46" /></a></h1>
    </div>
    <!-- end div #Logo -->
    <div id="TopContent">
      <ul>
        <li class="cart">
        	
        		<s:if test="#session.tipoUsuario != null">
        			<a href="perfil"><s:property value="%{#session.usuario}"/></a>
        		</s:if>
        		<s:else>
        			<a href="#">Visitante.</a>
        		</s:else>
        	
        </li>
        <!--li class="cart-value"><span class="blue"><a href="#">6 automoviles.</a></span></li-->
      </ul>
    </div>
    <!-- end div #TopContent -->
    <div id="Nav">
      <div class="NavBody">
        <ul>
          <li> <a href="principal">Pagina de Inicio</a></li>
          
          <s:if test="#session.idUsuario != null">
          	<li> <a href="asignarExpertos">Asignar Expertos</a></li> 
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
			<h2>Detalle de Experto.</h2>
			<h3>Rellene los siguientes campos con la informacion del Experto.</h3>
		</div>
    	
		<div id="tabs-vendedor" style="width: 700px; margin-bottom:100px; padding-left:50px;">
			<form action="altaExperto" id="formRegistrarExperto" enctype="multipart/form-data" method="post">
				
					<table>
						<tr>
							<td align="right">
								<label for="usuario">Usuario:</label>
							</td>
							<td>
								<input type="text" name="usuario" id="us" size="80"/>
							</td>
						</tr>
						<tr>
							<td align="right">
								<label for="pass">Password:</label>
							</td>
							<td>
								<input type="password" name="password" id="pa" size="80"/>	
							</td>
						</tr>
						<tr>
							<td align="right">
								<label for="email">e-mail:</label>
							</td>
							<td>
								<input type="text" name="email" id="em" size="80"/>	
							</td>
						</tr>
						<tr>
							<td align="right">
								<label for="descripcion">Descripcion:</label>
							</td>
							<td>
								<textarea id="descripcion" name="descripcion" id="de" cols="82"></textarea>.
							</td>
						</tr>
						
						<tr>
							<td align="right"><label for="img">Imagen:</label></td>
							<td>
								<input type="file" name="archivo" id="ar" value="Buscar..."/>
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<input type="button" value="Registrar Experto" onclick="validaRegistroExperto();" />
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
