//disegna_musica(global.guih/2-90,70,130);
if room = room_game
{
	if startedSession
	{
		draw_text_border(global.guiw/2,global.guih/8,font_text,$"{scr_tictoc(timeSession)}");
		if timer_inizio > 0
			draw_text_border(global.guiw/2,global.guih/2,font_title,"GO!","VIA!",,,5)
	}
		
	else
	{
		var _txt = timer_inizio div 60;
		draw_text_border(global.guiw/2,global.guih/2,font_title,timer_inizio div 60,,,,3)
	}
}