/// @description Insert description here
// You can write your code in this editor
if (release_mode_check(RELEASE_MODE_ENUMS.ALEXO))
{
    if (mouse_check_button_pressed(mb_left))
    {
        instance_create_layer(mouse_x, mouse_y, "Instances", obj_mask)
    }
}