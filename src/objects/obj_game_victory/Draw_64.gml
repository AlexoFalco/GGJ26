/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_black)
draw_rectangle(1920/2-300, 1080/2-70, 1920/2+700, 1080/2+80, 0)

draw_sprite(sprite_index, 0, 1920/2-300,  1080/2)

draw_set_font(font_title)
draw_set_colour(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_text_border( 1920/2+250-300, 1080/2,font_title, "You win!","Hai vinto!",c_white,,,,10000,fa_left,fa_center);