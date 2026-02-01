#region roba inutile
#region MENU INIZIALE ZIGOON
function scr_menuiniziale_step(){
	
var primomenu = true;
if !menugiocatori && !impostazioni && !instance_exists(obj_highscore) && !riconoscimenti 
&& !prima_registrazione && !tutorial && !menupiste && !menuNomi && !menumodalita && !menudifficolta
	primomenu = true;
else
	primomenu = false;


if primomenu
{
	if downPress
	{
		selemenu++;
		if selemenu > MENUINIZIALE.ESCI
			selemenu = MENUINIZIALE.GIOCA;
	}
	else if upPress
	{
		selemenu--;
		if selemenu < MENUINIZIALE.GIOCA
			selemenu = MENUINIZIALE.ESCI;
	}

	if confirmPress
	{
		_messSblocc = ["",""];
		suono_click();
		switch selemenu
		{
			case MENUINIZIALE.GIOCA:
			{
				if !file_exists("ragnicoll.sav") //|| (file_exists("ragnicoll.sav") && versione = "0.0.0.0")
				{
					prima_registrazione = true;
					scrivendo = true;
					keyboard_string = nome;
				}
				else
				{
					menumodalita = true;
					modalitas_selezionata = true;
				}
			}
			break;
			/*case MENUINIZIALE.HOWTOPLAY:
				room_goto(tr_tutorial);
			break;
			case MENUINIZIALE.LISTANOMI:
				menuNomi = true;
			break;*/
			case MENUINIZIALE.IMPOSTAZIONI:
				impostazioni = true;
			break;
			case MENUINIZIALE.RICONOSCIMENTI:
				riconoscimenti = true;
			break;
			case MENUINIZIALE.ESCI:
				game_end();
		}
	}
}
else if impostazioni
	scr_impostazioni_step();
else if menumodalita
{
	menu_modalita_step();
}
else if menuNomi
{
	menu_nomi_step();	
}
else if riconoscimenti
{
	riconoscimenti_step();
}
else if instance_exists(obj_highscore)
{
	if backPress || confirmPress
		instance_destroy(obj_highscore);
}
else if prima_registrazione
{
	{
		scr_scrivinome();
		
		if pausePress && keyboard_string != ""
		{
			scrivendo = false;
			
			menugiocatori = true;
			prima_registrazione = false;
		}
			
	}
}

else if tutorial
{
	if (backPress || confirmPress || pausePress)
		tutorial = false;
}


}

function scr_menuiniziale_draw(){
var _guix = display_get_gui_width(), _guiy = display_get_gui_height();
if !menugiocatori && !impostazioni && !instance_exists(obj_highscore) && !riconoscimenti && !prima_registrazione && !tutorial && !menuNomi
{
	var _inmen = [], _i, _yi = [],
	_eng = ["Play","How to Play",/*"Leaderboard",*/"Name List","Settings","Credits","Exit Game"],
	_ita = ["Gioca","Come si gioca",/*"Classifica",*/"Lista Nomi","Impostazioni","Riconoscimenti","Esci dal gioco"];
	for (_i = 0; _i <= MENUINIZIALE.ESCI; _i++)
	{
		if selemenu = _i
			_inmen[_i] = c_red;
		else
			_inmen[_i] = c_white;
		_yi[_i] = 80+(30*_i);
		draw_text_border(_guix*15/16,_yi[_i],fnt_gioco,_eng[_i],_ita[_i],_inmen[_i],,,,,fa_right);
	}
	
	if _messSblocc[0] != ""
	{
		draw_text_border(_guix/3,_guiy/2,fnt_gioco,_messSblocc[0],_messSblocc[1]);	
	}
}

else if riconoscimenti
{
	riconoscimenti_draw();
}
else if prima_registrazione
{
	registrazione_draw();
}
else if tutorial
{
	tutorial_draw();	
}
else if menuNomi
{
	menu_nomi_draw();	
}

}
#endregion

