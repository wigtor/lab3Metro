<?php
	class linea {
		private $num_linea;
		private $id_color;
		private $color_linea;
		
		public function __construct($n) {
			$connect = mysql_connect("localhost","metro", "metro123");
			$db = mysql_select_db("metroSantiago", $connect);
			$this->num_linea = $n;
			$query = "SELECT id_color,nombre_color,cod_color FROM Linea,Color WHERE Linea.id_color_linea = Color.id_color and Linea.num_linea = '". $n ."'";
			$result = mysql_query($query);
			$fila = mysql_fetch_assoc($result);
			$this->id_color = $fila['id_color'];
			$this->color_linea = $fila['cod_color'];
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

		public static function getAllStationsWithLineas() {
			$connect = mysql_connect("localhost","metro", "metro123");
			$db = mysql_select_db("metroSantiago", $connect);
			
			$result = mysql_query("SELECT Linea.num_linea,Estacion.id_estacion,Estacion.nombre_estacion FROM Linea NATURAL JOIN Anden NATURAL JOIN Estacion WHERE Anden.via = '1'");
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
			$result = mysql_query("SELECT Estacion.* FROM Estacion NATURAL JOIN Anden NATURAL JOIN Linea WHERE Linea.num_linea = '".$this->num_linea."'");
			$i = 0;
			$matrix = NULL;
			while($fila = mysql_fetch_assoc($result)){
				$matrix[$i] = $fila;
				$i = $i + 1;
			}
			return $matrix;
		}
		
		public function construirLinea() {
			
			//Se obtienen el id del primer anden de la via = '1' de la linea que se está construyendo
			$result = mysql_query("SELECT Anden.id_anden,Estacion.* FROM Primer_anden_linea,Anden,Estacion WHERE Primer_anden_linea.id_anden = Anden.id_anden and Primer_anden_linea.num_linea = '".$this->num_linea."' and Anden.id_estacion = Estacion.id_estacion");
			$fila = mysql_fetch_assoc($result);
			$matrix = NULL;
			while($fila){
				echo '<div id="'.$fila['id_estacion'].'" class="estacion" >';
					$estacionDoble = mysql_query("SELECT * FROM Anden NATURAL JOIN Estacion NATURAL JOIN Linea WHERE via = '1' AND id_estacion = '" . $fila['id_estacion'] . "' GROUP BY id_estacion HAVING COUNT(*)>1");
					$numeroLineasPorEstacion = mysql_num_rows($estacionDoble);
					if ($numeroLineasPorEstacion) {
						echo '<div id="img_"'.$fila['id_estacion'].'" class="circle_estacion_combinacion" ></div>';
					}
					else {
						echo '<div id="img_"'.$fila['id_estacion'].'" class="circle_estacion" ></div>';
					}
					echo '<div id="txt_"'.$fila['id_estacion'].'" class="txt_estacion" >'.$fila['nombre_estacion'].'</div>';
				echo '</div>';
				$result = mysql_query("SELECT Tunel.*,Estacion.*,Anden.id_anden FROM Anden,Tunel,Estacion WHERE Anden.id_estacion = Estacion.id_estacion and Anden.id_anden = Tunel.id_anden_destino and Tunel.id_anden_origen = ".$fila['id_anden']."");
				$fila = mysql_fetch_assoc($result);
				if ($fila) {
					echo '<div class="tunel" style="background-color:'.$this->color_linea.';"> </div> ';
				}
			}
		}
	}
?>
