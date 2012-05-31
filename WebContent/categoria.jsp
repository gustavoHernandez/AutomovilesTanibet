<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Busqueda</title>
<link href="public/css/style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="public/css/slide.css" type="text/css" media="screen" />
<link rel="stylesheet" href="public/css/jquery.lightbox.css" type="text/css" media="screen" />
<link rel="stylesheet" href="public/css/uniform.default.css" type="text/css" media="screen" />

<script type="text/javascript" src="public/js/jquery.min.js"></script>
<script type="text/javascript" src="public/js/jquery.uniform.min.js"></script>
<script src="public/js/cufon-yui.js" type="text/javascript"></script>
<script src="public/js/Comfortaa_400.font.js" type="text/javascript"></script>


		<script type="text/javascript">
			Cufon.replace('h1', { fontFamily: 'Comfortaa' });
			Cufon.replace('h2', { fontFamily: 'Comfortaa' });
			Cufon.replace('h3', { fontFamily: 'Comfortaa' });
			Cufon.replace('h4', { fontFamily: 'Comfortaa' });

		</script>
		
		<!-- PNG FIX for IE6 -->
	  	<!-- http://24ways.org/2007/supersleight-transparent-png-in-ie6 -->
		<!--[if lte IE 6]>
			<script type="text/javascript" src="public/js/pngfix/supersleight-min.js"></script>
		<![endif]-->
	
		<!-- Sliding effect -->
		<script src="public/js/slide.js" type="text/javascript"></script>
		
		<script type="text/javascript" src="public/js/jquery.lightbox.min.js"></script>
		<script type="text/javascript" src="public/js/sitio.js"></script>
		<script type="text/javascript">
		    $(document).ready(function($){
		    	$('.lightbox').lightbox();
		    	$("select").uniform();
		    });
		</script>
		
		

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
    </div>      <!-- end div #Nav -->

  </div>      <!-- end div #Top -->
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
      
    </div>   
    <!-- end div #LeftSide -->
            <div class="RightSide">    

				<div class="bredCrum">
					<h4><a href="principal">Inicio</a>   /   &nbsp; <a href="buscar?criterio=nuevos">Nuevos</a>  </h4>
			    </div>
			    
			    <div class="bredCrum">
			    
			    	<form id="formBusqueda" action="buscar" method="post">
			    
			    	<table>
			    
			    		<tr>
			    			<td align="right">
			    				<span style="font-size: 11px">Precio:</span>
			    			</td>
			    			<td>
					    		<select name="precio" id="precio">
									<option value="%">Cualquiera...</option>
									<option value="10000 AND precio <= 50000">Entre $10,000 y $50,000</option>
									<option value="50000 AND precio <= 100000">Entre $50,000 y $100,000</option>
									<option value="100000 AND precio <= 200000">Entre $100,000 y $200,000</option>
									<option value="200000 AND precio <= 1000000">Mas de $200,000</option>
								</select>
							</td>
							<td align="right">
								<span style="font-size: 11px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kilometraje:</span>
							</td>
			    			<td>
								<select name="km" id="km">
									<option value="%">Cualquiera...</option>
									<option value="0 AND km <= 25000">Menor a 25,000 KM</option>
									<option value="25000 AND km <= 50000">Entre 25,000 y 50,000 KM</option>
									<option value="50000 AND km <= 100000">Entre 50,000 y 100,000 KM</option>
									<option value="100000 AND km <= 200000">Entre 100,000 y 200,000 KM</option>
								</select>
							</td>
						</tr>
						<tr>
			    			<td align="right">
								<span style="font-size: 11px">Cilindros:</span>
							</td>
			    			<td>	
								<select name="cilindros" id="cilindros">
									<option value="%">Cualquiera...</option>
									<option value="1">1 cilindro</option>
									<option value="2">2 cilindros</option>
									<option value="3">3 cilindros</option>
									<option value="4">4 cilindros</option>
									<option value="5">5 cilindros</option>
									<option value="6">6 cilindros</option>
									<option value="7">7 cilindros</option>
									<option value="8">8 cilindros</option>
								</select>
							</td>
							<td align="right">
			    				<span style="font-size: 11px">Marca:</span>
							</td>
			    			<td>
								<select name="marca" id="marca">
									<option value="%">Cualquiera...</option>
									<option value="Ford">Ford</option>
									<option value="VolksWagen">VolksWagen</option>
									<option value="Chevrolet">Chevrolet</option>
									<option value="Honda">Honda</option>
									<option value="Toyota">Toyota</option>
									<option value="Nissan">Nissan</option>
									<option value="Peugeot">Peugeot</option>
									<option value="Mitsubishi">Mitsubishi</option>
									<option value="BMW">BMW</option>
									<option value="Chrysler">Chrysler</option>
								</select>
							</td>
						</tr>
						<tr>
			    			<td align="right">
			    				<span style="font-size: 11px">A&ntilde;o:</span>
							</td>
			    			<td>
								<select name="anio" id="anio">
									<option value="%">Cualquiera...</option>
									<option value="2000">2000</option>
									<option value="2001">2001</option>
									<option value="2002">2002</option>
									<option value="2003">2003</option>
									<option value="2004">2004</option>
									<option value="2005">2005</option>
									<option value="2006">2006</option>
									<option value="2007">2007</option>
									<option value="2008">2008</option>
									<option value="2009">2009</option>
									<option value="2010">2010</option>
									<option value="2011">2011</option>
									<option value="2012">2012</option>
								</select>
							</td>
							<td colspan="2" align="right">
								<input type="hidden" name="criterio" value="<s:property value="criterio"/>" />
								<input type="hidden" name="categoria" value="<s:property value="criterio"/>" />
			    				<input type="submit" value="Buscar" />
							</td>
						</tr>
				
					</table>	
					</form>
				
				</div>
			    
             	
             	
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
             	
             	                
                
                
               
          </div>    <!-- end div #RightSide-->

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