#region ALTRI MENU INUTILI QUI
function tutorial_draw(){
	
	var _teng = @"Welcome to Bug Race!
In this game you are a bug of your choice and must race against seven other competitors for the glory of the Bug World!

Controls:
left/right (arrows/D-pad): move
Z key/A button/up (arrow/DPad): jump
X key/B button: float
C key/X button: use item

Items:
Cherry: gives a passive boost to your max speed
Pollen: gives you a boost for a short time
Leaf: recovers hearts and wings
Spray: damages foes in front of you
Fumigator: drops down and lights up a fire
Racket: damages foes around you",
	_tita = @"Benvenuto in Bug Race!
In questo gioco vesti i panni di un insetto a tua sceta e devi affrontarne altri sette in una gara per la gloria del Mondo degli Insetti!

Comandi:
frecce/croce a sinistra/destra: muovi
tasto Z (PC)/tasto A (controller)/freccia su/croce su: salta
tasto X (PC)/tasto B (controller): plana
tasto C (PC)/tasto X (controller): usa oggetto


Oggetti:
Ciliegia: aumenta passivamente la tua velocità
Polline: acceleri per pochi secondi
Foglia: restituisce cuori e ali
Spray: toglie cuori ai nemici di fronte a te
Zampirone: cade in basso e genera fiamme
Racchetta: infligge danni ai nemici intorno", 
	_guix = display_get_gui_width(), _guiy = display_get_gui_height();

	draw_text_border(_guix/2,_guiy*2/5,fnt_annuncino,_teng,_tita,,,,,500)
	
}

function menu_modalita_step(){
	if !menupiste
	{
		if !modalitas_selezionata
		{
			if !menugiocatori && !menudifficolta
			{
				if upPress
					modalitas--;
				
				if downPress
					modalitas++;
				
				modalitas = (modalitas + 3) mod 3;
				
				if dxPress || sxPress
					menudifficolta = true;
		
		
			}
			else if menudifficolta && !menugiocatori
			{
				menu_difficolta_step();	
			}
	
			//else if menugiocatori
				//menu_giocatori_step();
	
			if confirmPress
			{
				suono_click();
				switch modalitas
				{
					case 0: GPMode_select = true;  sfidaATempo = false; break; //devi aggiungere anche una variabile per il time trial
					case 2: GPMode_select = false; sfidaATempo = true; break;
					default: GPMode_select = false; sfidaATempo = false;
				}
			
				if sfidaATempo
				{
					numgio = 1;
				}
		
				modalitas_selezionata = true;
				
			}
	
			if backPress && !menugiocatori
			{
				menumodalita = false;
				menudifficolta = false;
			}
		}
		else
		{			
			if backPress
			{
				modalitas_selezionata = false;
				menumodalita = false;
				with obj_playercontrol
				{
						pg_selezionato = false;
				}
				con.giocatori_pronti = 0;
				
				if sfidaATempo
				{
					menugiocatori = false;
					sfidaATempo = false;
				}
			}
		}
	}
	else
		scr_menupiste_step();
}

function menu_difficolta_step(){
	if !modalitas_selezionata
	{
	
		if upPress
			difficoltas--;
	
		if downPress
			difficoltas++;
		
		difficoltas = (difficoltas+3) mod 3;
		
		if sxPress || dxPress
			menudifficolta = false;
	}
	
}

function registrazione_draw(){
	var _guix = display_get_gui_width(), _guiy = display_get_gui_height(), _colnome = c_white,
	_eng, _ita;
	draw_text_border(_guix/2, _guiy/3,fnt_gioco,"Write down your name, then press Enter to get in action!","Scrivi il tuo nome, poi premi Invio per entrare in azione!");
	if scrivendo
	{
		_colnome = c_green;
		if !nome_errore
		{
			_eng = "Enter = Confirm\nMax 15 characters";
			_ita = "Invio = Conferma\nMassimo 15 caratteri";
		}
		else
		{
			_eng = "This name is already registered.";
			_ita = "Questo nome è già registrato.";
		}
		draw_text_border(_guix/2,_guiy*2/3,fnt_gioco,_eng,_ita,,,,,300);
	}
	draw_text_border(_guix/2,_guiy*2/3-30,fnt_gioco,nome,,_colnome);
}

