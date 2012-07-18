<?php
//Obtengo las lineas y las estaciones existentes
	require_once("linea.php");
	$arrayEstaciones = Linea::getAllStationsWithLineas();
	$arrayLineas = Linea::getAllLineas();
	require_once("controller.php");
	$arrayColoresDisp = Controller::getAllColors();
	$arrayEstacionesTerm = Controller::getAllTermEstations();
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
	<head>
		<title>Control de Metro</title>
				<!-- Meta -->
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="shortcut icon" type="image/x-icon" href="globalimg/icon.png">		

		<!-- Css -->
		<link href="css/expandir-red.less" rel="stylesheet/less"/>

		<!-- Script Funcional -->
		<script type="text/javascript" src="globaljs/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="globaljs/jquery.json.js"></script>

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
	<div id = "bodyMonitorización" class="wrapp">
		<div class="colAdd" >
			<div class="filaSeccion" >
				<div class="titulo_colAdd" >Agregar lineas</div>
			</div>
			<div class="filaSeccion" >Número de la linea:
				<input type="text" id="text_numStation" >
			</div>
			<div class="filaSeccion" > Seleccione color
				<select id="selectColorForStation">
					<?php
						$i = 0;
						while ($i < sizeof($arrayColoresDisp)) {
							echo '<option value="' .$arrayColoresDisp[$i]['id_color']. '" id="color_' .$arrayColoresDisp[$i]['id_color']. '">' .$arrayColoresDisp[$i]['nombre_color']. '</option>';
							$i = $i + 1;
						}
					?>
				</select>
			</div>
			<SPAN title="Debe agregar al menos 2 estaciones a la nueva linea y en el orden en que estas estarán">
			<div class="filaSeccion" ><b>Agregue estaciones a la nueva linea:</b></div>
			<div class="filaSeccion" >Nombre Estación:
					<input type="text" id="text_nombreEstacion" >
			</div>
			<div class="filaSeccion" >
				<input type="button" value="Agregar estacion" onclick="agregarEstacionToList()"/>
			</div>
			
			<div class="filaSeccion" style="height:30%;">
				<select name="listaLineas" id="listaLineas" size="10" multiple="multiple" style="width:70%;">
					
				</select>
			</div>
			<div class="filaSeccion" >
				<input type="button" value="Agregar linea" onclick="agregarLinea()"/>
			</div>
			</SPAN>
		</div>
		
		
		<div class="colAdd" >
			<div class="filaSeccion" >
				<div class="titulo_colAdd" >Agregar estaciones</div>
			</div>
			
			<div class="filaSeccion" >Nombre de la estación:

				<div><input type="text" id="text_nombreEstacion2" ></div>
			</div>
			<div class="filaSeccion" > Seleccione linea
				<select id="selectLineaForStation" onChange="cambiarEstacionesTerminales()">
					
				</select>
			</div>
			<div class="filaSeccion" > Después de la estación:
				<select id="estacionTerminal">
					
				</select>
			</div>
			<div class="filaSeccion" >
				<input type="button" id="btn_agregarEstacion" onclick="agregarEstacion()" value="Agregar estación">
			</div>
			
		</div>
		<script type="text/javascript" src="globaljs/expandir-red.js"></script>
		
		<script type="text/javascript">
			$(function(){
				listarLineas();
				traerEstacionesTerminales();
			});  
		</script>
	</div>
	</body>
</html>
