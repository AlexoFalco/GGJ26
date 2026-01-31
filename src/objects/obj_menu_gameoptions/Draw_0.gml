/// @description Insert description here
// You can write your code in this editor
draw_set_colour(c_white)
draw_set_font(font_title)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text(10, 10, "Opzioni di partita")


draw_set_font(font_button)
_draw_button(0, 10, 100, "2 giocatori")
_draw_button(1, 10, 120, "3 giocatori")
_draw_button(2, 10, 140, "4 giocatori")
_draw_button(3, 10, 160, "indietro")