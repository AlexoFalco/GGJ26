///@description barra_PS
///@arg HP_variable
///@arg MaxHP_variable
///@arg x1
///@arg y1
///@arg x2
///@arg y2
///@arg length
///@arg height_full
///@arg height_empty
///@arg sprite
///@arg alpha
///@arg color

function barra_PS(varHP, varMaxHP, xHP=x-5, yHP=y-12, xfHP=xHP+9, yfHP=yHP+1, lungHP = 10, altHP1 = 2, altHP2 = 0.5, _barra = spr_fp, _alphy = 1, _colorebarra = c_white)
{
	draw_set_alpha(_alphy);
	draw_sprite_ext(_barra,0,xHP,yHP,lungHP,altHP2,0,c_dkgray,_alphy);
	draw_set_color(_colorebarra);
	draw_sprite_stretched(_barra,0,xHP,yHP,lungHP*(varHP/varMaxHP),altHP1);
	draw_set_color(c_black);
	draw_rectangle(xHP,yHP,xfHP,yfHP,true);
	draw_set_alpha(1);
}