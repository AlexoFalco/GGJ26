/// @description Insert description here
// You can write your code in this editor
draw_set_font(font_text)
draw_set_valign(fa_top)
draw_set_halign(fa_right)
draw_text_border(camera_width-50, camera_height-50, font_text,right_info[global.language],,,,,,,fa_right,fa_top)
draw_set_halign(fa_left)
draw_text(50, camera_height-50, left_info[global.language])