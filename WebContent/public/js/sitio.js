function registrar(){
	
	if( $("#usuarioRegistro").val() != "" && $("#passwordRegistro").val() != "" && $("#passwordRegistroConf").val() != "" ){
		if( $("#passwordRegistro").val() == $("#passwordRegistroConf").val() ){
			if( $("#vendedor").attr("checked") ){
				$("#vendedor").val("true");	
			}
			$("#formRegistroPop").submit();
		}else{
			$("#mensajeAlerta").html("Las contrase&ntilde;as no coinciden...");
			$('#aviso').click();
		}
	}else{
		$("#mensajeAlerta").html("Rellene todos los campos por favor...");
		$('#aviso').click();
	}
}

function login(){
	
	if( $("#usuario").val() != "" && $("#password").val() != "" ){
		$("#formLogin").submit();
	}else{
		$("#mensajeAlerta").html("Rellene todos los campos por favor...");
		$('#aviso').click();
	}
}

function validaRegistroAuto(){

	if( $("#modelo").val() != "" && $("#precio").val() != "" && $("#km").val() != "" && $("#archivo1").val() != "" && $("#archivo2").val() != "" && $("#archivo3").val() != "" ){
		$("#formRegistrarAutomovil").submit();
	}else{
		$("#mensajeAlerta").html("Rellene todos los campos por favor, y especifique por lo menos 3 imagenes...");
		$('#aviso').click();
	}
	
}

function validaRegistroExperto(){

	if( $("#us").val() != "" && $("#pa").val() != "" && $("#em").val() != "" && $("#de").val() != "" && $("#ar").val() != "" ){
		$("#formRegistrarExperto").submit();
	}else{
		$("#mensajeAlerta").html("Rellene todos los campos por favor.");
		$('#aviso').click();
	}
}

function validaRegistroVendedor(){

	if( $("#us").val() != "" && $("#pa").val() != "" && $("#no").val() != "" && $("#de").val() != "" && $("#em").val() != "" && $("#web").val() != "" && $("#ar").val() != "" ){
		$("#formRegistrarVendedor").submit();
	}else{
		$("#mensajeAlerta").html("Rellene todos los campos por favor.");
		$('#aviso').click();
	}
	
}


$(document).ready(function(){
	$("input:checkbox, input:radio, input:text, input:password, input:file, textarea, submit").uniform();
	
	$('#aviso').click(function(e) {
		e.preventDefault();
		var id = $(this).attr('href');
		var maskHeight = $(document).height();
		var maskWidth = $(document).width();
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		$('#mask').fadeIn(1000);	
		$('#mask').fadeTo("slow",0.8);	
		var winH = $(window).height();
		var winW = $(window).width();
        $(id).css('top',  winH/2-$(id).height()/2);
		$(id).css('left', winW/2-$(id).width()/2);
		$(id).fadeIn(2000); 
	});
	
	$('.window .activar').click(function (e) {
		e.preventDefault();
		$('#mask').hide();
		$('.window').hide();
	});	
	
	$('.noactivar').click(function (e) {
		e.preventDefault();
		$('#mask').hide();
		$('.window').hide();
	});	
	
});