<?php
	if( isset($_POST['tm_op']) ) {
		$option = $_POST['tm_op'];
		
		if( $option == '1' && isset($_POST['num_linea']) && isset($_POST['id_color']) && isset($_POST['estaciones']) ){ //Opción para insertar una nueva linea y sus estaciones
			$connect = mysql_connect("localhost","metro", "metro123");
			$db = mysql_select_db("metroSantiago", $connect);
			$estaciones = json_decode($_POST['estaciones']); //Un arreglo de estaciones
			$numLinea = $_POST['num_linea'];
			$id_color = $_POST['id_color'];
			$queryLinea = mysql_query("INSERT INTO Linea(num_linea, id_color_linea) VALUES ( '$numLinea', '$id_color')");
			if ($queryLinea == FALSE) { //Compruebo si hubo un error, como por ejemplo si está repetido el número de linea
				echo 'false';
				return ;
			}
			
			$id_primerAnden = 0; $id_UltimoAnden = 0;
			$primer = true;
			$i = 0;
			while($i < sizeof($estaciones)) {
				//Compruebo si la estación existe para hacerla combinación
				$query = mysql_query("SELECT id_estacion FROM Estacion WHERE nombre_estacion = '" .$estaciones[$i]. "'");
				if ($row = mysql_fetch_row($query)) {
					$id_ultima_estacion = $row[0];
				}
				else {
					$ruta = 3; //Estática por ahora
					$queryEstacion = mysql_query("INSERT INTO Estacion(nombre_estacion, id_ruta) VALUES ('" .$estaciones[$i]. "', '$ruta')");
					$id_ultima_estacion = mysql_insert_id($connect);//SE OBTIENE EL ID DE LA ULTIMA ESTACIÓN INSERTADA
				}
				
				//Inserto los dos andenes de la nueva estación
				$queryAnden = mysql_query("INSERT INTO Anden(via, id_estacion, num_linea) VALUES ('1', '$id_ultima_estacion', '$numLinea')");
				$id_anden1 = mysql_insert_id($connect); //Se guarda el id del último anden insertado
				if ($primer) {
					$id_primerAnden = $id_anden1;
					$primer = false;
				}
				else {
					//Agrego los tuneles que unen las estaciones
					$queryTunel = mysql_query("INSERT INTO Tunel(id_anden_origen, id_anden_destino) VALUES ('$id_anden_anterior', '$id_anden1')");
				}
				$id_anden_anterior = $id_anden1;
				
				$queryAnden = mysql_query("INSERT INTO Anden(via, id_estacion, num_linea) VALUES ('2', '$id_ultima_estacion', '$numLinea')");
				$id_anden2 = mysql_insert_id($connect); //Se guarda el id del último anden insertado
				$id_UltimoAnden = $id_anden2;
				
				
				$i = $i + 1;
			}
			//Agrego los 'punteros' a los andenes del extremo de la linea
			$queryExtremo1 = mysql_query("INSERT INTO Primer_anden_linea(num_linea, id_anden) VALUES ('$numLinea', '$id_primerAnden')");
			$queryExtremo2 = mysql_query("INSERT INTO Primer_anden_linea(num_linea, id_anden) VALUES ('$numLinea', '$id_UltimoAnden')");
			
			echo 'Realizado';
		}
		
		if( $option == '2' && isset($_POST['num_linea']) ){ //Opción para eliminar una linea
			$connect = mysql_connect("localhost","metro", "metro123");
			$db = mysql_select_db("metroSantiago", $connect);
			$numLinea = $_POST['num_linea'];
			
			//Borro los tuneles de la linea
			$query = mysql_query("SELECT id_anden FROM Primer_anden_linea NATURAL JOIN Anden WHERE via = '1' AND num_linea = '$numLinea'");
			while($row = mysql_fetch_row($query)) {
				$id_anden = $row[0];
				$query = mysql_query("SELECT id_anden_destino AS id_anden FROM Tunel WHERE id_anden_origen = '$id_anden'");
				$queryDeleteTunel = mysql_query("DELETE FROM Tunel WHERE id_anden_origen = '$id_anden'");
				
			}
			
			//Borro los primeros andenes de la linea
			$queryDeleteExtremos = mysql_query("DELETE FROM Primer_anden_linea WHERE num_linea = '$numLinea'");
			
			
			
			//Borro las estaciones de la linea, antes selecciono las estaciones que SOLO pertenecen a la linea que se va a borrar
			$queryTemp = mysql_query("SELECT id_estacion FROM Anden WHERE via = '1' AND num_linea = '$numLinea' AND (id_estacion) NOT IN (SELECT id_estacion FROM Anden NATURAL JOIN Estacion NATURAL JOIN Linea WHERE via = '1' GROUP BY id_estacion HAVING COUNT(*)>1)");
			//Borro los andenes de la linea
			$query = mysql_query("DELETE FROM Anden WHERE num_linea = '$numLinea'");
			while($row = mysql_fetch_row($queryTemp)) {
				$id_estacion = $row[0];
				$queryDeleteEstacion = mysql_query("DELETE FROM Estacion WHERE id_estacion = '$id_estacion'");
			}
			
			
			//Borro la linea
			$query = mysql_query("DELETE FROM Linea WHERE num_linea = '$numLinea'");
			echo 'Realizado';
		}
		
		if ( $option == '3' ){ //Opción para devolver las lineas
			$connect = mysql_connect("localhost","metro", "metro123");
			$db = mysql_select_db("metroSantiago", $connect);
			$result = mysql_query("SELECT * FROM Linea");
			$matrix = NULL;
			$i = 0;
			while($fila = mysql_fetch_assoc($result)){
				$matrix[$i] = $fila;
				$i = $i + 1;
			}
			echo json_encode($matrix);
		}
		if ( $option == '4' ){ //Opción para devolver las estaciones terminales
			$connect = mysql_connect("localhost","metro", "metro123");
			$db = mysql_select_db("metroSantiago", $connect);
			$result = mysql_query("SELECT * FROM Primer_anden_linea NATURAL JOIN Anden NATURAL JOIN Estacion");
			$matrix = NULL;
			$i = 0;
			while($fila = mysql_fetch_assoc($result)){
				$matrix[$i] = $fila;
				$i = $i + 1;
			}
			echo json_encode($matrix);
		}
		
	}
	
?>