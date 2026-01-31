// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_sfarfallio(t_sfarfallo = 600, t_sparizione = 120, t_vulnerabilitas = 30){
sparendo = false;
alpha = false;
invulnerabilitas = true;

sfarfallo = function(){
	time_source_start(tempo_per_sparire);
	sparendo = true;
}

sparizione = function(){
	instance_destroy();
	time_source_start(obj_control.tempo_nuova_maschera)
}

vulnerabilitas = function(){
	invulnerabilitas = false;
}

tempo_per_sfarfallare = time_source_create(time_source_game,t_sfarfallo,time_source_units_frames,sfarfallo);
time_source_start(tempo_per_sfarfallare);

tempo_per_vulnerabilizzare = time_source_create(time_source_game,t_vulnerabilitas,time_source_units_frames,vulnerabilitas);
time_source_start(tempo_per_vulnerabilizzare);

tempo_per_sparire = time_source_create(time_source_game,t_sparizione,time_source_units_frames,sparizione);
}

function step_sfarfallio(min_alpha = 0.2, incr_alpha = 0.1){
	if sparendo
	{
		if !alpha
		{
			if image_alpha <= min_alpha
				alpha = true;
			else
				image_alpha-=incr_alpha;
		}
		else
		{
			if image_alpha >= 1
				alpha = false;
			else
				image_alpha+=incr_alpha;
		}
	}
}