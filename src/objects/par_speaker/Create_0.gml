
//-----------Customise (FOR USER)
player = 0;
scr_comandi();
playerobject = obj_player;
interact_key = confirmPress;
detection_radius = 32;

ginocch = false;
destroy = false;
provato = false;

sprite_down = sprite_index;
sprite_lat = sprite_index;
sprite_up = sprite_index;

myVoice			= snd_voice1;
myPortrait		= -1;
myFont			= global.fofont;
myName			= "None";

myPortraitTalk		= -1;
myPortraitTalk_x	= -1;
myPortraitTalk_y	= -1;
myPortraitIdle		= -1;
myPortraitIdle_x	= -1;
myPortraitIdle_y	= -1;

//-----------Defaults Setup (LEAVE THIS STUFF)
reset_dialogue_defaults();