function menu_nomi_step()
{
	if !scrivendo
	{
		if backPress
			menuNomi = false;
		
		if downPress
			selenome++;
		if upPress
			selenome--;
		if dxPress
			selenome+=6;
		if sxPress
			selenome-=6;
	
		with obj_playercontrol
		{
			nome_PG = con.lista_nomi[player-1];
			con.nome_gio[player-1] = nome_PG;
			if player-1 < 4
				con._nomeAttivo[player-1].nome = con.nome_gio[player-1];
		}
		
	
		if confirmPress
		{
			scrivendo = true;
			if selenome = 0
				keyboard_string = "";
			else
				keyboard_string = lista_nomi[selenome-1];
		}
	}
	else
	{
		//keyboard_string = lista_nomi[selenome-1];
		scr_scrivinome();
		if pausePress
		{
			if selenome = 0
			{
				array_push(lista_nomi,keyboard_string);
				var _nL = array_length(lista_nomi);
				array_push(lista_colori,choose(c_red,c_yellow,c_blue,c_green,c_aqua,c_orange));
				ini_open("ragnicoll.sav");
				ini_write_string("Record",$"Nome {_nL-1}",lista_nomi[_nL-1]);
				ini_write_string("Altro",$"colore {_nL}",lista_colori[_nL-1]);
				ini_write_string("Record","Nomi salvati",_nL);
				ini_close();
			}
			else
			{
				array_set(lista_nomi,selenome-1,keyboard_string);
				ini_open("ragnicoll.sav");
				ini_write_string("Record",$"Nome {selenome-1}",lista_nomi[selenome-1]);
				ini_close();
			}
		}
	}

	selenome = (selenome+(array_length(lista_nomi)+1)) mod (array_length(lista_nomi)+1);
}

function menu_nomi_draw()
{
	var _yi = [], _xx = [], _guix = display_get_gui_width(), _guiy = display_get_gui_height(),
	_sn = [], _opit = ["",$"Aggiungi nomi selezionando 'Aggiungi' con {scr_input(comandi.A)}", $"Modifica i nomi premendo {scr_input(comandi.A)} sul nome corrispondente", $"Premi {scr_input(comandi.start,lang.ita)} per confermare"], 
	_open = ["",$"Select 'Add' with {scr_input(comandi.A)} to add a name",$"To edit names, press {scr_input(comandi.A)} on the name you want to change",$"Press {scr_input(comandi.start,lang.eng)} to confirm"],
	_xop = _guix/2;
	
	for (var _h = 0; _h < 3; _h++)
	{
		draw_text_border(_xop,30+_h*20,fnt_annuncino,_open[_h+1],_opit[_h+1],c_white);
	}
	
	for (var _i = 0; _i <= array_length(lista_nomi); _i++)
	{	
		var _writE = [],  _writI = [];
		
		if selenome = _i && !scrivendo
		{
			if _i = 0
			{
				_writE[_i] = "Add";
				_writI[_i] = "Aggiungi";
			}
			else
			{
				_writE[_i] = lista_nomi[_i-1];
				_writI[_i] = _writE[_i];
			}
			_sn[_i] = c_red;
		}
		else if selenome = _i && scrivendo
		{
			_writE[_i] = keyboard_string; _writI[_i] = _writE[_i];
			_sn[_i] = c_green;
		}
		else
		{
			if _i = 0
			{
				_writE[_i] = "Add";
				_writI[_i] = "Aggiungi";
			}
			else
			{
				_writE[_i] = lista_nomi[_i-1];
				_writI[_i] = _writE[_i];
			}
			_sn[_i] = c_white;
		}
			
		_xx[_i] = _guix*3/16+(_guix*2.5/16*(_i div 6));
		_yi[_i] = (90+(30*(_i mod 6)));
		
		if _i = 0
			draw_text_border( _guix*3/16, 90, fnt_gioco, _writE[0], _writI[0],_sn[_i]);
		else
			draw_text_border(_xx[_i],_yi[_i],fnt_annuncino,_writE[_i],_writI[_i],_sn[_i],/*lista_colori[_i-1]*/);
	}
}

