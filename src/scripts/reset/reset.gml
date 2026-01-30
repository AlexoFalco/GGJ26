function partitaReset(){
//with obj_playercontrol
//{
//	start_position = (8-player);
//}
partita_iniziando = false;
//umani_finenti = 0;
//dati_corridore = undefined;
//ultimo_tempo_con = 0;
//ultima_posizione = 0;
gameover = false;
seleopzioni = 0;
selegameover = 0;
pausato = false;
punteggio = 0;
pp = 0;
messaggio_eng = "";
messaggio_ita = "";
audio_stop_sound(tema_musicale);
tema_musicale = -1;
fade_to_black = 0;

giri_totali = -1;
track_loop = -1;
lastlap = -1;

_sicuro = false;
_opsicuro = 1;
_opzionifine = false;
_seleopfine = 0;

timetrial_result = ["Too bad...\nTry again!","Peccato...\nProvaci ancora!"];


_titpos = -100;
{//allarmi in-game
	alarm[0] = 30;
}

}

function partitaFine(){
with obj_playercontrol
	if con.GPMode_select || (!con.GPMode_select && con.numero_gare = con.selenumerogare)	//Cancella i punti solo se è in un GP o in corse libere a più gare; se stai facendo gare libere, no
		punti = 0; 
chosenPista = noone;
chosenCoppa = noone;
//GPMode_select = false;
whereToRace = noone;
tempi_finali = [];
posizioni_finali = [];
posizioni_GP = [];
retries = 3;
vedi_classifica_gara = false;
numero_gare = 0;
old_tempobest = -1;
old_girobest = -1;
}