/// @description Insert description here
// You can write your code in this editor
draw_self()

draw_set_font(font_button)
draw_set_colour(c_white)
draw_set_halign(fa_center)

if (image_index != 0 and is_ready == false)
{
    draw_sprite(spr_lobby_slot_arrow, 0, x, y)
    draw_set_font(font_button)
    draw_set_colour(c_white)
    draw_set_halign(fa_center)
    draw_text(x, y +105, chars_name[charid])
}
if (is_ready)
{
    draw_sprite_ext(spr_lobby_slot_selected, 0, x, y, image_xscale, image_yscale, 0, c_white, ready_count)
    
    draw_set_font(font_button)
    draw_set_colour(c_white)
    draw_set_halign(fa_center)
    
    draw_text(x, y +105, chars_name[charid])
}