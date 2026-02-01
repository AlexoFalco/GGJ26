//if player_id != 0
//{
//	image_index = 0;
//	exit;
//}
	
scr_comandi();


var stick_dir = point_direction(0, 0, haxis, vaxis);
var stick_dist = point_distance(0, 0, abs(haxis), abs(vaxis));

var _move = (upHold || downHold || sxHold || dxHold) or (abs(haxis) > 0) or (abs(vaxis) > 0);
var _masked = (tempo_trasformazione > 0);

if (p_godmode > 0)
{
    p_godmode -= 1
    image_alpha = (floor(p_godmode/6) mod 2)
}
else {
	image_alpha = 1
}

anim_shake = 0;
if (_masked)
{
	if (confirmPress && p_state == STATE.NORMAL && p_dash_timer == p_dash_timer_max)
	{
		p_state = STATE.BURST;
		spd = spd_dash;
	}

	if (backPress && p_state == STATE.NORMAL && p_guard_timer == p_guard_timer_max)
	{
		if (spd != 0)
			spd = spd/2;
		p_state = STATE.SMASH;
	}
	
    tempo_trasformazione--;
    spd_walk = spd_walk_mask;
    accel = accel_mask;
    spd_walk_lerp = spd_walk_lerp_mask;
	
	switch p_state
	{
		#region NORMAL
		case STATE.NORMAL:
			smash_timer = 0;
			smash_cooldown_timer = 0;
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
			spd += accel*stick_dist*mud_factor;
			spd = clamp(spd, 0, spd_walk);
		
			p_dash_timer++;
			p_guard_timer++;
		
			var _coll = instance_place(x+xx, y+yy, obj_player_mad);
			if (_coll != noone)
			{
				if (_coll.p_state = STATE.NORMAL)
				{
					_coll.xx += xx;
					_coll.yy += yy;
				}
			}
		
			var _x = lengthdir_x(spd, direction);
			var _y = lengthdir_y(spd, direction);
			xx = lerp(xx, _x, spd_walk_lerp);
			yy = lerp(yy, _y, spd_walk_lerp);
			break;
		#endregion
	
		#region BURST
		case STATE.BURST:
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
				_coll.p_state = STATE.DASH;
				_coll.direction = point_direction(x, y, _coll.x, _coll.y);
				direction -= 180;	
				direction = direction mod 360;
			}
		
			var _x = lengthdir_x(spd, direction);
			var _y = lengthdir_y(spd, direction);
			xx = _x;
			yy = _y;
			break;
		#endregion
		
		#region SMASH
		case STATE.SMASH:
			
			if (smash_timer < smash_time)
			{
				smash_timer++;
				smash_yplus = lerp(smash_yplus, smash_yplus_max, 0.1);
				if (smash_timer == smash_time)
				{
					masked_smash();
				}
			}
			else
			{
				spd = 0;
				smash_yplus = 0;
				if (smash_cooldown_timer < smash_cooldown_time)
				{
					anim_shake = 2;
					smash_cooldown_timer++;
				}
				else
				{
					p_state = STATE.NORMAL;
					smash_timer = 0;
					smash_cooldown_timer = 0;
				}
			}
			var _x = lengthdir_x(spd, direction);
			var _y = lengthdir_y(spd, direction);
			xx = lerp(xx, _x, 0.2);
			yy = lerp(yy, _y, 0.2);
			break;
		#endregion
		
		case STATE.DASH:
		case STATE.GUARD:
			p_state = STATE.NORMAL;
			break;
	}
}
else 
{
	if (p_state == STATE.BURST or p_state == STATE.SMASH)
		p_state = STATE.NORMAL;
		
	if (confirmPress && p_state == STATE.NORMAL && p_dash_timer == p_dash_timer_max)
	{
		if (audio_is_playing(sfx_player_dash))
			audio_stop_sound(sfx_player_dash);
		audio_play_sound(sfx_player_dash, 1, false);
		p_state = STATE.DASH;
		spd = spd_dash;
	}

	if (backPress && p_state == STATE.NORMAL && p_guard_timer == p_guard_timer_max)
	{
		if (spd != 0)
			spd = spd/2;
		if (audio_is_playing(sfx_player_guard))
			audio_stop_sound(sfx_player_guard);
		audio_play_sound(sfx_player_guard, 1, false);
		p_state = STATE.GUARD;
	}
	spd_walk = spd_walk_normal*mud_factor;
    accel = accel_normal;
    spd_walk_lerp = spd_walk_lerp_normal;
	
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
			spd += accel*stick_dist*mud_factor;
			spd = clamp(spd, 0, spd_walk);
		
			p_dash_timer++;
			p_guard_timer++;
		
			var _coll = instance_place(x+xx, y+yy, obj_player_mad);
			if (_coll != noone)
			{
				if (_coll.p_state = STATE.NORMAL)
				{
					_coll.xx += xx;
					_coll.yy += yy;
				}
			}
		
			var _x = lengthdir_x(spd, direction);
			var _y = lengthdir_y(spd, direction);
			xx = lerp(xx, _x, spd_walk_lerp);
			yy = lerp(yy, _y, spd_walk_lerp);
			break;
		#endregion
	
		#region DASH
		case STATE.DASH:
			spd = spd_dash * mud_factor;
			spd = clamp(spd, 0, spd_dash);
		
			p_dash_timer -= p_dash_timer_spd;
			if (p_dash_timer <= 0)
			{
				p_state = STATE.NORMAL;
			}
			else
			{
				var _coll = instance_place(x+xx, y+yy, obj_player_mad);
				if (_coll != noone)
				{
					if (_coll.p_state != STATE.GUARD)
					{
	                    _coll.hittable();
						_coll.p_state = STATE.DASH;
						_coll.direction = point_direction(x, y, _coll.x, _coll.y);
						direction -= 180;	
						direction = direction mod 360;
						p_state = STATE.NORMAL;
						break;
					}
					else
					{
						if (p_spinto_count <= 0)
						{
							hittable();
							spd = spd_dash;
							p_dash_timer = p_dash_timer_max;
							direction -= 180;	
							direction = direction mod 360;
							var _x = lengthdir_x(spd, direction);
							var _y = lengthdir_y(spd, direction);
							xx = _x;
							yy = _y;
						}
						break;
					}
					//direction = -direction;
				}
		
				var _x = lengthdir_x(spd, direction);
				var _y = lengthdir_y(spd, direction);
				xx = _x;
				yy = _y;
			}
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
				audio_play_sound(sfx_player_parry, 1, false);
                _coll.hittable();
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
		#endregion
	}
}



#region ANIMATIONS


var _a = dcos(direction)

if (!_masked)
{
    if (spd < 0.01)
    {
        image_index = 0
    }
	if (_a != 0)
	{
	    image_xscale = sign(_a);
	}
	image_xscale = clamp(image_xscale, -1, 1);
	image_yscale = clamp(image_yscale, -1, 1);
    switch(p_state)
    {
        case STATE.GUARD:
    	case STATE.TEST_GUARD:
    		sprite_index = anim_guard[charid];
    		break;
    	case STATE.NORMAL:
    		sprite_index = anim_walk[charid];
            image_speed = lerp(0, 2, spd/spd_walk_normal) 
            break;
        case STATE.DASH:
            sprite_index = anim_dash[charid]
            break;
    }
}
else 
{
    if (spd < 0.01)
    {
        image_index = 0;
    }
	if (_a != 0)
	{
	    image_xscale = sign(_a);
		image_xscale = image_xscale*2;
	}
	image_yscale = image_yscale*2;
	image_xscale = clamp(image_xscale, -2, 2);
	image_yscale = clamp(image_yscale, -2, 2);
	
    switch(p_state)
    {
        case STATE.NORMAL:
            sprite_index = anim_walk_m;
            image_speed = lerp(0, 2.2, spd/spd_walk_mask)
            break;
        
        case STATE.DASH:
            sprite_index = anim_dash_m
            break;
		
		case STATE.SMASH:
			sprite_index = anim_smash_m;
			image_index = (smash_timer >= smash_time);
			break;
    }
}
image_index = image_index mod 2;
if (image_index >= 1)
{
	if (part_ind == noone)
		part_cloud(_masked);
}
else
{
	part_ind = noone;
}

#endregion





#region COLLISIONS

if (place_meeting(x+sign(xx), y+sign(yy), obj_collider))
{
    if (p_spinto_count > 0)
    {
        hit()
        p_spinto_count = 0
    }
}

var _collisions = CheckSolid();

if (p_spinto_count > 0)
{
	anim_shake = 1;
    p_spinto_count -= 1
}

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
    var max_distance = 128;

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


p_dash_timer = clamp(p_dash_timer, 0, p_dash_timer_max);
p_guard_timer = clamp(p_guard_timer, 0, p_guard_timer_max);

depth = -y;