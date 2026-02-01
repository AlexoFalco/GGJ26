event_inherited()
audio_stop_all();
var _arr = [sfx_title_ale, sfx_title_lorenzo, sfx_title_ferlito, sfx_title_leira, sfx_title_mad, sfx_title_zig];
var n = irandom_range(0, array_length(_arr)-1);
audio_play_sound(_arr[n], 1, false);
audio_play_sound(music_menu, 1, true);
instance_create_button_obj(self, 0, camera_width_mid-50, 550, obj_button_iniziapartita)
instance_create_button_obj(self, 1, camera_width_mid-50, 700, obj_button_lingua)
instance_create_button_obj(self, 2, camera_width_mid-50, 900, obj_button_crediti)
instance_create_button_obj(self, 3, camera_width_mid-50, 1000, obj_button_esci)