function selezione_modalita_rettangolo(_xx, _yy){
	var _l = 75, _h = 70, _w = 3;
	draw_set_color(c_red);
	draw_line_width(_xx-_l,_yy-_h,_xx+_l,_yy-_h,_w);
	draw_line_width(_xx-_l,_yy+_h,_xx+_l,_yy+_h,_w);
	draw_line_width(_xx-_l,_yy-_h,_xx-_l,_yy+_h,_w);
	draw_line_width(_xx+_l,_yy-_h,_xx+_l,_yy+_h,_w);
}
function menu_modalita_draw()
{
	var _guix = display_get_gui_width(), _guiy = display_get_gui_height();
	var _numg = [], _i, _yi = [],
	_eng = ["Grand Prix", "Quick Run", "Time Trial"], 
	_ita= ["Gran Premio", "Gara Rapida", "Sfida a Tempo"], _colbase = c_white;
	
	if menudifficolta
		_colbase = c_gray;
	
	if !modalitas_selezionata
	{
		for (_i = 0; _i <= 2; _i++)
		{
			if modalitas = _i
				_numg[_i] = c_red;
			else
				_numg[_i] = _colbase;
			_yi[_i] = 120+(30*_i);
			draw_text_border(_guix/3,_yi[_i],fnt_gioco,_eng[_i],_ita[_i],_numg[_i]);
		}
		var _xq;
		if !menudifficolta //&& !menugiocatori
			_xq = _guix/3;
		else if menudifficolta
			_xq = _guix*2/3;
		selezione_modalita_rettangolo(_xq,_guiy/2-20);
	}
	else
	{
		if !menupiste
		{
			disegna_personaggi();
			if giocatori_pronti = NumGiocatori && !partita_iniziando
			{
				draw_set_alpha(0.5);
				draw_set_color(c_lime);
				draw_rectangle(0,_guiy/2-20,_guix,_guiy/2+20,false);
				draw_set_alpha(1);
				draw_text_border(_guix/2,_guiy/2-10,fnt_gioco,"Countdown","Countdown",c_white,c_red);
			}
		}
		else
		{
			disegna_menu_piste();
			if partita_iniziando && alarm[2] <= 60
			{
				if _titpos < _guix/2
					_titpos+= 10;
				draw_text_border(_titpos-4,_guiy/2+4,fnt_titolo,"Let's begin!","Iniziamo!",c_dkgray,c_dkgray,,,1000);
				draw_text_border(_titpos,_guiy/2,fnt_titolo,"Let's begin!","Iniziamo!",c_yellow,c_red,,,1000);
			}
		}
	}
	
}

function menu_difficolta_draw()
{
	var _guix = display_get_gui_width()*2/3, _guiy = display_get_gui_height();
	var _numg = [], _i, _yi = [],
	_eng = [/*"Very Easy",*/"Easy", "Normal", "Hard"/*,"Very Hard","Impossible"*/], 
	_ita= [/*"Molto facile",*/"Facile", "Normale", "Difficile",/*"Molto difficile","Impossibile"*/],
	c_base = c_white;
	
	if !menudifficolta
		c_base = c_gray;
		
	if !modalitas_selezionata
	{
		for (_i = 0; _i <= 2; _i++)
		{
			if difficoltas= _i
				_numg[_i] = c_red;
			else
				_numg[_i] = c_base;
			_yi[_i] = 120+(30*_i);
			draw_text_border(_guix,_yi[_i],fnt_gioco,_eng[_i],_ita[_i],_numg[_i]);
		}
	}
}

function menu_giocatori_draw()
{
	/*var _guix = display_get_gui_width(), _guiy = display_get_gui_height();
	var _numg = [], _i, _yi = [],
	_eng = ["Solo Mode", "2-player mode", "3-player mode", "4-player mode"], 
	_ita= ["1 giocatore", "2 giocatori", "3 giocatori", "4 giocatori"];
	if !modalitas_selezionata
	{
		for (_i = 0; _i <= 3; _i++)
		{
			if numgio-1 = _i
				_numg[_i] = c_red;
			else
				_numg[_i] = c_white;
			_yi[_i] = 105+(30*_i);
			draw_text_border(3*_guix/4,_yi[_i],fnt_gioco,_eng[_i],_ita[_i],_numg[_i]);
		}
		if numgio > 2
		draw_text_border(_guix*3/4,_yi[3]+40,fnt_annuncino,
		"TIP: if you are more than 2 players, we suggest you use controllers!",
		"CONSIGLIO: se siete più di due giocatori, consigliamo di usare dei controller!",
		,,,,200);
	}*/
}
#endregion



