/// @description Insert description here
// You can write your code in this editor
button_index = 0
button_count = 0

left_info[0] = $"{scr_input(comandi.A,lang.eng)}: Select      {scr_input(comandi.B,lang.eng)}: Back";
left_info[1] = $"{scr_input(comandi.A,lang.ita)}: Seleziona      {scr_input(comandi.B,lang.ita)}: Indietro";
right_info = ["Connect a gamepad to play!","Connetti un gamepad per giocare!"]

camera_width = camera_get_view_width(view_camera[0])
camera_width_mid = camera_width/2
camera_height = camera_get_view_height(view_camera[0])
camera_height_mid = camera_height/2

