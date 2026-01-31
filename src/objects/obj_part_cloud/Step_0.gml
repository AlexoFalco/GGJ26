image_xscale = lerp(image_xscale, 0, 0.25);
image_yscale = lerp(image_yscale, 0, 0.25);

if (image_xscale <= 0)
{
	instance_destroy();
}