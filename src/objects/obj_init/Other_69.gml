/// @description Insert description here
// You can write your code in this editor
var _event_type = ds_map_find_value(async_load, "event_type");
var _pad_index = ds_map_find_value(async_load, "pad_index")

switch(_event_type)
{
    case ("gamepad discovered"):
        show_debug_message($"gamepad discovered: {_pad_index}")
        array_push(global.input_list, {
            pad_index: _pad_index
        })
        break;
    case ("gamepad lost"):
        show_debug_message($"gamepad lost: {_pad_index}")
        var _item_index = array_find_index(global.input_list, method({_index: _pad_index}, function(item){return _index == item.pad_index}))
        if (_item_index >= 0)
        {
            array_delete(global.input_list, _item_index, 1)
        }
        break;
}