#region PAUSA
function scr_menu_pausa_step(){
	


if !impostazioni && pausePress && alarm[4] <= 0
	pausato = false;

if !impostazioni
{
{//cambio selezione
	if !_sicuro
		{
		if downPress
		{
			seleopzioni++;
			if seleopzioni > OPZIONIPAUSA.ESCI
				seleopzioni = OPZIONIPAUSA.CONTINUA;
			if seleopzioni = OPZIONIPAUSA.RICOMINCIA && retries <= 0
				seleopzioni++;
		}
		else if upPress
		{
			seleopzioni--;
			if seleopzioni < OPZIONIPAUSA.CONTINUA
				seleopzioni = OPZIONIPAUSA.ESCI;
			if seleopzioni = OPZIONIPAUSA.RICOMINCIA && retries <= 0
				seleopzioni--;
		}
	
		seleopzioni = max(0,seleopzioni+OPZIONIPAUSA.ESCI mod OPZIONIPAUSA.ESCI);
	}
	else
	{
		if downPress
			_opsicuro = 1;
		else if upPress
			_opsicuro = 0;
	}
}

var _guix = display_get_gui_width(), _guiy = display_get_gui_height();

{//selezione fatta
	if confirmPress || mouse_check_button_pressed(mb_left)
	{
		suono_click();
		if !_sicuro
		{
			switch seleopzioni
			{
				case OPZIONIPAUSA.CONTINUA:
				{
					pausato = false;
					seleopzioni = 0;
				}
				break;
				case OPZIONIPAUSA.ESCI:
				{
					_sicuro = true;
				}
				break;
				case OPZIONIPAUSA.RICOMINCIA:
				{
					_sicuro = true;
				}
				break;
				case OPZIONIPAUSA.IMPOSTAZIONI:
				{
					impostazioni = true;	
				}
				break;
			}
		}
		else
		{
			switch _opsicuro
			{
				case 0: 
				{
					switch seleopzioni
					{
						case OPZIONIPAUSA.ESCI:
						{
							partita_iniziando = false;
							partitaReset();
							partitaFine();
							audio_stop_all();
							room_goto(rm_title);
							impostazioni = false;
							if selenumerogiri != 0
								giri_totali = selenumerogiri-1;
						}
						break;
						case OPZIONIPAUSA.RICOMINCIA:
						{
							partitaReset();
							if GPMode_select
								retries--;
							room_goto(room);
							impostazioni = false;
							if selenumerogiri != 0
								giri_totali = selenumerogiri-1;
						}
						break;
					}
				}
				break;
				case 1: _sicuro = false; break;
			}
		}
	}
}
}
else if impostazioni
	scr_impostazioni_step();
}

