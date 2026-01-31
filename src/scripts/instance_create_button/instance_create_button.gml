// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function instance_create_button(_parent_ref, _x, _y, _text, _on_click){
    var _obj = instance_create_layer(_x, _y, "Instances", obj_base_button)
    _obj.text = _text
    _obj.parent_ref = _parent_ref
    _obj.on_click = _on_click
    return _obj
}