<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
	<head>
		<title>Control de Metro</title>
				<!-- Meta -->
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="shortcut icon" type="image/x-icon" href="globalimg/icon.png">		

		<!-- Css -->
		<link href="css/metroUI.less" rel="stylesheet/less"/>

		<!-- Script Funcional -->
		<script type="text/javascript" src="globaljs/jquery-1.7.1.min.js"></script>

		<!-- Script Cosmetico -->
		<script type="text/javascript" src="css/js/less-1.3.0.min.js"></script>
		
	</head>
	
	<body id="main_body">
		<!-- Cabecera -->
	<div class="head">
		<div class="titulo">
			<div class="txt_titulo" >
				<b>Control de Metro</b>
			</div>
			<div class="img_titulo">
				<img src="globalimg/logo_principal.png" />
			</div>
		</div>
		<div id="menu_principal" class="menu">
			<div class="elemMenu" onclick="window.location='index.php'">Monitorización</div>
			<div class="elemMenu" onclick="window.location='asignacion_trenes.php'">Asignacion de trenes</div>
			<div class="elemMenu" onclick="window.location='asignacion_conductores.php'">Asignación de conductores</div>
			<div class="elemMenu" onclick="window.location='expandir-red.php'">Expandir la red</div>
			<div class="elemMenu" onclick="window.location='acercaDe.html'">Acerca de...</div>
		</div>
	</div>

	<!-- Contenido -->
	<div id = "bodyMonitorización" class="wrapp" border="0">
		<div class="texto" >Lineas del sistema de metro</div>
		<div class="mapa" id="mapaCentral">
			<?php
				require_once("linea.php");
				$arrayLineas = Linea::getAllLineas();
				$i = 0;
				while($i < sizeof($arrayLineas)) {
					echo '<div class="texto" ><b>L'.$arrayLineas[$i]['num_linea'].'</b> <input type="button" value="Eliminar linea" onclick="eliminarLinea('.$arrayLineas[$i]['num_linea'].')"/> </div>';
					$controladorLineas = new Linea($arrayLineas[$i]['num_linea']);
					echo '<div id="L'. $arrayLineas[$i]['num_linea'] .'" class="linea">';
					$estaciones = $controladorLineas->construirLinea();
					echo '</div>';
					$i = $i+1;
				}
				
				
			?>
			
		</div>
		
	</div>
	</body>
	<script type="text/javascript">
		function eliminarLinea(num) {
			if (confirm("¿Seguro que desea borrar la linea N°"+num+"?")) {
				$.ajax({
					url: "principalBus.php",
					type: "POST",
					data: "tm_op=2&num_linea="+num,
					success: function(data){
						alert(data);
						location.reload();
					}
				});
			}
		}
		
		$(function(){
				var arregloLineas;
				var arregloTrenes;
				$.ajax({
					url: "principalBus.php",
					type: "POST",
					data: "tm_op=3",
					async: false,
					success: function(data){
						arregloLineas = $.parseJSON(data);
						var i;
						var divLinea;
						var cantidadNodos;
						var maximo = 0;
						for (i = 0; i < 1; i++) {
							divLinea = document.getElementById('L'+arregloLineas[i]['num_linea']);
							cantidadNodos = divLinea.childNodes.length;
							if (maximo < cantidadNodos) {
								maximo = cantidadNodos;
							}
							//alert('linea:' + arregloLineas[i]['num_linea'] + ' cantidadNodos:' +cantidadNodos + ' width:'+divLinea.style.width);
						}
						document.getElementById('mapaCentral').style.width = (35*(cantidadNodos) + 40)+'px';
					}
				});
				
				//Muestro los trenes en las lineas
				$.ajax({
					url: "principalBus.php",
					type: "POST",
					data: "tm_op=6",
					async: false,
					success: function(data){
						//alert(data);
						arregloTrenes = $.parseJSON(data);
						var i;
						var trenTemp;
						var numConvoy;
						var id_estacion;
						var divDePegado;
						for (i = 0; i < arregloTrenes.length; i++) {
							trenTemp = arregloTrenes[i];
							numConvoy = trenTemp['num_convoy'];
							id_estacion = trenTemp['id_estacion'];
							if (trenTemp['nombre_estado_tren'] == 'En anden') {
								divDePegado = document.getElementById('estacion_' + id_estacion);
								var imagenTren = document.createElement('div');
								imagenTren.id = 'tren_'+numConvoy;
								if (trenTemp['via'] == '1') {
									imagenTren.className = 'tren';
									$(imagenTren).css('top', '-120px');
									$(imagenTren).css('left', '10px');
								}
								else {
									imagenTren.className = 'tren';
									$(imagenTren).css('top', '-80px');
									$(imagenTren).css('left', '10px');
								}
								imagenTren.innerHTML = ''+numConvoy;
								//$(imagenTren).hide();
								$(divDePegado).append(imagenTren);
							}
							if (trenTemp['nombre_estado_tren'] == 'En tunel') {
								divDePegado = document.getElementById('tunel_' + id_estacion);
								
								var imagenTren = document.createElement('div');
								imagenTren.id = 'tren_'+numConvoy;
								if (trenTemp['via'] == '1') {
									imagenTren.className = 'tren';
									$(imagenTren).css('top', '-20px');
									$(imagenTren).css('left', '20px');
								}
								else {
									imagenTren.className = 'tren';
									$(imagenTren).css('top', '20px');
									$(imagenTren).css('left', '20px');
								}
								imagenTren.innerHTML = ''+numConvoy;
								//$(imagenTren).hide();
								$(divDePegado).append(imagenTren);
							}
						}
						
					}
				});
				
				//Recargo la página con la posición de los trenes cada 10 segundos
				setTimeout("location.reload()", 5000);
		});
	</script>	
</html>
