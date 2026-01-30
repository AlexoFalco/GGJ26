depth = -y;

if destroy
{
	image_alpha-=0.01;
	if image_alpha <= 0
		instance_destroy();
}

if obj_player.selezionato = id//(point_in_rectangle(playerobject.x, playerobject.y, x-dr, y-dr, x+dr, y+dr))
{
	if(myTextbox != noone)
	{ 
		if(!instance_exists(myTextbox))
		{
			myTextbox = noone; 
			exit; 
		}
	}
	//if I haven't already created my textbox, make one:
	else if(keyboard_check_pressed(interact_key))
	{
		if(instance_exists(obj_textbox) || obj_camera.blackscreenon || obj_camera.following != obj_player)
		{ 
			exit; //exit if a textbox already exists
		}
		event_user(0);	//if you need variables to update for text
			
		//Hand over variables
			with obj_player
			{
				if sprite_index == spr_player_lat
				{
					other.sprite_index = other.sprite_lat;
					other.image_xscale = -image_xscale;
				}
				else
					other.sprite_index = other.sprite_down;
					
					
				if other.ginocch == true
				{
					if sprite_index == spr_player_lat
						sprite_index = spr_player_lat_gin;
				}
			}
		
		
		create_dialogue(myText, mySpeaker, myEffects, myTextSpeed, myTypes, myNextLine, myScripts, myTextCol, myEmotion, myEmote);
	}
}/*
else 
{	//if player moves outside of detection radius
	if(myTextbox != noone)
	{
		with(myTextbox) 
			instance_destroy();
		myTextbox = noone;
	}
}
