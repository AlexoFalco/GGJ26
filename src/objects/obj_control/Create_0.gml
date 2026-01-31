scr_inizio_globale();

//script specifici per il gioco della GGJ26

timeSession = 1799; //il tempo di una partita senza che vengano modificate le impostazioni

crea_maschera = function(){
	instance_create_depth(x,y,depth,obj_mask);
	time_source_start(tempo_nuova_maschera);
}

if room = room_game //cambia quando mergi il gioco
{
	tempo_nuova_maschera = time_source_create
	(
		time_source_game,choose(120,180,240,300),time_source_units_frames,crea_maschera
	)
	time_source_start(tempo_nuova_maschera);
}