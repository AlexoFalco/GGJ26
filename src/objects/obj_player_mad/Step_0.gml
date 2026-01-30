scr_comandi();

scr_comandi();

var stick_dir = point_direction(0, 0, haxis, vaxis);
var stick_dist = point_distance(0, 0, abs(haxis), abs(vaxis));
	
if (upHold || downHold || sxHold || dxHold)
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
	stick_dist = 1;
}


xx -= spd * stick_dist * dcos(stick_dir);
yy += spd * stick_dist * dsin(stick_dir);



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