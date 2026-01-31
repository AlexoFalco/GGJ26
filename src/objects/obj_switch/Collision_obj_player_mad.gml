with other
{
	if !other.is_pressed
	{
		other.is_pressed = true;
		time_source_start(other.tempo_per_disattivare);
		
		var _xi, _dir, _partenza = 500, _yy = choose(room_height/2,room_height/3,room_height/4,2*room_height/3,3*room_height/4);
		switch other._id
		{
			case 0: {
				_xi = -_partenza;
				_dir = 1;
			}
			break;
			case 1:
			{
				_xi = room_width+_partenza;
				_dir = -1;	
			}
			break;
		}
		
		var _mucca = instance_create_depth(_xi,_yy,depth-1000,obj_mucca);
		with _mucca
		{
			speed = 20*_dir;
			image_xscale = _dir;
		}
	}
}