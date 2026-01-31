con = obj_control;

is_pressed = false;

disattivazione = function(){
	is_pressed = false;	
}

tempo_per_disattivare = time_source_create(time_source_game,300,time_source_units_frames,disattivazione)