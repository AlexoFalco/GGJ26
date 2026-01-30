function scr_comandi(){
	
	function scr_tasti_base()
	{
		//il primo dell'array è il player 0 che è obj_control; gli altri sono i giocatori
		tastoA = [ord("Z"),ord("Z"),ord("E"),ord("Y"),ord("O"),-1,ord("O"),ord("O"),ord("O")];
		tastoB = [ord("X"),ord("X"),ord("Q"),ord("R"),ord("M"),ord("O"),ord("O"),ord("O"),ord("O")]; //189 = "-"
		tastoX = [ord("C"),ord("C"),ord("R"),ord("U"),ord("P"),ord("O"),ord("O"),ord("O"),ord("O")];
		tastoSu = [vk_up,vk_up,ord("W"),ord("T"),ord("I"),ord("O"),ord("O"),ord("O"),ord("O"),];
		tastoGiu = [vk_down,vk_down,ord("S"),ord("G"),ord("K"),ord("O"),ord("O"),ord("O"),ord("O")];
		tastoSinistra = [vk_left,vk_left,ord("A"),ord("F"),ord("J"),ord("O"),ord("O"),ord("O"),ord("O")];
		tastoDestra= [vk_right,vk_right,ord("D"),ord("H"),ord("L"),ord("O"),ord("O"),ord("O"),ord("O")];
		tastoR2= [ord("V"),ord("B"),ord("N"),ord("M"),ord("M"),ord("O"),ord("O"),ord("O"),ord("O")]; 
		tastoStart= [vk_enter,vk_enter,vk_enter,vk_enter,vk_enter,ord("O"),ord("O"),ord("O"),ord("O")];
		tastoSelect= [vk_space,vk_space,vk_space,vk_space,vk_space,ord("O"),ord("O"),ord("O"),ord("O")];
	}
	
	{//per quando vorrai implementare la modifica dei tasti
		/*function scr_tasti_modificati(){
			ini_open("ragnicoll.sav");
			//codice codice
			ini_close();
		}
	
		if file_exists("ragnicoll.sav")
			scr_tasti_modificati();
		else*/
			scr_tasti_base(); //questa riga falla funzionare anche adesso che non c'è niente del resto
	}
	
	holdA = keyboard_check(tastoA[player]);
	holdB = keyboard_check(tastoB[player]);
	holdX = keyboard_check(tastoX[player]);
	holdSu = keyboard_check(tastoSu[player]);
	holdGiu = keyboard_check(tastoGiu[player]);
	holdSinistra = keyboard_check(tastoSinistra[player]);
	holdDestra = keyboard_check(tastoDestra[player]);
	holdR2 = keyboard_check(tastoR2[player]);
	holdStart = keyboard_check(tastoStart[player]);
	holdSelect = keyboard_check(tastoSelect[player]);
	
	pressA = keyboard_check_pressed(tastoA[player]);
	pressB = keyboard_check_pressed(tastoB[player]);
	pressX = keyboard_check_pressed(tastoX[player]);
	pressSu = keyboard_check_pressed(tastoSu[player]);
	pressGiu = keyboard_check_pressed(tastoGiu[player]);
	pressSinistra = keyboard_check_pressed(tastoSinistra[player]);
	pressDestra = keyboard_check_pressed(tastoDestra[player]);
	pressR2 = keyboard_check_pressed(tastoR2[player]);
	pressStart = keyboard_check_pressed(tastoStart[player]);
	pressSelect = keyboard_check_pressed(tastoSelect[player]);
	releaseA = keyboard_check_released(tastoA[player]);
	releaseDown = keyboard_check_released(tastoGiu[player]);
	{
		
	var _pp; //serve per permettere al giocatore 1 di navigare dai menu anche su console, nonché per permettere agli altri di usare i comandi giusti
	if player = 0
		_pp = 0;
	else
		_pp = player-1;
	
	GP = gamepad_is_supported();
	gamepad_set_axis_deadzone(_pp,0.5)
	haxis = gamepad_axis_value(_pp, gp_axislh);
	vaxis = gamepad_axis_value(_pp, gp_axislv);
	
	dhaxis = gamepad_axis_value(_pp,gp_axisrh);
	dvaxis = gamepad_axis_value(_pp,gp_axisrv);

	sxHold = holdSinistra || gamepad_button_check(_pp,gp_padl);
	dxHold = holdDestra || gamepad_button_check(_pp,gp_padr);
	sxPress = pressSinistra || gamepad_button_check_pressed(_pp,gp_padl);
	dxPress = pressDestra || gamepad_button_check_pressed (_pp,gp_padr);

	downHold = holdGiu || gamepad_button_check(_pp,gp_padd);
	upHold = holdSu || gamepad_button_check(_pp,gp_padu);
	downPress = pressGiu || gamepad_button_check_pressed(_pp,gp_padd);
	upPress = pressSu || gamepad_button_check_pressed(_pp,gp_padu);
	
	//triggerL = pressL1 || gamepad_button_check_pressed(_pp,gp_shoulderlb)
	//triggerR = pressR1 || gamepad_button_check_pressed(_pp,gp_shoulderrb)
	triggerPress = pressR2 || gamepad_button_check_pressed(_pp,gp_shoulderr) || gamepad_button_check_pressed(_pp,gp_shoulderl);

	pausePress = pressStart || gamepad_button_check_pressed(_pp,gp_face4) || gamepad_button_check_pressed (_pp,gp_start);
	pauseHold = holdStart || gamepad_button_check(_pp,gp_face4) || gamepad_button_check (_pp,gp_start);
	backPress = pressB || gamepad_button_check_pressed(_pp,gp_face2);
	objectPress = pressX || gamepad_button_check_pressed(_pp,gp_face3);
	backHold = holdB || gamepad_button_check(_pp,gp_face2);
	confirmPress = pressA || gamepad_button_check_pressed(_pp,gp_face1);
	confirmHold = holdA || gamepad_button_check(_pp,gp_face1);
	selectPress = pressSelect || gamepad_button_check_pressed(_pp,gp_select);
	//magicoatt = keyboard_check_pressed(ord("C")) || gamepad_button_check_pressed(_pp,gp_face3);

	
	//downRelease = keyboard_check_released(vk_down) || gamepad_button_check_released(_pp,gp_padd)
	confirmRelease = releaseA || gamepad_button_check_released(_pp,gp_face1);
	
	click_sx = mouse_check_button_pressed(mb_left);
	if obj_control.smartphone
		sclick_sx = mouse_check_button_released(mb_left);
	else
		sclick_sx = mouse_check_button_pressed(mb_left);
	}

}

