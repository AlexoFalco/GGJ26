/// @description Insert description here
// You can write your code in this editor

event_inherited();

text = ["Change language","Cambia lingua"];
on_click = function()
{
    global.language++;
	if global.language > lang.ita
		global.language = 0;
}
