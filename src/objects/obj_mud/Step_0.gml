with obj_player_mad
{
	if point_in_circle(x,y,other.x,other.y,other.raggio)
	{
		if mud_factor > 0.1
			mud_factor -= 0.025;
	}
	else
	{
		if mud_factor < 1
			mud_factor += 0.025;
	}
	
	if mud_factor >= 1
		mudded = false;
	else
		mudded = true;
}