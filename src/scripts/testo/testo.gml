///@description draw_text_border
///@arg x_place
///@arg y_place
///@arg font
///@arg english_text
///@arg italian_text
///@arg text_color
///@arg border_color
///@arg font_size
///@arg border_width
///@arg characters_to_newline
///@arg horizontal_alignment
///@arg vertical_alignment

function draw_text_border(_xx, _yy,  _fnt, _texteng, _textita=_texteng, _color=c_white, _borcolor=c_black, _size=1, _bo=1, _w=global.res_w/4, _halign=fa_center, _valign=fa_middle){
	
var col = draw_get_color();
draw_set_color(_borcolor);
draw_set_font(_fnt);
draw_set_valign(_valign);
draw_set_halign(_halign);

var lin;
if global.language = lang.eng
	lin = _texteng;
else if global.language = lang.ita
	lin = _textita;

draw_text_ext_transformed(_xx+_bo,_yy+_bo, lin, -1, _w, _size, _size, 0);
draw_text_ext_transformed(_xx-_bo,_yy-_bo, lin, -1, _w, _size, _size, 0);
draw_text_ext_transformed(_xx+_bo,_yy-_bo, lin, -1, _w, _size, _size, 0);
draw_text_ext_transformed(_xx-_bo,_yy+_bo, lin, -1, _w, _size, _size, 0);

draw_text_ext_transformed(_xx,_yy+_bo, lin, -1, _w, _size, _size, 0);
draw_text_ext_transformed(_xx,_yy-_bo, lin, -1, _w, _size, _size, 0);
draw_text_ext_transformed(_xx+_bo,_yy, lin, -1, _w, _size, _size, 0);
draw_text_ext_transformed(_xx-_bo,_yy, lin, -1, _w, _size, _size, 0);
draw_set_color(_color);
draw_text_ext_transformed(_xx,_yy, lin, -1, _w, _size, _size, 0);
}

//Variabile lunghezza in lingua
function lingua_lunga(_ita,_eng){
var lung;
if global.language = lang.eng
	lung = string_length(_eng);
else if global.language = lang.ita
	lung = string_length(_ita);
return lung;
}
