function draw_spaced(ttext, xxx, yyy, coll){

		var cc = 1, cx = 0, cy = 0;
		repeat(string_length(ttext))
		{	
					letter = string_char_at(ttext, cc);
					
					draw_text_ext_color(xxx+cx, yyy+(cy*stringHeight), letter, 10, 10, coll, coll, coll, coll, 1); 
		
		
					//Increment variables for next letter
					cc += 1;
					oldcx = cx;
					cx += string_width(letter)+1;
					oldc = draw_get_color();
					if keyboard_check(ord("Q"))
					{
						draw_set_color(c_yellow)
						draw_rectangle(xxx + (oldcx)+1, yyy+(cy*stringHeight)+8, xxx + (cx)-2, yyy+(cy*stringHeight)+8, false)
						draw_set_color(oldc);
					}
		}
}