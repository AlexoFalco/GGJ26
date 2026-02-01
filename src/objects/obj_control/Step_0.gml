scr_comandi();
scr_volume_bstep();

if room = room_arena
{
	if !startedSession && timeSession = timeSessionBase
		time_source_start(inizio_partita);
		
	if timeSession > 0 && startedSession
		timeSession--;
	else if timeSession <= 0
		time_source_stop(tempo_nuova_maschera);
	
	
	if timer_inizio > 0
		timer_inizio--;
	
}

if room = room_settings
	impostazioni = true;
else
	impostazioni = false;
	
if impostazioni
	scr_impostazioni_step();
	
if room = room_riconoscimenti
{
	if confirmPress || backPress || pausePress
		room_goto(room_menu_main);
}