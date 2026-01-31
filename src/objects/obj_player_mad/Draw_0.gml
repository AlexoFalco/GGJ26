if (release_mode_check(RELEASE_MODE_ENUMS.GIOCO) == false)
{
    draw_sprite(mask_index, 0, x, y);
    draw_self();
    draw_set_font(font_title)
    draw_text(x, y-20, tempo_trasformazione)
}
else 
{
	draw_self();
}