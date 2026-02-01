enum masks{drago,orco,paladino,cacca,megaman}


//x = irandom_range(100,room_width-100);
//y = irandom_range(300,room_height-300);

id_mask = masks.drago;

is_touchable = false;

fall_time = 180;
fall_delta = 2;
final_y = y+fall_time*fall_delta

tempo_per_toccare = time_source_create
(
	time_source_game,fall_time,time_source_units_frames,
	function()
	{
		is_touchable = true;
		audio_play_sound(sfx_mask_land, 1, false);
		with (obj_lightray)
		{
			do_disappear = true;	
		}
		//create_sfarfallio(300,60);
	}
);
	
time_source_start(tempo_per_toccare);

for (var i=0; i<8; i++)
{
	var n = 0;
	n += 45*i;
	var xx = lengthdir_x(128, n);
	var yy = lengthdir_y(128, n);
	
	instance_create_depth(x, y, depth-1, obj_lightray,
	{
		image_angle : n	
	});
}