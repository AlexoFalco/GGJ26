event_inherited()


draw_sprite(spr_menu_title, 0, room_width/2-50, 150)
var titles = ["New match", "Nuova partita"]

draw_set_colour(c_white)
draw_set_font(font_subtitle)
draw_set_halign(fa_middle)
draw_set_valign(fa_center)
draw_text(camera_width_mid-50, 110, global.language = lang.eng ? titles[0] : titles[1])