function menu_pausa_draw(_xx = display_get_gui_width()/2, _yy = display_get_gui_height()/2){
	var _guix = display_get_gui_width(), _guiy = display_get_gui_height(), 
	_colsel = [], _opzy = [], 
	_opzioni = [["CONTINUE","CONTINUA"],["RESTART","RICOMINCIA"],["SETTINGS","IMPOSTAZIONI"],["EXIT","ESCI"]],
	_buffini = 0, _rx = _guix/5, _ry = _guiy/4, _ingl, _itl;
	
	colori_piste();
	draw_set_alpha(0.7);
	draw_rectangle_color(_xx-100,_yy-55,_xx+100,_yy+115,colore_pista_1,colore_pista_2,colore_pista_1,colore_pista_2,false);
	draw_set_alpha(1);
	draw_rectangle_color(_xx-100,_yy-55,_xx+100,_yy+115,c_black,c_black,c_black,c_black,true);
	
	for (var _i = 0; _i <= OPZIONIPAUSA.ESCI; _i++)
	{
		if seleopzioni = _i
			_colsel[_i] = c_red;
		else
			_colsel[_i] = c_white;
		_opzy[_i] = _guiy*(3+_i)/8;
		draw_text_border(_xx,_opzy[_i],fnt_gioco,_opzioni[_i][lang.eng],_opzioni[_i][lang.ita],_colsel[_i]);
	}
	
	if retries = 0
		draw_rectangle_color(_xx-80,_opzy[1]+6,_xx+80,_opzy[1]+10,c_red,c_red,c_red,c_red,false);
	
	
	//Sei sicuro?
	var _colsic = [], _sicy = [];
	if _sicuro
	{
		draw_rectangle_color(_guix/2-70,_guiy/2-40,_guix/2+70,_guiy/2+40,colore_pista_1,colore_pista_2,colore_pista_1,colore_pista_2,false);
		draw_rectangle_color(_guix/2-70,_guiy/2-40,_guix/2+70,_guiy/2+40,c_black,c_black,c_black,c_black,true);
		
		for (var _s = 0; _s <= 1; _s++)
		{
			if _opsicuro = _s
				_colsic[_s] = c_red;
			else
				_colsic[_s] = c_white;
				
			_sicy[_s] = _guiy/2 - 10 + 20*_s;
			draw_text_border(_guix/2, _sicy[_s], fnt_gioco, _opSiNo[_s][lang.eng], _opSiNo[_s][lang.ita], _colsic[_s]);
		}
		draw_text_border(_guix/2, _sicy[0]-30, fnt_gioco, _opSeiSicuro[lang.eng], _opSeiSicuro[lang.ita], c_white);

		
		if GPMode_select
		{
			for (var _q = 1; _q <= 3; _q++)
				draw_sprite_ext(spr_pwup,0,	(_guix/2-60)+30*_q,_guiy/2+40,3,3,0,c_black,1);
			for (var _r = 1; _r <= retries; _r++)
			{
				draw_sprite_ext(spr_pwup,0,	(_guix/2-60)+30*_r,_guiy/2+40,3,3,0,c_white,1);
			}
		}
	}
	
}
#endregion
function rettangolo_opzioni()
{
	if vedistat
	{
		var _rx, _ry,_guix = display_get_gui_width(), _guiy = display_get_gui_height();
		draw_set_color(c_red);
		switch selestat
		{
			case BUFFS.HP: case BUFFS.RES: {_rx = _guix/5;} break;
			case BUFFS.BUFFDOUBLER: {_rx = _guix/5+50;} break;
			case BUFFS.MP: case BUFFS.SPD: {_rx = _guix/5 + 100;} break;
			case BUFFS.DEBUFFDOUBLER: {_rx = _guix/5+150;} break;
			case BUFFS.ATK: case BUFFS.CRT: {_rx = _guix/5 + 200;} break;
			case BUFFS.HEAL: {_rx = _guix/5+250;} break;
			case BUFFS.DEF: case BUFFS.EXP: {_rx = _guix/5 + 300;} break;
			case BUFFS.PRICE: {_rx = _guix/5+350;} break;
			case BUFFS.MAG: case BUFFS.GOLD: {_rx = _guix/5 + 400;} break;
		}
		
		{
			if selestat <= BUFFS.MAG
				_ry = _guiy/4;
			else if selestat > BUFFS.MAG && selestat < BUFFS.BUFFDOUBLER
				_ry = _guiy/4+50;
			else if selestat >= BUFFS.BUFFDOUBLER
				_ry = _guiy/4+100;
		}
		draw_rectangle(_rx,_ry,_rx+40,_ry+40,true);
	}
}
#endregion
function scr_impostazioni_step()
{
	if regola_musica = false && regola_sfx = false && !regola_durata
	{
		if upPress
		{
			selimpostazioni--;
		}
		else if downPress
		{
			selimpostazioni++;
		}
		
		selimpostazioni = (selimpostazioni+IMPOST.FATTO+1) mod (IMPOST.FATTO+1);
	
		if confirmPress
		{
			suono_click();
			switch selimpostazioni
			{
				case IMPOST.FATTO:
					room_goto(room_menu_main);
				break;
				case IMPOST.MUSICA:
					regola_musica = true;
				break;
				case IMPOST.SFX:
					regola_sfx = true;
				break;
				case IMPOST.DURATA:
				{
					regola_durata = true;
				}
				break;
			}
		}
		
		if backPress && !scrivendo && !regola_musica && !regola_sfx && !regola_durata
			room_goto(room_menu_main);
	}
	else if regola_musica
	{
		if sxPress
			abbassa_musica();
		else if dxPress
			alza_musica();
		if confirmPress	|| backPress || pausePress
		{
			suono_click();
			//scr_salva_volume();
			regola_musica = false;
		}
	}
	else if regola_sfx
	{
		if sxPress
			abbassa_effetti();
		else if dxPress
			alza_effetti();
		if confirmPress || backPress || pausePress
		{
			suono_click();
			regola_sfx = false;
		}
	}
	else if regola_durata
	{
		if sxPress && timeSessionBase > 3599
			timeSessionBase-=3600;
		else if dxPress && timeSessionBase < 35999
			timeSessionBase+=3600;
		if backPress || confirmPress || pausePress
		{
			suono_click();
			regola_durata = false;
		}
	}
}

