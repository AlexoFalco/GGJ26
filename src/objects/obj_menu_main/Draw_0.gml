/// @description Insert description here
// You can write your code in this editor
draw_set_colour(c_white)
draw_set_font(font_title)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text(10, 10, "Crazy mega party game")

draw_set_font(font_text)
draw_set_halign(fa_right)
draw_set_valign(fa_top)
draw_text(room_width-50, room_height-50, "Connect and use a gamepad for play!")

//draw_set_font(font_button)
//_draw_button(0, 10, 100, "Inizia partita")
//_draw_button(1, 10, 120, "Crediti")
//_draw_button(2, 10, 140, "Opzioni")
//_draw_button(3, 10, 160, "Esci")