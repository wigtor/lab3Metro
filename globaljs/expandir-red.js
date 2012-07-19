var arregloEstaciones = new Array();
var arregloLineas = new Array();
var arregloEstacionesTerminales = new Array();

function listarLineas() {
	$.ajax({
		url: "principalBus.php",
		type: "POST",
		data: "tm_op=3",
		async: false,
		success: function(data){
			arregloLineas = $.parseJSON(data);
			var listaLineas = document.getElementById('selectLineaForStation');
			for (var i = 0; i < arregloLineas.length; i++) {
				listaLineas.innerHTML = listaLineas.innerHTML + '<option id="selectLinea_' + arregloLineas[i]['num_linea'] +'" value="'+ arregloLineas[i]['num_linea'] +'" >L'+ arregloLineas[i]['num_linea'] +'</option>';
			}
		}
	});
}

function traerEstacionesTerminales() {
	$.ajax({
		url: "principalBus.php",
		type: "POST",
		data: "tm_op=4",
		async: false,
		success: function(data){
			//alert(data);
			arregloEstacionesTerminales = $.parseJSON(data);
			var selectTerminales = document.getElementById('estacionTerminal');
			var selectLineas = document.getElementById('selectLineaForStation');
			//alert(selectLineas.value);
			var temp;
			var k = 0;
			for (var i = 0; i < arregloEstacionesTerminales.length; i++) {
				temp = selectLineas.value;
				//alert(temp);
				if (parseInt(arregloEstacionesTerminales[i]['num_linea']) == parseInt(temp)) {
					selectTerminales.innerHTML = selectTerminales.innerHTML + '<option id="selectLinea_' + arregloEstacionesTerminales[i]['id_anden'] +'" value="'+ arregloEstacionesTerminales[i]['id_anden'] +'" >'+ arregloEstacionesTerminales[i]['nombre_estacion'] +'</option>';
					k++;
				}
			}
			//alert(k);
		}
	});
}

function cambiarEstacionesTerminales() {
	
	var selectTerminales = document.getElementById('estacionTerminal');
	var selectLineas = document.getElementById('selectLineaForStation');
	selectTerminales.innerHTML = '';
	//alert(selectLineas.value);
	var temp;
	var k = 0;
	for (var i = 0; i < arregloEstacionesTerminales.length; i++) {
		temp = selectLineas.value;
		if (parseInt(arregloEstacionesTerminales[i]['num_linea']) == parseInt(temp)) {
			selectTerminales.innerHTML = selectTerminales.innerHTML + '<option id="selectLinea_' + arregloEstacionesTerminales[i]['id_anden'] +'">'+ arregloEstacionesTerminales[i]['nombre_estacion'] +'</option>';
			k++;
		}
	}
}


function agregarEstacion() {
	var nombreEstacionStr = document.getElementById('text_nombreEstacion2');
	
	if (nombreEstacionStr.value == '') {
		alert('Debe introducir un nombre de estación');
		return;
	}
	var selectEstacionTerminal = document.getElementById('estacionTerminal');
	var selectLinea = document.getElementById('selectLineaForStation');
	var numLinea = selectLinea.value;
	var id_anden = selectEstacionTerminal.value;
	//alert('num_linea='+numLinea + '&id_anden='+id_anden + '&nombre_estacion='+nombreEstacionStr.value);
	$.ajax({
		url: "principalBus.php",
		type: "POST",
		data: "tm_op=5&num_linea="+numLinea + "&id_anden="+id_anden + "&nombre_estacion="+nombreEstacionStr.value,
		async: false,
		success: function(data){
			
			alert(data);
			
		}
	});
}

function agregarEstacionToList() {
	var nombreEstacion = document.getElementById('text_nombreEstacion');
	if (nombreEstacion.value == '') {
		alert('Nombre de estación vacío');
		return;
	}
	var nombreEstacionStr = nombreEstacion.value;
	var temp = '';
	for (var i = 0; i < nombreEstacionStr.length; i++) {
		if (nombreEstacionStr[i] == '\'')
			temp = temp + '\\\'';
		else 
			temp = temp + nombreEstacionStr[i];
	}
	arregloEstaciones[arregloEstaciones.length] = temp;
	
	var listaLineas = document.getElementById('listaLineas');
	listaLineas.innerHTML = listaLineas.innerHTML + '<option id="" >' + nombreEstacion.value + '</option>';
	nombreEstacion.value = '';
}


function agregarLinea() {
	var numeroLinea = document.getElementById('text_numStation');
	if (numeroLinea.value == '') {
		alert('Número de linea vacío');
		return ;
	}
	if (validarNumero(numeroLinea.value) == "NaN") {
		alert('No ha introducido un número de linea válido');
		return ;
	}
	if (arregloEstaciones.length < 2) {
		alert('Una nueva linea debe tener al menos dos estaciones');
		return ;
	}
	var selectColor = document.getElementById('selectColorForStation');
	
	var estaciones =  $.toJSON(arregloEstaciones);
	
	$.ajax({
		url: "principalBus.php",
		type: "POST",
		data: "tm_op=1&num_linea="+numeroLinea.value + "&id_color="+selectColor.value + "&estaciones="+estaciones,
		success: function(data){
			if (data == 'false') {
				alert('ERROR: Número de linea ya existe');
				return ;
			}
			alert(data);
			
			//Borro la lista de estaciones a agregar
			arregloEstaciones = new Array();
			var listaLineas = document.getElementById('listaLineas');
			listaLineas.innerHTML = '';
		}
	});
}


function validarNumero(c_numero)
{
   //chequeo la longitud de c_numero:
   // Si (c_numero.length es igual a Cero) quiere decir que c_numero es una cadena Vacía.
   // Si (c_numero.length es distinto(mayor) de Cero) podemos asegurar que c_numero contiene por lo menos una letra
   //a la cual se le puede hacer la validación
   if (c_numero.length == 0)
   {
       return "NaN";
   }
   else
   {
       //Se recorre c_numero por todos sus caracteres chequeando que todos sean dígitos
       //la condición >="0" y <="9" es basada en el valor ascii que tienen los números en la tabla ascii.
       //Si alguno de los caracteres no es un número la función retornará un NaN
       //Si no retornará el Número
       for (i = 0; i < c_numero.length; i++)
       {
          if (!((c_numero.charAt(i) >= "0") && (c_numero.charAt(i) <= "9")))
          return "NaN";
       }
       return c_numero;
   }
} 