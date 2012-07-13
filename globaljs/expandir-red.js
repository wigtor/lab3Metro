var arregloEstaciones = new Array();

function agregarEstacionToList() {
	var nombreEstacion = document.getElementById('text_nombreEstacion');
	if (nombreEstacion.value == '') {
		alert('Nombre de estación vacío');
		return;
	}
	arregloEstaciones[arregloEstaciones.length] = nombreEstacion.value;
	
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
				alert(data);
				arregloEstaciones = new Array();
			}
		});
	
}

//Función para editar un timer.
function go_to_edit(parametro1){
    window.location = "edit_timers.php?id="+parametro1;
}

//Función para eliminar un timer.
function delete_timer(parametro){
	if(confirm('¿Está seguro de que desea eliminar el timer?')) {
		$.ajax({
			url: "../../../../sys/busses/timerBus.php",
			type: "POST",
			data: "tm_op=3&ident="+parametro.id,
			success: function(data){
			//var tmp = "#container_" + parametro.id;
			var tmp = "#container_" + parametro.id;
			$(tmp).slideUp(800);
			}
		});
	}
}	

//Función que cambia el "activated" en la base de datos al presionar el botón.
function boton(parametro){
    if(parametro.checked == true){
                        $("label[for='" + parametro.id + "']").text("Activado");                       
                    }
                    else{
                        $("label[for='" + parametro.id + "']").text("Desactivado");                     
                    }
    $.ajax({
        url: "../../../../sys/busses/timerBus.php",
        type: "POST",
        data: "tm_op=2&ident="+parametro.id,
        success: function(data){}
    });
}

function cargarTimers() {
	$.ajax({
		url: "../../../../sys/busses/timerBus.php",
		type: "POST",
		data: "tm_op=1&user="+u_hashed,
		success: function(data){                        
			var div = document.getElementById('div1');
			//alert(data);
			var conversion = $.parseJSON(data);
			
			var i, temporal,label;           
			for(i = 0; i < conversion.length ; i++){ //Conversion.length es la cantidad de filas que tiene la tabla.                                                                
				if(conversion[i]['Mon'] == '1'){var dia1 = "Lun";}  else{ var dia1 =" ";}
				if(conversion[i]['Tue'] == '1'){var dia2 = "Mar";}  else{ var dia2 =" ";}
				if(conversion[i]['Wed'] == '1'){var dia3 = "Mie";}  else{ var dia3 =" ";}
				if(conversion[i]['Thu'] == '1'){var dia4 = "Jue";}  else{ var dia4 =" ";}
				if(conversion[i]['Fri'] == '1'){var dia5 = "Vie";}  else{ var dia5 =" ";}
				if(conversion[i]['Sat'] == '1'){var dia6 = "Sab";}  else{ var dia6 =" ";}
				if(conversion[i]['Sun'] == '1'){var dia7 = "Dom";}  else{ var dia7 =" ";}                             
				if(conversion[i]['activated'] == '1'){                                
					temporal = "checked = 'true'";
					label = "Activado";
				}
				else{
					temporal = "";
					label = "Desactivado";
				}
				var esEscena;
				if (conversion[i]['is_scene'] == 1) {
					esEscena = "<div>"+conversion[i]['label']+"</div>"+
				"<div>Acci&oacute;n: Activar</div>";
				}
				if (conversion[i]['is_scene'] == 0) {
					esEscena = "<div>" + conversion[i]['nombre_xbee'] + "</div>" +
					"<div>Acci&oacute;n: "+conversion[i]['start_valor']+"</div>";
				}
			div.innerHTML = div.innerHTML + 
				"<div class='myButton_timers contenedors' id='container_" + conversion[i]['timers_id'] + "'>" +
				"<div class='mini-head'>"+
				"<div class='mini-title'>"+conversion[i]['nombre_timer']+"</div>"+
				"<div class='buttons'>"+
				"<div class='ticker'><input class='check' type='checkbox' id = '"+conversion[i]['timers_id']+"' onChange = 'boton(this)' "+ temporal +"><label for='"+conversion[i]['timers_id']+"'>"+label+"</label></div>"+
				"<div class='icon'><IMG class='boton boton_edit' src='../../img/edit_icon.png' onclick='go_to_edit("+conversion[i]['timers_id']+")'></div>"+
				"<div class='icon'><IMG id = '"+conversion[i]['timers_id']+"' class='boton boton_delete' src='../../img/delete_icon.png' onClick = 'delete_timer(this)'></div>"+
				"</div>"+
				"</div>"+
				"<div id='"+ conversion[i]['nombre_timer'] +"'>"+
				"<div>"+
				esEscena +
				"</div>"+
				"</div>"+
				"<div class='"+ conversion[i]['nombre_timer'] +"'>"+		
				"<div>"+
				"<div>"+conversion[i]['hora_inicio']+"</div>"+
				"<div>Repetición:</div>"+
				"<div class='dias'>"+
				"<div>"+dia1+"</div>"+
				"<div>"+dia2+"</div>"+
				"<div>"+dia3+"</div>"+
				"<div>"+dia4+"</div>"+
				"<div>"+dia5+"</div>"+
				"<div>"+dia6+"</div>"+
				"<div>"+dia7+"</div>"+
				"</div>"+
				"</div>"+
				"</div>"+
				"</div>";
				
			}
			$('.check').button();
		}
	})
}
