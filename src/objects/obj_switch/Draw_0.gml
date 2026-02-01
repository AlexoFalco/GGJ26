if (is_pressed == false)
{
    var _img = 0;
    if is_pressed
    	_img = 1;
    draw_sprite_ext(spr_switch,0,x,y+y_anim,1,1,0,c_white,1);
    draw_sprite_ext(spr_switch,1,x,y+y_anim,1,1,0,c_white,b_anim);
}