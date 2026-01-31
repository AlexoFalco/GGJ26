if player_id != 0
{
	image_index = 0;
	exit;
}
	
scr_comandi();


var stick_dir = point_direction(0, 0, haxis, vaxis);
var stick_dist = point_distance(0, 0, abs(haxis), abs(vaxis));

var _move = (upHold || downHold || sxHold || dxHold);



if (_move)
{
	if (upHold)
	{
		if (sxHold)
			stick_dir = 135;
		else if (dxHold)
			stick_dir = 45;
		else
			stick_dir = 90;
	}
	else if (downHold)
	{
		if (sxHold)
			stick_dir = 225;
		else if (dxHold)
			stick_dir = 315;
		else
			stick_dir = 270;
	}
	else
	{
		if (sxHold)
			stick_dir = 180;
			
		if (dxHold)
			stick_dir = 0;
	}
	direction = stick_dir;
	stick_dist = 1;
}
else
{
	if (stick_dist == 0)
	{
		spd -= accel;
		
	}
}



spd += accel*stick_dist;
spd = clamp(spd, 0, spd_max);

var _x = lengthdir_x(spd, direction);
var _y = lengthdir_y(spd, direction);
xx = lerp(xx, _x, 0.05);
yy = lerp(yy, _y, 0.05);
//xx = clamp(xx, -spd_max, spd_max);
//yy = clamp(yy, -spd_max, spd_max);


#region COLLISIONS

var _collisions = CheckSolid();

if (collision_with_any(x + xx, y, _collisions)) {
    var safety = 0;
    while (!collision_with_any(x + sign(xx), y, _collisions) && safety < abs(xx)) {
        x += sign(xx);
        safety++;
    }
    xx = 0;
}

if (collision_with_any(x, y + yy, _collisions)) {
    var safety = 0;
    while (!collision_with_any(x, y + sign(yy), _collisions) && safety < abs(yy)) {
        y += sign(yy);
        safety++;
    }
    yy = 0;
}

if (collision_with_any(x, y, _collisions)) {
    var resolved = false;
    var max_distance = 16;

    for (var i = 1; i <= max_distance; ++i) {
        var directions = [
            [ i,  0],
            [-i,  0],
            [ 0, -i],
            [ 0,  i],
            [ i, -i],
            [-i, -i],
            [ i,  i],
            [-i,  i]
        ];

        for (var d = 0; d < array_length(directions); ++d) {
            var dx = directions[d][0];
            var dy = directions[d][1];

            if (!collision_with_any(x + dx, y + dy, _collisions)) {
                x += dx;
                y += dy;
                resolved = true;
                break;
            }
        }

        if (resolved) break;
    }
}

x += xx;
y += yy;
	
#endregion

#region ANIMATION
image_index += 0.05*spd;

if (spd <= 0)
	image_index = 0;
#endregion