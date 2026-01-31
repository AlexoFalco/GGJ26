anim_walk = [spr_player_1_walk, spr_player_2_walk, spr_player_3_walk, spr_player_4_walk];
anim_guard = [spr_player_1_guard, spr_player_2_guard, spr_player_3_guard, spr_player_4_guard];
anim_walk_m = spr_player_m_walk
sprite_index = anim_walk[0];

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
part_cloud = function()
{
	part_ind = true;
	instance_create_depth(x-40*image_xscale, y+32, depth-1, obj_part_cloud);
}

hit = function(_godmode_count = 30)
{
    if (p_godmode > 0) return;
    
    p_health -= 1
    p_godmode = _godmode_count
}

hittable = function()
{
    p_spinto_count = 45
}

masked_smash = function()
{
	
}


#region FANGO
mud_factor = 1;
mudded = false;
#endregion