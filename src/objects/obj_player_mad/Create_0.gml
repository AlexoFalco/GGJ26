anim_walk = [spr_player_1_walk, spr_player_2_walk, spr_player_3_walk, spr_player_4_walk];
anim_guard = [spr_player_1_guard, spr_player_2_guard, spr_player_3_guard, spr_player_4_guard];
anim_walk_m = spr_player_m_walk
sprite_index = anim_walk[0];

//Status vars
p_health_max = 3;
p_health = p_health_max;
p_dash_timer_max = 100;
p_dash_timer = p_dash_timer_max;
p_dash_timer_spd = 5;
p_guard_timer_max = 20;
p_guard_timer = p_guard_timer_max;

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

part_cloud = function()
{
	instance_create_depth(x+random_range(-40, 40), y+12, depth+1, obj_part_cloud);
}


#region FANGO
mud_factor = 1;
mudded = false;
#endregion