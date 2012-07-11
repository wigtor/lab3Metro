<?php
	class Controller {
		
		public function __construct($n) {
			$connect = mysql_connect("localhost","metro", "metro123");
			$db = mysql_select_db("metroSantiago", $connect);
		}
		
		public static function getAllColors() {
			$connect = mysql_connect("localhost","metro", "metro123");
			$db = mysql_select_db("metroSantiago", $connect);
			
			$result = mysql_query("SELECT * FROM Color");
			$matrix = NULL;
			$i = 0;
			while($fila = mysql_fetch_assoc($result)){
				$matrix[$i] = $fila;
				$i = $i + 1;
			}
			return $matrix;
		}
		public static function getAllTermEstations() {
			$connect = mysql_connect("localhost","metro", "metro123");
			$db = mysql_select_db("metroSantiago", $connect);
			
			$result = mysql_query("SELECT * FROM Primer_anden_linea NATURAL JOIN Anden NATURAL JOIN Estacion");
			$matrix = NULL;
			$i = 0;
			while($fila = mysql_fetch_assoc($result)){
				$matrix[$i] = $fila;
				$i = $i + 1;
			}
			return $matrix;
		}
	}
?>
