anim_walk = [spr_player_1_walk, spr_player_2_walk, spr_player_3_walk, spr_player_4_walk];
sprite_index = anim_walk[player];

//Status vars
p_health_max = 3;
p_health = p_health_max;
p_dash_timer_max = 100;
p_dash_timer = p_dash_timer_max;
p_guard_timer_max = 100;
p_dash_timer = p_dash_timer_max;

//Movement vars
spd = 0;
spd_max = 7;
spd_walk = 10;
spd_dash = 20;
accel = 0.25;
decel = 1;
xx = 0;
yy = 0;


//Anim vars
image_speed = 0;

charid = 0
inputid = 0