/// @description Insert description here
// You can write your code in this editor
draw_set_colour(c_white)
for (var i = 0; i < array_length(input_list); i++) {
	var _item = input_list[i]
    draw_text(10, 10+i*15, json_stringify(_item))
}

draw_set_colour(c_orange)
for (var i = 0; i < array_length(players_list); i++) {
	var _item11 = players_list[i]
    draw_text(10, 100+i*15, json_stringify(_item11))
}