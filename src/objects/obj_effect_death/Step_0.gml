/// @description Insert description here
// You can write your code in this editor
if (count < count_max)
{
    count += 1
    
    image_xscale = 1+(count / count_max)*1.2
    image_yscale = image_xscale
    
    image_alpha = (1-count / count_max)
}
else {
	instance_destroy()
}