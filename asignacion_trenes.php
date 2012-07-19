<?php
//Obtengo las lineas y las estaciones existentes
	require_once("linea.php");
	$arrayEstaciones = Linea::getAllStationsWithLineas();
	$arrayLineas = Linea::getAllLineas();
	require_once("controller.php");
	$arrayColoresDisp = Controller::getAllColors();
	$arrayEstacionesTerm = Controller::getAllTermEstations();
	$arrayTrenes = Controller::getAllTrenes();
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
			<div class="elemMenu" onclick="window.location='crear_tren.php'">Creacion de trenes</div>			
			<div class="elemMenu" onclick="window.location='acercaDe.html'">Acerca de...</div>
			
		</div>
	</div>

	<!-- Contenido -->
	<div id = "bodyMonitorización" class="wrapp">
		
			<div class="filaSeccion" >
				<div class="titulo_colAdd" > Asignar trenes</div>
			</div>
			<div class="filaSeccion" >Seleccione tren:
				<select id="selectTren">
					<?php
						$i = 0;
						while ($i < sizeof($arrayTrenes)) {
							echo '<option value="' .$arrayTrenes[$i]['id_tren']. '">Tren' .$arrayTrenes[$i]['id_tren']. ' </option>';
							$i = $i + 1;
						}
					?>
				</select>
			</div>
						
			
			<div class="filaSeccion" >Seleccione linea:
				<select id="selectLinea">
					<?php
						$i = 0;
						while ($i < sizeof($arrayLineas)) {
							echo '<option value="' .$arrayLineas[$i]['num_linea']. '">L' .$arrayLineas[$i]['num_linea']. ' </option>';
							$i = $i + 1;
						}
					?>
				</select>
			</div>
			
			<div class="filaSeccion" >
				<input type="button" value="Asignar Tren a linea" onclick="agregarLinea()"/>
			</div>	
			
		
		
		
		
		<script type="text/javascript" src="globaljs/expandir-red.js"></script>
	</div>
	</body>
</html>
