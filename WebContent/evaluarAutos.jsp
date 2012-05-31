<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Evaluar Autos</title>

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
	
	<s:if test="accion == 'comentado'">
	
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
    <!-- end div #TopContent -->
    <div id="Nav">
      <div class="NavBody">
        <ul>
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
  
  	
    
    
    <div class="RightSide" style="width:850px;">
      
      <div class="bredCrum" style="margin-bottom:38px;">
        <h4>Autos asignados sin comentarios...</h4>
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
		            			<img src="public/vendedores/<s:property value="idPersona"/>/<s:property value="id"/>/<s:property value="fotos[#auto.index]"/>" alt="" width="204" height="186" />
		            		</div>
		            		<div class="catDetail">
		              			<h4><s:property value="modelo"/></h4>
		              			
		              			
		              				<div align="center" style="padding-top:3px;">
		              					<a href="automovil?id=<s:property value="id"/>">
				              				<input type="button" value="Evaluar" />
		              					</a>
		              				</div>
		              			
		              			
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
      		
      		<h1>Comentario asignado al auto correctamente...</h1>
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
