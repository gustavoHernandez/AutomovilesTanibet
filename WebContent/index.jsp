<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Venta de Autos</title>

<link href="public/css/style.css" rel="stylesheet" type="text/css" />
<link href="public/css/slideshow.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="public/css/uniform.default.css" type="text/css" media="screen" />

<link rel="stylesheet" href="public/css/slide.css" type="text/css" media="screen" />

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


<s:if test="#session.usuario == null">

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
				<form id="formLogin" class="clearfix" action="login" method="post">
					<h1>Login Miembros</h1>
					<label class="grey" for="usuario">Usuario:</label>
					<input class="field" type="text" name="usuario" id="usuario" value="" size="23" />
					<label class="grey" for="password">Password:</label>
					<input class="field" type="password" name="password" id="password" size="23" />
	            	<div class="clear"></div>
					<input type="button" value="Entrar" class="bt_login" onclick="login();" />
				</form>
			</div>
			<div class="left right">			
				<!-- Register Form -->
				<form id="formRegistroPop" action="registro" method="post">
					<h1>No es miembro aun? Registrese!</h1>				
					
					<label class="grey" for="usuario">e-mail:</label>
					<input class="field" type="text" name="usuario" id="usuarioRegistro" value="" size="23" />
					
					<label class="grey" for="pass">Contrase&ntilde;a:</label>
					<input class="field" type="password" name="password" id="passwordRegistro" size="23" />
					
					<label class="grey" for="pass2">Confirmar Contrase&ntilde;a:</label>
					<input class="field" type="password" name="password2" id="passwordRegistroConf" size="23" />
					
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
			<li>Venta de Autos</li>
			<li class="sep">|</li>
			<li id="toggle">
				<a id="open" class="open" href="#">Log In | Registro</a>
				<a id="close" style="display: none;" class="close" href="#">Cerrar Panel</a>			
			</li>
			<li class="right">&nbsp;</li>
		</ul> 
	</div> <!-- / top -->
	
</div> <!--panel -->


</s:if>



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
          
          <s:if test="#session.tipoUsuario == 'VENDEDOR'">
  				<li> <a href="registrarAuto">Registrar Auto</a></li>  
  		  </s:if>
  		  
  		  <s:if test="#session.tipoUsuario == 'EXPERTO'">
  				<li> <a href="evaluar">Evaluar Autos</a></li>  
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
    <div class="LeftSide">
      <div class="leftBox">
        <h3>Categorias</h3>
        <div class="leftBoxBody">
          <ul class="cat-link">
            <li><a href="buscar?criterio=nuevos">Autos nuevos</a></li>
            <li><a href="buscar?criterio=seminuevos">Autos seminuevos</a></li>
            <li><a href="buscar?criterio=importados">Autos importados</a></li>
            <li><a href="buscar?criterio=hibridos">Autos hibridos</a></li>
            <li><a href="buscar?criterio=americanos">Autos americanos</a></li>
            <li><a href="buscar?criterio=europeos">Autos europeos</a></li>
            <li><a href="buscar?criterio=asiaticos">Autos asiaticos</a></li>
          </ul>
        </div>
      </div>
      <div class="leftBox">
        <h3>Top 5...</h3>
        <div class="leftBoxBody">
          
          <ul class="sellerlist">
            
            <s:iterator value="autop" status="element">
            
	        	<li>
	        		<span><s:property value="#element.count"/></span>
	            	<p><a href="automovil?id=<s:property value="id"/>"><s:property value="modelo"/></a></p>
	              	<div class="clr"></div>
	            </li>
            
            </s:iterator>
            
          </ul>
          <div class="clr"></div>
        </div>
      </div>
      
    </div>
    <!-- end div #LeftSide -->
    <div class="RightSide">
      <!-- slideshow start -->
      <div id="slideshow">
        <ul id="slides">
        
        	<s:iterator value="autop" status="element">
        
		          <li style="position: absolute; top: 0px; left: 0px; display: list-item; z-index: 1;">
		         		<a href="automovil?id=<s:property value="id"/>">
		         			<img src="public/vendedores/<s:property value="idPersona"/>/<s:property value="id"/>/<s:property value="fotostop[#element.index]" />" alt="" width="693" height="256" />
		         		</a>
		         		<span class="slide_caption"> 
		         			<a href="automovil?id=<s:property value="id"/>" class="title"><s:property value="modelo"/></a> 
		         			A&ntilde;o: <s:property value="anio"/>, Precio: $<s:property value="precio"/>.
		         		</span>
		          </li>
        	
        	</s:iterator>
          
        </ul>
        <div id="slideshow_violator" class="clearfix">
          <div style="display: block;" id="project_caption"></div>
          <div id="slide_navigation" class="clearfix"></div>
        </div>
      </div>
      <div class="bredCrum" style="margin-bottom:38px;">
        <h4>Ultimos autos...</h4>
      </div>
      <!-- slideshow end -->
      
      
         <s:iterator value="autos" status="auto">
         
       		<s:if test="#auto.index % 3 == 0">
      			<div class="catrow">
      				<ul>
			</s:if>
					
		          		<s:if test="#auto.index % 3 != 2">	 
		          			<li>
		          		</s:if>
		          		<s:else>
		          			<li class="last">
		          		</s:else>
		          		
		            		<div class="catThum">
		            			<a href="automovil?id=<s:property value="id"/>">
		            				<img src="public/vendedores/<s:property value="idPersona"/>/<s:property value="id"/>/<s:property value="fotos[#auto.index]"/>" alt="" width="204" height="186" />
		            			</a>
		              		</div>
		            		<div class="catDetail">
		              			<h4><a href="automovil?id=<s:property value="id"/>"><s:property value="modelo"/></a></h4>
		              			<p>$<s:property value="precio"/></p>
		            		</div>
		          		</li>
		          		
			<s:if test="#auto.index % 3 == 2 || #auto.count == autos.size">	    
		        	</ul>
		        	<div class="clr"></div>
		      </div>
      		</s:if>
      		
      		
      
      </s:iterator>
      
      
      
      <div class="paging">
        <div class="pagingInfo">Mostrando <s:property value="autos.size"/> automoviles</div>
        <div class="clr"></div>
      </div>
    </div>
    <!-- end div #RightSide-->
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
      		
      		<h1><span id="mensajeAlerta"></span></h1>
        	<br/><br/>
        	
        	<s:iterator value="auto">
	        	<a href="automovil?id=<s:property value="id" />">
	        		<input type="button" value="Ver Registro" />
	        	</a>
        	</s:iterator>
        	<input type="button" value="Cerrar" class="noactivar" />
       
    	</div>
    	
    	
    	
	</div>



</body>
</html>
