//Step
function scr_clicca(centrox,centroy, larghezza,altezza){
var x1 = centrox - larghezza;
var x2 = centrox + larghezza;
var y1 = centroy - altezza;
var y2 = centroy + altezza;
if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2)
	return true;
else
	return false;
}

//Draw
function rettangolo_click(centrox,centroy,larghezza,altezza, testo, colore, colore_bordo, colore_testo){
var x1 = centrox - larghezza;
var x2 = centrox + larghezza;
var y1 = centroy - altezza;
var y2 = centroy + altezza;
var w = 7;
draw_set_color(c_black);
draw_rectangle(x1-2,y1-2,x2+2,y2+2,false);
draw_set_color(colore_bordo);
draw_rectangle(x1,y1,x2,y2,false);
draw_set_color(colore);
draw_rectangle(x1+w,y1+w,x2-w,y2-w,false);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_tasti);
draw_text_outline(centrox,centroy,testo,colore_testo,1,1,0);
}

function tasto_premo(centrox,centroy,tasto){
var l = 12;
var b = l + 4;
draw_set_color(c_ltgrey);
draw_rectangle(centrox-b,centroy-b,centrox+b,centrox+b,false);
draw_set_color(c_gray);
draw_rectangle(centrox-l,centroy-l,centrox+l,centrox+l,false);
draw_set_font(fnt_base);
draw_text_outline(centrox,centroy,tasto,c_white,1,1,0);
}