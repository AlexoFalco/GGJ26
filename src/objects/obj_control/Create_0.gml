scr_inizio_globale();

//script specifici per il gioco della GGJ26

timeSessionBase = 17999;
timeSession = timeSessionBase; //il tempo di una partita senza che vengano modificate le impostazioni

startedSession = false

crea_maschera = function(){
	instance_create_depth(x,y,depth,obj_mask);
	time_source_start(tempo_nuova_maschera);
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
	time_source_game,choose(120,180,240,300),time_source_units_frames,crea_maschera
)
	
tempo_prima_maschera = time_source_create
(
	time_source_game,540,time_source_units_frames,crea_maschera
)

if room = room_game //cambia quando mergi il gioco
{
	
	time_source_start(tempo_prima_maschera);
}