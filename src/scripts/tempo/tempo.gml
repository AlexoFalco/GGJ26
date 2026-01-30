///@description scr_tictoc
///@arg Tempo

function scr_tictoc(_tempo){
	tms = string_format(floor(((_tempo mod 60) / 60) * 1000),3,0)
	tms = string_replace(tms," ","0")
	if _tempo = 35999
		tms = "999";
	tsec = string_format((_tempo mod 3600) div 60,2,0)
	tsec = string_replace(tsec," ","0")
	tmin = (_tempo div 3600)
	return $"{tmin}:{tsec}:{tms}";
}