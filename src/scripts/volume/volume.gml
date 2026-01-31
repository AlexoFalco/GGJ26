///@description parte_audio
///@arg sound_or_sfx Use global.snd for music and global.sfx for sound effects
///@arg audio
///@arg priority
///@arg loops
///@arg sound_start If you want to change where the music starts
///@arg loop_end If you want to change where the music ends
///@arg loop_start If you want to change where the loop starts (if it isn't the same as the sound_start)
///@arg pitch
///@arg gain
///@arg offset

function parte_audio(variabile,suono,priority,loops,startsound=0,endloop=audio_sound_length(suono),startloop=startsound,pitch=1,gain=0,offset=0){//serve per sentire sia suoni che effetti sonori con il volume giusto, quindi a volume 0 non si sente niente per tutta la durata del brano
audio_sound_loop_start(suono,startloop);
audio_sound_loop_end(suono,endloop);
if variabile = global.snd
{
	{/*var endloop = function(e){
		switch tema_musicale
		{
			case snd_skeletondance: e = 64.2; break;
			default: e = audio_sound_length(tema_musicale); break;
		}
		return e;
	}*/}
	 //setta sempre l'endloop
	global.snd = audio_play_sound(suono,priority,loops,gain,offset,pitch);
	audio_sound_gain(global.snd,global.sndvol,gain);
	audio_sound_set_track_position(global.snd,startsound);
}
else if variabile = global.sfx
{
	global.sfx = audio_play_sound(suono,priority,loops,gain,offset,pitch);
	audio_sound_gain(global.sfx,global.sfxvol,gain);
	audio_sound_set_track_position(global.sfx,startsound);
}
}

///Questi script dovrebbero andare bene per tutti i giochi, se applicati nei giusti eventi di obj_control e se si ha cura di importante anche draw_text_border e spr_iconine

//Create
function scr_volume_crea(){
global.snd = false;
global.sfx = -1;
global.sfx2 = -1;
global.sndvol = 1;
global.sfxvol = 1;
global.tacchevol = 10;
}

//Begin Step
function scr_volume_bstep(){
if audio_is_playing(global.snd)
audio_sound_gain(global.snd,global.sndvol,0);
if audio_is_playing(global.sfx)
audio_sound_gain(global.sfx,global.sfxvol,0);
if audio_is_playing(global.sfx2)
audio_sound_gain(global.sfx2,global.sfxvol,0);
}

//Step
function musica_click(xx,yy,yy2){


if mouse_check_button_pressed(mb_left)
{
	if scr_clicca(xx,yy,16,16)
	{
		if global.sndvol < 1
			global.sndvol += 1/global.tacchevol;
		else
			global.sndvol = 0;
	}
	if scr_clicca(xx,yy2,16,16)
	{
		if global.sfxvol < 1
			global.sfxvol += 1/global.tacchevol;
		else
			global.sfxvol = 0;
	}
}
}

function abbassa_musica(){
if global.sndvol > 0
  {
    global.sndvol -= (1/global.tacchevol);  
  }
  
  audio_sound_gain(global.snd,global.sndvol,50);
}

function abbassa_effetti(){
	if global.sfxvol > 0
	{
	    global.sfxvol -= (1/global.tacchevol);  
	}
	suono_click();
}

function alza_musica(){
	if global.sndvol < 1
	{
		global.sndvol+= (1/global.tacchevol);  
	}
  
  audio_sound_gain(global.snd,global.sndvol,50);
}

function alza_effetti(){
	if global.sfxvol < 1
	  {
	    global.sfxvol += 1/global.tacchevol;  
	  }
	  suono_click();
}

//Draw
function disegna_musica(xx,yy,yy2=yy+30){
var w = c_white;		var r = c_red;		var gr = c_gray;
var v;	var col;


draw_set_font(fnt_gioco);
draw_set_halign(fa_left);
draw_set_color(c_teal);


var icow = sprite_get_width(spr_iconine)*2;
var iv;

for (iv = 0; iv < global.tacchevol; iv+=1)
{
	if iv = 0
		sub = 0;
	else
		sub = 1;
	
	if iv < global.sndvol*(global.tacchevol)
	{
		col = w; 
	}
	else
		col = gr;
	
	draw_sprite_ext(spr_iconine,sub,xx,yy,2,2,0,col,1); //icone del volume della musica
	
	if iv < global.sfxvol*(global.tacchevol)
	{
		col = r; 
	}
	else
		col = gr;
	draw_sprite_ext(spr_iconine,sub,xx,yy2,2,2,0,col,1); //icone del volume degli effetti sonori
	
	
	if mouse_check_button_pressed(mb_left)
	{
		if scr_clicca(xx,yy,8,16)
		{
			global.sndvol = (iv)*0.2;
			global.sfx = audio_play_sound(sfx_click,1,false);
			audio_sound_set_track_position(global.sfx,0.20);
			audio_sound_gain(global.sfx,global.sfxvol,0);
		}
		if scr_clicca(xx,yy2,8,16)
		{
			global.sfxvol = (iv)*0.2;
			global.sfx = audio_play_sound(sfx_click,1,false);
			audio_sound_set_track_position(global.sfx,0.20);
			audio_sound_gain(global.sfx,global.sfxvol,0);
		}
	}
	xx += icow;
}


//draw_text_transformed(xx,yy,xeff,1,1,0);
}

function suono_click(){
	parte_audio(global.sfx,sfx_click,1,false,0.20);	
}

function posizioni_audio_iniziali(){
audio_sound_set_track_position(sfx_click,0.20);
}

function crea_emettitore()
{
	sfx_emit = audio_emitter_create();
	sfx_dmax = 250;
	sfx_dmin = 10;
	audio_falloff_set_model(audio_falloff_linear_distance);
}

function emetti_suono(suono,emettitore,priority=0.2,loop=false,_gain=0,_offset=0,_pitch=1,startsound=0,endloop=audio_sound_length(suono),startloop=startsound){
	if ai_controlled
	{
		audio_sound_loop_start(suono,startloop);
		audio_sound_loop_end(suono,endloop);
		global.sfx = audio_play_sound_on(emettitore,suono,loop,priority,_gain-2,_offset,_pitch);
		audio_sound_gain(global.sfx,global.sfxvol,_gain);
		audio_sound_set_track_position(global.sfx,startsound);
	}
	else
		parte_audio(global.sfx,suono,priority,loop,startsound,endloop,startsound,_pitch,_gain,_offset);
}

function emetti_altro_suono(suono,emettitore,priority=0.2,loop=false,_gain=0,_offset=0,_pitch=1,startsound=0,endloop=audio_sound_length(suono),startloop=startsound){
		audio_sound_loop_start(suono,startloop);
		audio_sound_loop_end(suono,endloop);
		global.sfx = audio_play_sound_on(emettitore,suono,loop,priority,_gain,_offset,_pitch);
		audio_sound_gain(global.sfx,global.sfxvol,_gain);
		audio_sound_set_track_position(global.sfx,startsound);	
}