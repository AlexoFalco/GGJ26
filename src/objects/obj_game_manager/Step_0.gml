/// @description Insert description here
// You can write your code in this editor
if (release_mode_check(RELEASE_MODE_ENUMS.ALEXO))
{
    if (mouse_check_button_pressed(mb_left))
    {
        instance_create_layer(mouse_x, mouse_y, "Instances", obj_mask)
    }
}

if (flag_victory == false)
{
    if (instance_number(obj_player_mad) == 0)
    {
        flag_victory = true
        call_later(180, time_source_units_frames, function()
        {
            game_restart()
        })
    }
    else if (instance_number(obj_player_mad) == 1)
    {
        var _ref = instance_find(obj_player_mad, 0)
        var _x = obj_camera.camera_x + obj_camera.camera_width/2
        var _y = obj_camera.camera_y + obj_camera.camera_height/2
        var _obj = instance_create_layer(_x, _y, "Managers", obj_game_victory)
        _obj.sprite_index = _ref.sprite_index
        flag_victory = true        
        call_later(180, time_source_units_frames, function()
        {
            game_restart()
        })        
    }
}


//if (instance_exists(obj_mask) == false)
//{instance_create_layer(room_width/2, room_height/2, "Instances", obj_mask)}