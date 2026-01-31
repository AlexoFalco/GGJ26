// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function instance_create_button_obj(_parent_ref, _index, _x, _y, _obj_ref){
    var _obj = instance_create_layer(_x, _y, "Instances", _obj_ref)
    _obj.index = _index
    _obj.parent_ref = _parent_ref
    return _obj
}