var _arr = [sfx_moo_1, sfx_moo_2, sfx_moo_3];
var n = irandom_range(0, array_length(_arr)-1);
audio_play_sound(_arr[n], 1, false, 2);

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