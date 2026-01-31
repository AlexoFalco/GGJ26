enum STATE
{
	WAIT,
	NORMAL,
	DASH,
	GUARD,
	TEST_GUARD,
}

function collision_with_any(_x, _y, _array) {
    for (var i = 0; i < array_length(_array); ++i) {
        var inst = _array[i];
        if (inst != noone && place_meeting(_x, _y, inst)) {
            return true;
        }
    }
    return false;
}

function CheckSolid() {
    var elements = []

	var _list = ds_list_create();
	//var _coll = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_collider, true, false, _list, false);
	var _coll = collision_circle_list(x, y, 256, obj_collider, true, false, _list, false);
	var _coll2 = collision_circle_list(x, y, 256, obj_player_mad, true, false, _list, false);
	
	if (_coll > 0)
	{
		for (var i=0; i<ds_list_size(_list); i++)
		{
			var cur_inst = _list[| i];
			
			//if (cur_inst.isSolid)
				array_push(elements, cur_inst.id);
		}
	}
	if (_coll2 > 0)
	{
		for (var i=0; i<ds_list_size(_list); i++)
		{
			var cur_inst = _list[| i];
			
			//if (cur_inst.isSolid)
				array_push(elements, cur_inst.id);
		}
	}
	ds_list_destroy(_list);
	
	//var _list2 = ds_list_create();
	//var _coll2 = collision_circle_list(x, y, 32, obj_collider, true, false, _list, false);
	//if (_coll2 > 0)
	//{
	//	for (var i=0; i<ds_list_size(_list2); i++)
	//	{
	//		var cur_inst = _list2[| i];
	//		array_push(elements, cur_inst.id);
	//	}
	//}
	//ds_list_destroy(_list2);
	
	return elements;
}

