function scr_ombre(sprite, colore=c_white, img_indx = image_index, ombra = 0.5, _appiattimento = 0){
image_index = round(img_indx*100)/100; //maledetti floating numbers
draw_sprite_ext(sprite,img_indx,x+ombra,y+ombra+_appiattimento,image_xscale,image_yscale*0.8,image_angle,c_black,0.5);
draw_sprite_ext(sprite,img_indx,x,y,image_xscale,image_yscale,image_angle,colore,image_alpha);
}