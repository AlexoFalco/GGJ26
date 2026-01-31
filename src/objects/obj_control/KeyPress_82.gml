room_restart();
timeSession = timeSessionBase;
startedSession = false;
timer_inizio = 240;
if room = room_arena //cambia quando mergi il gioco
{
	time_source_start(tempo_prima_maschera);
}