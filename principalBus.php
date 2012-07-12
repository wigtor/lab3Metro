<?php
	if( isset($_POST['tm_op']) ) {
		$option = $_POST['tm_op'];
		
		if( $option == '1' && isset($_POST['num_linea']) && isset($_POST['id_color']) && isset($_POST['estaciones']) ){ //Opción para enviar datos de la tabla.
			$connect = mysql_connect("localhost","metro", "metro123");
			$db = mysql_select_db("metroSantiago", $connect);
			
			
			echo 'bien';
		}
	}
?>