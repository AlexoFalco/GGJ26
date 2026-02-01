smuccata = false
//show_message(x);
flash = true;
sflashata = function(){
	flash = !flash;
	time_source_start(tempo_flash);
}

tempo_flash = time_source_create(
	time_source_game,10,time_source_units_frames,sflashata
)

time_source_start(tempo_flash);