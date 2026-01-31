enum STATE
{
	WAIT,
	NORMAL,
	DASH,
}

//Status vars
p_health_max = 100;
p_health = p_health_max;
p_state = STATE.NORMAL;
p_dash_timer_max = 100;
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