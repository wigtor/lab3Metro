<?php
//Obtengo las lineas y las estaciones existentes
	require_once("linea.php");
	$arrayEstaciones = Linea::getAllStationsWithLineas();
	$arrayLineas = Linea::getAllLineas();
	require_once("controller.php");
	$arrayColoresDisp = Controller::getAllColors();
	
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
			<div class="filaSeccion" >Número de la estación:
				<input type="text" id="text_numStation" >
			</div>
			<br>
			<div class="filaSeccion" > Seleccione color
				<select id="selectColorForStation">
					<?php
						$i = 0;
						while ($i < sizeof($arrayColoresDisp)) {
							echo '<option id="color_' .$arrayColoresDisp[$i]['id_color']. '">' .$arrayColoresDisp[$i]['nombre_color']. '</option>';
							$i = $i + 1;
						}
					?>
				</select>
			</div>
			<div class="filaSeccion" >
				<button><b>Agregar linea</b><img src="globalimg/btn_add.png" width="25" height="25"></button>
			</div>
			<div class="filaSeccion" style="height:30%;">
				<select name="listaLineas" id="listaLineas" size="10" multiple="multiple" style="width:70%;">
					<?php
						$i = 0;
						while ($i < sizeof($arrayLineas)) {
							echo '<option id="linea_' .$arrayLineas[$i]['num_linea']. '">L' .$arrayLineas[$i]['num_linea']. '</option>';
							$i = $i + 1;
						}
					?>
				</select>
			</div>
		</div>
		
		
		<div class="colAdd" >
			<div class="filaSeccion" >
				<div class="titulo_colAdd" >Agregar estaciones</div>
			</div>
			<div class="filaSeccion" >Nombre de la estación:
				<input type="text" id="text_nombreEstacion" >
			</div>
			<br>
			<div class="filaSeccion" > Seleccione linea
				<select id="selectLineaForStation">
					<?php
						$i = 0;
						while ($i < sizeof($arrayLineas)) {
							echo '<option id="selectLinea_' .$arrayLineas[$i]['num_linea']. '">L' .$arrayLineas[$i]['num_linea']. '</option>';
							$i = $i + 1;
						}
					?>
				</select>
			</div>
			<div class="filaSeccion" >
				<button><b>Agregar estación</b><img src="globalimg/btn_add.png" width="25" height="25"></button>
			</div>
			<div class="filaSeccion" style="height:30%;">
				<select name="listaLineas" id="listaLineas" size="10" multiple="multiple" style="width:70%;">
					<?php
						$i = 0;
						while ($i < sizeof($arrayEstaciones)) {
							echo '<option id="' .$arrayEstaciones[$i]['num_linea']. '">L' .$arrayEstaciones[$i]['num_linea']. ' - ' .$arrayEstaciones[$i]['nombre_estacion']. '</option>';
							$i = $i + 1;
						}
					?>
				</select>
			</div>
		</div>
		
	</div>
	</body>
</html>
