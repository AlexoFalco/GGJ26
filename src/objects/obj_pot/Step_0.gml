/// @description Insert description here
// You can write your code in this editor
if (open == 1)
{
    if (count < count_max)
    {
        count+=1
        
        if (count > count_max/2)
        { 
            image_index = 1
        }

        image_angle = sign(image_xscale) * (lerp(0, -45, ac_get_curve_value(ac_pot, count/count_max)) + 0)
    }
    else 
    {
    	open = 2
        var _dir = point_direction(x, y, room_width/2, room_height/2)
        var _x = lengthdir_x(200, sign(image_xscale) ? _dir : _dir)
        var _y = lengthdir_y(200, sign(image_xscale) ? _dir : _dir)
        var _obj = instance_create_layer(x+_x, y+_y, "Instances", obj_mud)
        _obj.diffusion_index = 5 + irandom(5)
    }
    
}