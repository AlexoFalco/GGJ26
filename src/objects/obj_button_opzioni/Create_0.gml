/// @description Insert description here
// You can write your code in this editor

event_inherited();

text = ["Settings","Opzioni"];
on_click = function()
{
	obj_control.impostazioni = true;
    room_goto(room_settings);
}
