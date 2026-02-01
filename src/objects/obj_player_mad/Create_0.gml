anim_walk = [spr_player_1_walk, spr_player_2_walk, spr_player_3_walk, spr_player_4_walk];
anim_guard = [spr_player_1_guard, spr_player_2_guard, spr_player_3_guard, spr_player_4_guard];
anim_dash = [spr_player_1_dash, spr_player_2_dash, spr_player_3_dash, spr_player_4_dash];
anim_walk_m = spr_player_m_walk;
anim_dash_m = spr_player_m_dash;
anim_smash_m = spr_player_m_smash;
anim_shake = 0;
sprite_index = anim_walk[0];

snd_walk[0] = [sfx_step_barefoot_1, sfx_step_barefoot_2, sfx_step_barefoot_1, sfx_step_barefoot_2];
snd_walk[1] = [sfx_step_shoes_1, sfx_step_shoes_2, sfx_step_shoes_3, sfx_step_shoes_4];
snd_walk[2] = [sfx_step_boots_1, sfx_step_boots_2, sfx_step_boots_3, sfx_step_boots_4];
snd_walk[3] = [sfx_step_barefoot2_1, sfx_step_barefoot2_2, sfx_step_barefoot2_3, sfx_step_barefoot2_4];
snd_walk[4] = [sfx_step_mask_1, sfx_step_mask_2, sfx_step_mask_3, sfx_step_mask_4];
snd_hit = [sfx_player_hit_1, sfx_player_hit_2, sfx_player_hit_3];
snd_hurt = [sfx_player_hurt_goblaster, sfx_player_hurt_jerry, sfx_player_hurt_donovan, sfx_player_hurt_gertrude];
arrow_col = [c_green, c_blue, c_red, c_yellow];

//Status vars
p_health_max = 3;
p_health = p_health_max;
p_dash_timer_max = 100;
p_dash_timer = p_dash_timer_max;
p_dash_timer_spd = 5;
p_guard_timer_max = 20;
p_guard_timer = p_guard_timer_max;

p_spinto_count = 0
p_godmode = 0

//Movement vars
spd = 0;
spd_walk = 10;
spd_walk_normal = 10;
spd_walk_mask = 5;
spd_walk_lerp = 0.05;
spd_walk_lerp_normal = 0.05;
spd_walk_lerp_mask = 1;
spd_dash = 20;
accel = 0.25;
accel_normal = 0.25;
accel_mask = 1;
decel = 1;
xx = 0;
yy = 0;
lerp_spd = 0.2;


//Anim vars
image_speed = 0;

charid = 0;
inputid = 0;

tempo_trasformazione = 0;
tempo_trasformazione_max = 0

part_ind = false;
part_cloud = function(mask = false)
{
	part_ind = true;
	instance_create_depth(x-40*image_xscale, y+32, depth-1, obj_part_cloud);
	var _n = irandom_range(0, 3);
	var _id = charid;
	if (mask) _id = 4;
	audio_play_sound(snd_walk[_id, _n], 1, false, 0.7, 0, random_range(0.9, 1.1)); 
}

hit = function(_godmode_count = 30)
{
    if (p_godmode > 0) return;
    
    p_health -= 1
    p_godmode = _godmode_count
}

hittable = function()
{
    var _id = charid
	var _n = irandom_range(0, 2);
	audio_play_sound(snd_hit[_n], 1, false);
	audio_play_sound(snd_hurt[_id], 1, false);
    p_spinto_count = 45;
}


smash_timer = 0;
smash_time = 30;
smash_cooldown_timer = 0;
smash_cooldown_time = 60;
smash_yplus = 0;
smash_yplus_max = -64;
masked_smash = function()
{
	audio_play_sound(sfx_player_mask_smash, 1, false);
	for (var i=1; i<9; i++)
	{
		var n = 0;
		n += 45*i;
		var xx = lengthdir_x(128, n);
		var yy = lengthdir_y(128, n);
		instance_create_depth(x+xx, y+yy, -9999, obj_part_cloud,
		{
			image_xscale : 3,
			image_yscale : 3
		});
		xx = lengthdir_x(256, n);
		yy = lengthdir_y(256, n);
		instance_create_depth(x+xx, y+yy, -9999, obj_part_cloud,
		{
			image_xscale : 3,
			image_yscale : 3,
			lerp_spd : 0.1
		});
	}
	var _list = ds_list_create();
	var _coll = collision_circle_list(x, y, 700, obj_player_mad, true, true, _list, false);
	for (var i=0; i<ds_list_size(_list); i++)
	{
		var _curr_inst = _list[| i];
		_curr_inst.hittable();
		_curr_inst.p_state = STATE.DASH;
		_curr_inst.direction = point_direction(x, y, _curr_inst.x, _curr_inst.y);
	}
}


#region FANGO
mud_factor = 1;
mudded = false;
#endregion