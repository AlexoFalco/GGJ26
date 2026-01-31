//ombra nel punto di atterraggio della maschera
draw_set_alpha(0.4);
draw_set_color(c_dkgray);
var _lom = 60, _hom = 20; //larghezza e altezza dell'ombra
draw_rectangle(x-_lom,final_y-_lom,x+_lom,final_y+1,false);
draw_set_alpha(1);

//maschera
//scr_ombre(spr_mask,,id_mask);
var c = c_white;
if is_touchable
	c = c_red;
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,c,image_alpha);
