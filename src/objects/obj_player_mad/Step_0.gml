//if player_id != 0
//{
//	image_index = 0;
//	exit;
//}
	
scr_comandi();


var stick_dir = point_direction(0, 0, haxis, vaxis);
var stick_dist = point_distance(0, 0, abs(haxis), abs(vaxis));

var _move = (upHold || downHold || sxHold || dxHold) or (abs(haxis) > 0) or (abs(vaxis) > 0);


if (confirmPress && p_state == STATE.NORMAL && p_dash_timer == p_dash_timer_max)
{
	p_state = STATE.DASH;
	spd = spd_dash;
}

if (backPress && p_state == STATE.NORMAL && p_guard_timer == p_guard_timer_max)
{
	if (spd != 0)
		spd = spd/2;
	p_state = STATE.GUARD;
}

switch p_state
{
	#region NORMAL
	case STATE.NORMAL:
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
				spd -= decel;
	
		}
		spd += accel*stick_dist;
		spd = clamp(spd, 0, spd_walk);
		
		p_dash_timer++;
		p_guard_timer++;
		
		var _coll = instance_place(x+xx, y+yy, obj_player_mad);
		if (_coll != noone)
		{
			_coll.xx += xx;
			_coll.yy += yy;
		}
		
		var _x = lengthdir_x(spd, direction);
		var _y = lengthdir_y(spd, direction);
		xx = lerp(xx, _x, 0.05);
		yy = lerp(yy, _y, 0.05);
		break;
	#endregion
	
	#region DASH
	case STATE.DASH:
		spd = spd_dash;
		spd = clamp(spd, 0, spd_dash);
		
		p_dash_timer -= p_dash_timer_spd;
		if (p_dash_timer <= 0)
		{
			p_state = STATE.NORMAL;
			break;
		}
		
		
		var _coll = instance_place(x+xx, y+yy, obj_player_mad);
		if (_coll != noone)
		{
			if (_coll.p_state != STATE.GUARD)
			{
				_coll.p_state = STATE.DASH;
				_coll.direction = point_direction(x, y, _coll.x, _coll.y);
				direction -= 180;	
				direction = direction mod 360;
				p_state = STATE.NORMAL;
				break;
			}
			else
			{
				spd = spd_dash;
				p_dash_timer = p_dash_timer_max;
				direction -= 180;	
				direction = direction mod 360;
				var _x = lengthdir_x(spd, direction);
				var _y = lengthdir_y(spd, direction);
				xx = _x;
				yy = _y;
			}
			//direction = -direction;
		}
		
		var _x = lengthdir_x(spd, direction);
		var _y = lengthdir_y(spd, direction);
		xx = _x;
		yy = _y;
		break;
	#endregion
	
	#region GUARD
	case STATE.GUARD:
		
		p_guard_timer -= 1;
		if (p_guard_timer <= 0)
		{
			p_state = STATE.NORMAL;
			break;
		}
		
		var _coll = instance_place(x+xx, y+yy, obj_player_mad);
		if (_coll != noone)
		{
			_coll.p_state = STATE.DASH;
			_coll.direction = point_direction(x, y, _coll.x, _coll.y);
			direction = -direction;
			p_state = STATE.NORMAL;
		}
		
		var _x = lengthdir_x(spd, direction);
		var _y = lengthdir_y(spd, direction);
		xx = lerp(xx, _x, 0.2);
		yy = lerp(yy, _y, 0.2);
		break;
	
	case STATE.TEST_GUARD:
		
		//var _coll = instance_place(x+xx, y+yy, obj_player_mad);
		//if (_coll != noone)
		//{
		//	if (_coll.p_state == STATE.DASH)
		//	{
		//		_coll.p_dash_timer = _coll.p_dash_timer_max;
		//		_coll.spd = -_coll.spd_dash;
				
		//		direction = -direction;
		//	}
		//}
		
		var _x = lengthdir_x(spd, direction);
		var _y = lengthdir_y(spd, direction);
		xx = lerp(xx, _x, 0.2);
		yy = lerp(yy, _y, 0.2);
		break;
	#endregion
}





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
var _anim_spd = clamp(spd, 0, spd/2);
image_index += 0.05*_anim_spd;

if (spd <= 0)
	image_index = 0;

switch (p_state)
{
	case STATE.GUARD:
	case STATE.TEST_GUARD:
		sprite_index = anim_guard[player];
		break;
	case STATE.NORMAL:
		sprite_index = anim_walk[player];
		break;
}
#endregion


p_dash_timer = clamp(p_dash_timer, 0, p_dash_timer_max);
p_guard_timer = clamp(p_guard_timer, 0, p_guard_timer_max);

depth = -y;