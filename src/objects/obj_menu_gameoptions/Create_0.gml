/// @description Insert description here
// You can write your code in this editor
event_inherited()

players_count = 4
for (var i = 2; i <= players_count; i++) {
    var _it = $"{i} giocatori";
    var _en = $"{i} players";
    var _text = [_en, _it ]
    var _onclick = method({_count : i},function()
    {
        global.__temp.players_count = _count; 
        room_goto(room_test_lobby);
    })
	var _obj = instance_create_button(self, i-2, room_width/2, 300+i*100, _text, _onclick)
    _obj.sprite_index = spr_base_button
}
