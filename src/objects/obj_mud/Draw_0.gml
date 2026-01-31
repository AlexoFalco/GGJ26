draw_self();
draw_set_color(c_aqua);
draw_circle(x,y,raggio,true);

with obj_player_mad
{
	debug_text(mud_factor,other.x,other.y);	
}