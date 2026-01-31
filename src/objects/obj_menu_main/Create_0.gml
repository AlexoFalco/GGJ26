event_inherited()

for (var _i = 0; _i <= 5; _i++)
{
	var _button;
	switch _i
	{
		case 0: _button = obj_button_iniziapartita; break;
		case 1: _button = obj_button_lingua; break;
		case 2: _button = obj_button_info; break;
		case 3: _button = obj_button_opzioni; break;
		case 4: _button = obj_button_crediti; break;
		case 5: _button = obj_button_esci; break;
	}
	instance_create_button_obj(self, _i, camera_width_mid, 225+125*_i, _button)
}
