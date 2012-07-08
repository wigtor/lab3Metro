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
			<div class="elemMenu" >Monitorización</div>
			<div class="elemMenu" >Asignacion de trenes</div>
			<div class="elemMenu" >Asignación de conductores</div>
			<div class="elemMenu" >Acerca de...</div>
		</div>
	</div>

	<!-- Contenido -->
	<div id = "body" class="wrapp" border="0">
		<div class="texto" >Hola mundo CTM!!! </div>
		<div class="mapa" >
			<?php
				require_once("linea.php");
				$arrayLineas = Linea::getAllLineas();
				$i = 0;
				while($i < sizeof($arrayLineas)) {
					$controladorLineas = new Linea($arrayLineas[$i]['num_linea']);
					echo '<div id="'. $arrayLineas[$i]['num_linea'] .'" class="linea">';
					$estaciones = $controladorLineas->construirLinea();
					echo '</div>';
					$i = $i+1;
				}
				
				
			?>
			
		</div>
		
	</div>
	</body>
</html>
