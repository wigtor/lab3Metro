
<?php
	class linea {
		private $num_linea;
		private $id_color;
		private $color_linea;
		
		public function __construct($n) {
			$connect = mysql_connect("localhost","metro", "metro123");
			$db = mysql_select_db("metroSantiago", $connect);
			$num_linea = $n;
			$query = "SELECT id_color,nombre_color FROM Linea,Color WHERE Linea.id_color_linea = Color.id_color";
			$result = mysql_query($query);
			$fila = mysql_fetch_assoc($result);
			$id_color = $fila['id_color'];
			$color_linea = $fila['nombre_color'];
		}
		
		public static function getAllLineas() {
			$connect = mysql_connect("localhost","metro", "metro123");
			$db = mysql_select_db("metroSantiago", $connect);
			
			$result = mysql_query("SELECT * FROM Linea");
			$matrix = NULL;
			$i = 0;
			while($fila = mysql_fetch_assoc($result)){
				$matrix[$i] = $fila;
				$i = $i + 1;
			}
			return $matrix;
		}
		
		public function getEstaciones() {
			$connect = mysql_connect("localhost","metro", "metro123");
			$db = mysql_select_db("metroSantiago", $connect);
			$result = mysql_query("SELECT Estacion.* FROM Estacion NATURAL JOIN Anden NATURAL JOIN Linea WHERE Linea.num_linea = '$num_linea'");
			$i = 0;
			$matrix = NULL;
			while($fila = mysql_fetch_assoc($result)){
				$matrix[$i] = $fila;
				$i = $i + 1;
			}
			return $matrix;
		}
		
		public function construirLinea() {
			echo '<div class="estacion" >   </div> ';
			echo '<div class="tunel" >   </div> ';
			echo '<div class="estacion" >   </div> ';
			echo '<div class="tunel" >   </div> ';
			echo '<div class="estacion" >   </div> ';
			echo '<div class="tunel" > </div> ';
			echo '<div class="estacion" >   </div> ';
			echo '<div class="tunel" >   </div> ';
		}
	}
?>
