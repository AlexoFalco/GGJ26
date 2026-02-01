/// @description Insert description here
// You can write your code in this editor
draw_self()

if (image_index != 0 and is_ready == false)
{
    draw_sprite(spr_lobby_slot_arrow, 0, x, y)
}
if (is_ready)
{
    draw_set_font(font_button)
    draw_set_colour(c_white)
    draw_set_halign(fa_center)
    draw_text(x, y+100, "Ready")
}