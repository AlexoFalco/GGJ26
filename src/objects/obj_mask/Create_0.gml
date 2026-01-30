enum masks{drago,orco,paladino,cacca,megaman}

x = irandom_range(100,room_width-100);
y = irandom_range(100,room_height-100);

id_mask = irandom(masks.megaman);

is_touchable = false;
fall_time = 180;

tempo_per_toccare = time_source_create
(
	time_source_game,fall_time,time_source_units_frames,
	function()
	{
		is_touchable = true;
		create_sfarfallio(300,60);
	}
);
	
time_source_start(tempo_per_toccare);




