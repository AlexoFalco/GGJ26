///@description debug_text
///@arg text
///@arg x_place
///@arg y_place

function draw_hitbox(_color = c_red, _alpha = 0.4){
	draw_set_alpha(_alpha);
	draw_set_color(_color);
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false);
	draw_set_alpha(1);
}

function debug_text(_var, xx = x, yy = y-30){
	draw_text_border(xx,yy,fnt_annuncino,_var,,,,,,500,fa_left,fa_top);
}