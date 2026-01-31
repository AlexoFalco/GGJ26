/// @description Insert description here
// You can write your code in this editor

//reset variabili (vanno ricalcolati)
player_x_min = 99999999999999999
player_x_max = 0
player_x_mid = 0
player_y_min = 99999999999999999
player_y_max = 0
player_y_mid = 0


//centro la camera
camera_width = camera_get_view_width(camera_ref)
camera_height = camera_get_view_height(camera_ref)

with(obj_player_mad)
{
    other.player_x_min = min(other.player_x_min, x)
    other.player_x_max = max(other.player_x_max, x)
    
    other.player_y_min = min(other.player_y_min, y)
    other.player_y_max = max(other.player_y_max, y)
}

players_max_distance = point_distance(player_x_min, player_y_min, player_x_max, player_y_max)

player_x_mid = player_x_min + (player_x_max-player_x_min)*0.5
player_y_mid = player_y_min + (player_y_max-player_y_min)*0.5

camera_x = player_x_mid-camera_width/2
camera_y = player_y_mid-camera_height/2

camera_set_view_pos(camera_ref, camera_x, camera_y)

//resize della camera adattive
var _ww = 1920
var _hh = 1080
var _min_camera_scale = 0.8
var _max_camera_scale = 2.5
var _k_dist = 700
var _smooth_camera = 2000
var _inc_camera = 0.01
var _a = 200

with(obj_player_mad)
{
    if (x < other.camera_x or x > other.camera_x+_ww or
        y < other.camera_y or y > other.camera_y+_hh)
    {
        other.camera_size += _inc_camera
    }
}
camera_size = lerp(_min_camera_scale, _max_camera_scale, max(players_max_distance-_k_dist, 0)/_smooth_camera)
camera_size = clamp(camera_size, _min_camera_scale, _max_camera_scale)

camera_set_view_size(camera_ref, _ww*camera_size, _hh*camera_size)