function scr_impostazioni_draw()
{
	var _guix = display_get_gui_width(), _guiy = display_get_gui_height(),
	_sel = [], bandiera, 
	_aiue, _aiui, _colai = c_green, _colnome = c_white, _coldur = c_white,
	
	opzioni = [["Music volume","Volume musica"],["Sound effects volume","Volume effetti sonori"],["Game length","Durata partita"],["Done","Fatto"]],
	
	_sing = "i";
	
	if timeSessionBase <= 3600
		_sing = "o"
		
	if regola_durata
		_coldur = c_green;
	
	
	disegna_musica(_guix/2-90,global.guih/4,global.guih/4+90);
	draw_text_border(global.guiw/2-90,	global.guih/4+180,font_text,$"{(timeSessionBase+1) div 3600} minutes",$"{(timeSessionBase+1) div 3600} minut{_sing}",_coldur,,,,,fa_left);
	
	for (var _i = 0; _i <= IMPOST.FATTO; _i++)
	{
		if selimpostazioni = _i
			_sel[_i] = c_red;
		else
			_sel[_i] = c_white;
		
		draw_text_border(global.guiw/8,	global.guih/4+90*_i,		font_text,	opzioni[_i][global.language],,			_sel[_i],,,,,fa_left);
	}
	
	draw_text_border(global.guiw/3,global.guih/16,font_title,"Settings","Impostazioni");
	draw_text_border(global.guiw/8,2*global.guih/3,font_text,$"{scr_input(comandi.A)}: select        {scr_input(comandi.B,lang.eng)}: exit",
	$"{scr_input(comandi.A,lang.ita)}: seleziona       {scr_input(comandi.B,lang.ita)}: esci")
	
	
	
	{//debug
	//debug_text($"{selimpostazioni}",30,30);
	}
	
	
	
	
}

#region RICONOSCIMENTI
//function riconoscimenti_step(){
	
//	if (backPress || pausePress)
//		riconoscimenti = false;
//}

function riconoscimenti_draw(){
	var _guix = display_get_gui_width(), _guiy = display_get_gui_height(),
	_credits = ["Game developed for the\n2026 Edition of the Global Game Jam\n\nProgrammers\nAlexoFalco\nMyMadnessWorks\nZigoon\n\nGraphic design\nLeira\nLorenzo\n\nSound design\nMyMadnessWorks",
	"Gioco sviluppato per la\nGlobal Game Jam (edizione 2026)\n\nProgrammatori\nAlexoFalco\nMyMadnessWorks\nZigoon\n\nDesign grafico\nLeira\nLorenzo\n\nMusica e SFX\nMyMadnessWorks"];
	draw_text_border(_guix/2,5*_guiy/7,font_text,_credits[global.language],,,,,,1000);
}
#endregion