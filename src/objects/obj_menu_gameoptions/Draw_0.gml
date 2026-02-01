event_inherited()


draw_sprite(spr_menu_title, 0, room_width/2-50, 100)
var titles = ["New match", "Nuova partita"]

draw_set_colour(c_white)
draw_set_font(font_subtitle)
draw_set_halign(fa_middle)
draw_set_valign(fa_center)
draw_text(camera_width_mid-50, 60, global.language = lang.eng ? titles[0] : titles[1])

/*
draw_set_font(font_text)
draw_set_halign(fa_right)
draw_set_valign(fa_top)
draw_text(room_width-50, room_height-50, "Connect and use a gamepad for play!")
draw_set_halign(fa_left)
draw_text(50, room_height-50, "A: Select      B: Back")
*/