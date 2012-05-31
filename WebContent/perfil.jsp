<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Perfil de Usuario</title>

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
      
      
    </div>
    <!-- end div #LeftSide -->
    
    
    <div class="RightSide">
    	
    	<div class="detailInfo" style="margin-bottom:20px;">
    	
    	
    		
    	
			<s:iterator value="usuario">
			
				<s:if test="tipo == 'VENDEDOR'">
			
					<h2><s:property value="nombre_vendedor" /></h2>
					<p style="text-align: justify; text-justify: newspaper"><s:property value="descripcion" /></p>
		
					<br />
					
					<div align="center">
						<h3>Tel:</h3> 55 34 34 23 45 <br /><br />
						<h3>e-mail:</h3> <s:property value="email" /><br /><br />
						<h3>Pagina Web:</h3> <b><a href="<s:property value="web" />" target="_new"><s:property value="web" /></a></b><br /><br />
						<img src="public/vendedores/<s:property value="id" />/<s:property value="foto" />" alt="Vendedor" style="max-width:680px;" />
					</div>
				
				</s:if>
				<s:else>
					
						<div style="float:left;">
							<img src="public/images/usuario.png" alt="Usuario" style="max-width:200px;" />
						</div>
						<div style="float:left;">
							<h3>Nombre de usuario:</h3><b> <s:property value="email" /> </b><br /><br />
						</div>
						
						<div class="clr"></div>
					
				</s:else>
				
				
				<s:if test="tipo == 'ADMIN'">
				
					<div style="margin-top:20px;">
						
						<table width="100%" border="1" style="margin-top:20px; margin-bottom:20px;">
						
							<thead>
								<tr>
									<th width="70%">Vendedor</th>
									<th width="30%">Visitas registradas</th>
								</tr>
							</thead>
						
							<s:iterator value="detalleVendedores" >
								<tr>
									<td align="center" style="padding-top:3px;padding-bottom:3px;"><h3><s:property value="nombre_vendedor" /></h3></td>
									<td align="center"><h3><s:property value="visitasVendedor" /></h3></td>
								</tr>
							</s:iterator>
						
						</table>
						
						<!-- h2>Ganancias obtenidas por los vendedores: $ </h2 -->
						
					</div>
						
				
				</s:if>
				
			</s:iterator>
    	
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
</body>
</html>
