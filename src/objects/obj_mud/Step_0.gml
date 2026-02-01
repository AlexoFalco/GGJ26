image_xscale = scale
image_yscale = scale

raggio = sprite_xoffset*1.25

if (diffusion_index == 0)
{
    diffusion_enabled = false
}
if (diffusion_enabled)
{
    scale+=0.075
    if (diffusion_value > 0)
    {
        diffusion_value -= 1
    }
    if (diffusion_value == 0 and diffusion_index > 0)
    {
        var _dir = point_direction(x, y, room_width/2, room_height/2)
        var _x = lengthdir_x(raggio, _dir-30+random(60))
        var _y = lengthdir_y(raggio, _dir-30+random(60))
        var _obj = instance_create_layer(x + _x, y + _y, "Instances", obj_mud)
        _obj.diffusion_index = diffusion_index - 1
        diffusion_enabled = false
    }
}




with obj_player_mad
{
	if point_in_circle(x,y,other.x,other.y,other.raggio)
	{
		if mud_factor > 0.1
			mud_factor -= 0.05;
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