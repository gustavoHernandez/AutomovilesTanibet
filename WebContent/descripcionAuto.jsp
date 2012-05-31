<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Descripcion de Automovil</title>

<link href="public/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="public/css/uniform.default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="public/css/slide.css" type="text/css" media="screen" />
<link rel="stylesheet" href="public/css/jquery.lightbox.css" type="text/css" media="screen" />

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
		
		<!--[if gte IE 9]>
			<script type="text/javascript">
				Cufon.set('engine', 'canvas');
			</script>
		<![endif]-->

		<!--script type="text/javascript" src="http://www.fruitblu.com/oxo/assets/js/font-delicious.js"></script-->
	
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
		    	//$("input:checkbox, input:text, input:password, textarea, submit").uniform();
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

<s:iterator value="auto">

<div id="Layout">
<!-- BEGIN HEADER -->
  <div id="Top">
    <div id="Logo">
      <h1><a href="index.html"><img src="public/images/escom.jpg" alt="ESCOM" width="89" height="46" /></a></h1>
    </div><!-- end div #Logo -->
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
            </div>   <!-- end div #LeftSide -->
            <div class="RightSide">     

				<div class="bredCrum">
					<h4><a href="#" class="select"> <s:property value="modelo"></s:property> </a></h4> 
			  </div>
             	<div class="productDetial">
             	
            			<div class="mainThumb">
						<a href="public/vendedores/<s:property value="idPersona" />/<s:property value="id" />/<s:property value="fotos[0]"/>" class="lightbox">
							<img src="public/vendedores/<s:property value="idPersona" />/<s:property value="id" />/<s:property value="fotos[0]"/>" alt="" width="471" height="260" />
						</a>
					</div>
					
					<div class="rightProduct">
					
						<div class="thumb marRight">
							<a href="public/vendedores/<s:property value="idPersona" />/<s:property value="id" />/<s:property value="fotos[1]"/>" class="lightbox">
								<img src="public/vendedores/<s:property value="idPersona" />/<s:property value="id" />/<s:property value="fotos[1]" />" width="90" height="84"/>
							</a>
						</div>
						<div class="thumb">
							<a href="public/vendedores/<s:property value="idPersona" />/<s:property value="id" />/<s:property value="fotos[2]"/>" class="lightbox">
								<img src="public/vendedores/<s:property value="idPersona" />/<s:property value="id" />/<s:property value="fotos[2]"/>" width="471" height="260"/>
							</a>
						</div>
						<div class="thumb marRight">
							<a href="public/vendedores/<s:property value="idPersona" />/<s:property value="id" />/<s:property value="fotos[3]"/>" class="lightbox">
								<img src="public/vendedores/<s:property value="idPersona" />/<s:property value="id" />/<s:property value="fotos[3]"/>" width="471" height="260"/>
							</a>
						</div>
						<div class="thumb">
							<a href="public/vendedores/<s:property value="idPersona" />/<s:property value="id" />/<s:property value="fotos[4]"/>" class="lightbox">
								<img src="public/vendedores/<s:property value="idPersona" />/<s:property value="id" />/<s:property value="fotos[4]"/>" width="471" height="260"/>
							</a>
						</div>
						
						<div align="center">
						
						
							<s:if test="#session.tipoUsuario != 'VISITANTE'">
							
								<s:if test="#session.idUsuario != idPersona">
							
									<s:if test="#session.tipoUsuario != 'EXPERTO'">
							
				        				<form action="perfil" method="post">
											<input type="submit" value="Contactar con el vendedor" />
											<input type="hidden" name="id" value="<s:property value="idPersona" />" />
										</form>
									
									</s:if>
								
			        			</s:if>
			        			<s:else>
			        				<input type="button" value="Borrar Auto" />
			        			</s:else>
			        		
			        		</s:if>
			        		<s:else>
			        			<input type="button" value="Reg&iacute;strese y vea al Vendedor" onclick="$('#open').click();" />
			        		</s:else>
						
						</div>
			  			
			  			
			  			
			  			<div class="clr"></div>	
		  			
		  			</div>
			  			
				</div>
				<div class="detailInfo">
					<h2>Detalles del auto.</h2>
					<div style="font-size:14px;padding-top:10px;padding-left:20px;">
						Marca: <b><s:property value="marca" /></b><br />
						A&ntilde;o: <b><s:property value="anio" /></b><br />
						Kilometraje: <b><s:property value="km" /></b><br />
						No. de Cilindros: <b><s:property value="cilindros" /></b><br />
						Vendedor: 
						
						<s:iterator value="vendedor">

							<b><s:property value="nombre_vendedor" /></b>
						</s:iterator>
					</div>
				</div>
				<br></br>
				<div class="detailInfo">
					<h2>Comentario de Experto. &nbsp;&nbsp;
					
						<s:if test="#session.tipoUsuario == 'EXPERTO'">
					
							<a href="?lightbox[width]=500&lightbox[height]=200#registrarComentario" class="lightbox">[ Agregar ]</a>
						
						</s:if>
					
					</h2>
					<p>
						<b><s:property value="critica" /></b>	
					</p>
					<br></br>
					<p class="add">Haga clic en las im&aacute;genes para visualizarlas en su tama&ntilde;o original.</p>
				</div>
				<div class="clr"></div>
                <div class="paging">
                   <div class="pagingDiv price">$<s:property value="precio" /></div>
                    <!-- div class="pagingInfo"><img src="public/images/plus.gif" alt=""/><a href="?lightbox[width]=500&lightbox[height]=250#datosVendedor" class="lightbox">Contactar con el vendedor.</a></div -->
                <div class="clr"></div> 
                </div>
                           </div>    <!-- end div #RightSide-->

            <div class="clr"></div>     <!-- BEGIN FOOTER -->
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


<!-- Datos del vendedor ocultos -->
<div id="registrarComentario" class='center' style="display:none">
	<h2>Comentario de automovil.</h2>
	<p>Una vez que haya analizado las caracter&iacute;sticas del autom&oacute;vil, escriba una breve cr&iacute;tica.</p>
	<div style="margin-top:10px;">
		<form id="formRegistrarComentario" action="altaComentario" method="post">
			<textarea cols="95" rows="5" name="comentario"></textarea>
			<input type="hidden" name="id" value="<s:property value="id" />" />
			
			<div align="right" style="margin-top:10px;">
				<label for="categoria">Categoria: </label>
				<select name="categoria" id="categoria">
					<option value="nuevos">Nuevo</option>
					<option value="seminuevos">Seminuevo</option>
					<option value="importados">Importado</option>
					<option value="hibridos">Hibrido</option>
					<option value="americanos">Americano</option>
					<option value="europeos">Europeo</option>
					<option value="asiaticos">Asiatico</option>
				</select>
			
			</div>
			
			<div align="right" style="margin-top:10px;">
				<input type="submit" value="Publicar comentario"></input>
			</div>
		</form>
	</div>
</div>
<!-- Fin de formulario de registro de critica -->

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

</s:iterator>

<s:if test="#auto == null">

	<div style="margin-top:150px;" align="center">

		<h1>Este automovil ya no esta disponible.</h1>
		<br />
		<img src="public/images/no-car.jpg"></img>
	
	</div>
</s:if>


</body>
</html>
