if(instance_number(obj_textevent)>1 or instance_number(obj_textbox)>0){ instance_destroy(); exit; }

//-----------Customise (FOR USER)
myVoice			= snd_voice2;
myTextCol		= $c6b3b8;
myPortrait		= -1;
myFont			= global.fofont;
myName			= "None";

//-----------Setup (LEAVE THIS STUFF)
myTextbox   = noone;
reset_dialogue_defaults();