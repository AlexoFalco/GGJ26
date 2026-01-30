//ombra nel punto di atterraggio della maschera
draw_set_alpha(0.4);
draw_set_color(c_dkgray);
var _lom = 20, _hom = 5; //larghezza e altezza dell'ombra
draw_ellipse(x-_lom,final_y-_lom,x+_lom,final_y+1,false);
draw_set_alpha(1);

//maschera
//scr_ombre(spr_mask,,id_mask);
draw_sprite_ext(spr_mask,id_mask,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha);



debug_text(is_touchable);