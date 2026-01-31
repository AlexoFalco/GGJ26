if is_touchable
	step_sfarfallio();

if y < final_y
	y+=fall_delta;
else
	instance_change(obj_collider,true);