image_xscale = lerp(image_xscale, 0, lerp_spd);
image_yscale = lerp(image_yscale, 0, lerp_spd);

if (image_xscale <= 0)
{
	instance_destroy();
}