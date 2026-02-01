image_angle++;

if (do_disappear)
{
	if (image_alpha <= 0)
		instance_destroy();
	
	image_alpha-=0.05;
}
if (instance_exists(obj_mask))
	depth = obj_mask.depth+10;