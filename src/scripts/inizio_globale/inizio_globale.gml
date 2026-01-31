function scr_inizio_globale(){
	randomize();
	//window_set_fullscreen(true);
	versione = GM_version;
	test = false;
	con = obj_control;

	global.fofont = font_add_sprite_ext(spr_font, "!?,.;:0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzàèéìòùÀÈÉÌÒÙ' @#§°%&+-/ñ()", true, 2)
	global.tastiSteam = font_add_sprite_ext(spr_tasti_steam,"0123456789ABC",true,2);
	global.tastiSony = font_add_sprite_ext(spr_tasti_sony,"0123456789ABC",true,2);
	global.tastiNintendo = font_add_sprite_ext(spr_tasti_nin,"0123456789ABC",true,2);
	draw_set_font(global.fofont);

	audio_group_load(effetti_sonori);
	
	enum lang {eng,ita/*,esp,fra,deu,jap,*/};
	global.language = lang.ita;
	traduzioni();
	scr_volume_crea();
	smartphone = noone;

	{//digitare il nome
	scrivendo = false;
	
	notset = ["Player 1","Player 2","Player 3","Player 4","Player 5","Player 6","Player 7","Player 8"];
	if !file_exists("ragnicoll.sav")
	{
		if !test
			keyboard_string = "Name" + string(notset[0]);
		else
			keyboard_string = "Zigoon";
		nome_errore = false;
		nome = keyboard_string;	
	}
	else
	{
		keyboard_string="";
	}
	
	nome_gio = notset;
	col_gio = [c_red,#9993FF,c_yellow,c_green, c_fuchsia, c_aqua, c_blue, c_orange];
	}
	
	{//Dimensioni schermo
		global.screen_w = window_get_width(); 
	global.screen_h = window_get_height();

	var ratio = global.screen_w / global.screen_h;
	global.res_h = global.screen_h;
	global.res_w = global.res_h * ratio;
	global.vertscreen = false;
	
	global.guiw = display_get_gui_width();
	global.guih = display_get_gui_height();
	}

	{//achievement
		//achievement_create();
	}

	{//impostazioni iniziali giocatore
	
		player = 0;
		/*if !instance_exists(obj_playercontrol)
		{
			var i;
			for (i = 1; i <= 8; i+=1)
			{
				playerbirth = i;
				var z = instance_create_depth(x,y,depth,obj_playercontrol);
				if playerbirth = 1
					z.ai_controlled = false;
			}
		}*/
		playerbirth = noone;
		NumGiocatori = 1;
		giocatori_pronti = 0;
	}

	{//salvataggio
		caricato = false;	
		prima_registrazione = false;
		//personaggi_sbloccati = 0;
		//coppe_sbloccate = 1;
		carte_sbloccate = [];
	}
		
	{//gameplay
		nome_musica = noone;
		background = -1;
		gameover = false;
		pausato = false;
		partita_iniziando = false;
		tema_musicale = snd_moveselect;
		_messSblocc = ["",""];
		
		inizio_musica = 0;
		fine_musica = 0;
		inizio_loop = 0;
		
		old_tempobest = -1;
		old_girobest = -1;
		timetrial_result = ["Too bad...\nTry again!","Peccato...\nProvaci ancora!"];
		
		{//menu principale
			premuto_per_iniziare = false;
			selemenu = 0;
			//menugiocatori = false;
			numgio = 1;
			modalitas_selezionata = false;
			riconoscimenti = false;
			tutorial = false;
			menuNomi = false;
			menumodalita = false;
			menudifficolta = false;
			modalitas = 1;
			difficoltas = 0;
			retries = 3;
			selenome = 0;
			selepausa = true;
			selemusica = 0;
			{//lista musiche
			lista_musiche = [/*"Crossing one thousand eighty skies",
			"dance of the windmill", "Robobunny Challenge",
			"Funky Island (Funk it UP)", "Night chase",
			"skeleton dance", "The Festival", "break in",
			"haunted engines", "The Soul-Eating Desert",
			"star catching game"*/];
			}
		}
		
		{//menu di pausa
			seleopzioni = 0;
			selegameover = 0;
			impostazioni = false;
			selimpostazioni = 0;
			regola_musica = false;
			regola_sfx = false;
			regola_durata = false;
			aiuto_guida = true;
			_sicuro = false;
			_opsicuro = 1;
			_opzionifine = false;
			_seleopfine = 0;
		}
		

	}
	
	//parte_audio(global.snd,snd_beach,1,false);
}