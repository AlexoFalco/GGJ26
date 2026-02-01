if (!instance_exists(obj_mask_ishere))
{
	instance_create_layer(0, 0, "Managers", obj_mask_ishere);
}

var xx = room_width/2;
var yy = room_height/2;

if (mask_isfirst)
{
	mask_isfirst = false;
	if (instance_exists(obj_mask_spot))
	{
		var num = irandom(instance_number(obj_mask_spot));
		var _id = noone;
		with (obj_mask_spot)
		{
			if (tag == num)
			{
				xx = x;
				yy = y;
				break;	
			}
		}
	}
}
if (!instance_exists(obj_mask))
{
	instance_create_depth(xx, yy, 1, obj_mask);
}