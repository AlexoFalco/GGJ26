con = obj_control;

is_pressed = false;

y_anim = 0
b_anim = 0

disattivazione = function(){
	is_pressed = false;	
}

tempo_per_disattivare = time_source_create(time_source_game,300,time_source_units_frames,disattivazione)