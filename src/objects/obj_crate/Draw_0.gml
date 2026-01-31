//ombra nel punto di atterraggio della maschera
draw_set_alpha(0.4);
draw_set_color(c_dkgray);
var _lom = sprite_get_width(spr_crate)/2, _hom = 20; //larghezza e altezza dell'ombra
draw_rectangle(x-_lom,y-_lom,x+_lom,y+10,false);
draw_set_alpha(1);

//maschera
//scr_ombre(spr_mask,,id_mask);
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha);