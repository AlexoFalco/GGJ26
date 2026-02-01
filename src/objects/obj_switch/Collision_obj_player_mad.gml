with other
{
	if !other.is_pressed
	{
		other.is_pressed = true;
		time_source_start(other.tempo_per_disattivare);
		
		var _xi, _dir, _partenza = 3000, _yy = irandom_range(300,room_height-300);
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