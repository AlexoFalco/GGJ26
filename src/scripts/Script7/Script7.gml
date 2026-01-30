function Script7(){
if(charCount < str_len and !pause){
		
		#region Increment character counter (charCount) every frame, used for "typewriter"
		var tsc2 = text_speed_c*2;
		var txtspd = text_speed[page];
		if(text_speed_c+1 < text_speed_al and charCount == txtspd[tsc2+2]) {
			text_speed_c++;
			tsc2 = text_speed_c*2;
		}
		charCount += txtspd[tsc2+1];
		#endregion
		
		//Get Current Character
		var ch = string_char_at(text_NE, floor(charCount));
		
		#region Check for Pause, Voice, Animated Sprite
		switch(ch){
			case " ": break;
			case ",":
			case ".":
				pause = true;
				alarm[1] = 10;	//how many frames we wait if we detect a fullstop or comma
				break;
			
			case "?":
			case "!":
				pause = true;
				alarm[1] = 20;	//how many frames we wait if we detect a ! or ?
				break;
			default:
				
				//Play the voice sound every 2 frames (you can change this number if this is too often)
				var audio_increment = 2;
				
				#region Animated Sprite
				if(portrait_talk[page] != -1) {
					if(!pause) {
						var posx = pos_x-portraitWidth; var posy = pos_y;
						if(portrait_talk_x[page] != -1){ posx += portrait_talk_x[page] * scale; }
						if(portrait_talk_y[page] != -1){ posy += portrait_talk_y[page] * scale; }
		
						portrait_talk_c += portrait_talk_s[page];
		
						//To include the consideration of vowels
						//*/
						var l = string_lower(ch);
						if(l == "a" or l == "e" or l == "i" or l == "o" or l == "u"){ 
							portrait_talk_c = open_mouth_frame; 
							if (charCount > audio_c) { 
								audio_play_sound(voice[page], 1, false); 
								audio_c = charCount + audio_increment; 
							} 
						}
						/*/
						if (charCount > audio_c) { 
							audio_play_sound(voice[page], 1, false); 
							audio_c = charCount + audio_increment; 
						} 
						//*/
						if(portrait_talk_c > portrait_talk_n[page]){ portrait_talk_c = 0; }
						draw_sprite_ext(portrait_talk[page], portrait_talk_c, posx, posy, scale,scale, 0, $c6b3b8, 1);	
					}
				} 
				#endregion
				else if (charCount >= audio_c) { audio_play_sound(voice[page], 1, false); audio_c = charCount + audio_increment; }
		}
		#endregion
		
	}
}