function scr_input(_c, _l = lang.eng){ 
	
	enum comandi {up,down,left,right,A,B,X,start,select,R2};
	
	allKeys =		[pressSu,	pressGiu,	pressSinistra,	pressDestra,	pressA,		pressB,		pressX,		pressStart,		pressSelect];
	allKeysWritten = [
		[["arrow up", "freccia su"],	["arrow down", "freccia giu"],	["arrow left", "freccia sx"],	["arrow right", "freccia dx"],	
		["Z", "Z"],		["X","X"],		["C","C"],		["Enter", "Invio"],		["Space","Spazio"],	["V", "V"]],
		[["ar.up", "fr.su"],	["ar.down", "fr.giu"],	["ar.left", "fr.sx"],	["ar.right", "fr.dx"],	
		["Z", "Z"],		["X","X"],		["C","C"],		["Enter", "Invio"],		["Space","Spazio"]],
		[["W", "W"], ["S", "S"], ["A", "A"], ["D", "D"],
		["E","E"], ["Q","Q"], ["R","R"], ["Enter", "Invio"], ["Space","Spazio"], ["B", "B"]],
		[["T", "T"], ["G", "G"], ["F", "F"], ["H", "H"],
		["Y","Y"], ["R","R"], ["U","U"], ["Enter", "Invio"], ["Space","Spazio"], ["N", "N"]],
		[["I", "I"], ["K", "K"], ["J", "J"], ["L", "L"],
		["O","O"], ["M","M"], ["P","P"], ["Enter", "Invio"], ["Space","Spazio"]],
		[["", ""], ["", ""], ["", ""], ["", ""],
		["",""], ["",""], ["",""], ["Enter", "Invio"], ["Space","Spazio"], ["", ""]],
		[["", ""], ["", ""], ["", ""], ["", ""],
		["",""], ["",""], ["",""], ["Enter", "Invio"], ["Space","Spazio"], ["", ""]],
		[["", ""], ["", ""], ["", ""], ["", ""],
		["",""], ["",""], ["",""], ["Enter", "Invio"], ["Space","Spazio"], ["", ""]],
		[["", ""], ["", ""], ["", ""], ["", ""],
		["",""], ["",""], ["",""], ["Enter", "Invio"], ["Space","Spazio"], ["", ""]]
	];
	allButtons =	[gp_padu,	gp_padd,	gp_padl,		gp_padr,		gp_face1,	gp_face2,	gp_face3,	gp_start,		gp_select];
	
	allButtonsNintendo = ["0","1","2","3","4","5","6","7","8","9","A","B","C"];
	allButtonsSteam = ["0","1","2","3","4","5","6","7","8","9","A","B","C"];
	allButtonsSony = ["0","1","2","3","4","5","6","7","8","9","A","B","C"];
	allButtonsGamepad = ["0","1","2","3","4","5","6","7","9","A", "B","C"]
	
	colorButtons =	[c_white,	c_white,	c_white,		c_white,		c_blue,		c_red,		c_fuchsia,	c_white,		c_white];
	
	if !gamepad_is_connected(player)
	{
		comando = allKeysWritten[player][_c][_l];
	}
	else
	{
		{//tasti disegnati
		/*var _gc = gamepad_get_description(player), _tasti;
		switch _gc
		{
			case "NINTENDO SWITCH(R) PRO CONTROLLER": _tasti = global.tastiNintendo; break;
			case "PLAYSTATION(R)3 CONTROLLER": case "PLAYSTATION(R)4 CONTROLLER": case "PLAYSTATION(R)5 CONTROLLER": _tasti = global.tastiSony; break;
			default: _tasti = global.tastiSteam;
		}
		comando[_c] = draw_sprite_ext(_tasti,_c,_dx,_dy,0.5,0.5,0,colorButtons[_c],1);*/
		}
		
		//draw_set_font(global.tastiSteam);
		//comando = allButtonsGamepad[_c];
		//draw_set_font(_fontdiprima);
		var _controller, _gc = gamepad_get_description(player);
		switch _gc
		{
			case "NINTENDO SWITCH(R) PRO CONTROLLER": 
			{
				draw_set_font(global.tastiNintendo);	
				_controller = allButtonsNintendo[_c];
			} break;
			case "PLAYSTATION(R)3 CONTROLLER": case "PLAYSTATION(R)4 CONTROLLER": case "PLAYSTATION(R)5 CONTROLLER": 
			{
				draw_set_font(global.tastiSony);	
				_controller = allButtonsSony[_c];
			} break;
			default: {
				draw_set_font(global.tastiSteam); 
				_controller = allButtonsSteam[_c]
			};
		}
		
		
		comando = _controller;
	}
	
	return comando;
}