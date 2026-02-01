scr_inizio_globale();
//script specifici per il gioco della GGJ26

timeSessionBase = 17999;
timeSession = timeSessionBase; //il tempo di una partita senza che vengano modificate le impostazioni

startedSession = false

crea_maschera = function(){
	time_source_stop(tempo_prima_maschera);
	instance_create_depth(x,y,depth,obj_mask);
	time_source_start(tempo_nuova_maschera);
}

crea_scatola = function(){
	time_source_stop(tempo_prima_scatola);
	instance_create_depth(x,y,depth,obj_falling_crate);
	time_source_start(tempo_nuova_scatola);
}

inizio_sessione = function(){
	startedSession = true;	
}
timer_inizio = 240;

inizio_partita = time_source_create
(
	time_source_game,180,time_source_units_frames,inizio_sessione
)

tempo_nuova_maschera = time_source_create
(
	time_source_game,choose(600,540,480),time_source_units_frames,crea_maschera
)
	
tempo_prima_maschera = time_source_create
(
	time_source_game,360,time_source_units_frames,crea_maschera
)

tempo_nuova_scatola = time_source_create
(
	time_source_game,choose(180,540,480,360),time_source_units_frames,crea_scatola
)
	
tempo_prima_scatola = time_source_create
(
	time_source_game,540,time_source_units_frames,crea_scatola
)

if room = room_arena //cambia quando mergi il gioco in room != room_title, I guess?
{
	time_source_start(tempo_prima_maschera);
	time_source_start(tempo_prima_scatola);
}