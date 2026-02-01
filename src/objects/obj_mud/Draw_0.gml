draw_self();

if (release_mode_check(RELEASE_MODE_ENUMS.GIOCO) == false)
{
    draw_set_color(c_aqua);
    draw_circle(x,y,raggio,true);
}