/// @description Insert description here
// You can write your code in this editor
var _event_type = ds_map_find_value(async_load, "event_type");
var _pad_index = ds_map_find_value(async_load, "pad_index")

switch(_event_type)
{
    case ("gamepad discovered"):
        __temp._pad_index = ds_map_find_value(async_load, "pad_index")
        array_push(input_list, {
            pad_index: __temp._pad_index
        })
        break;
    case ("gamepad lost"):
        var _item_index = array_find_index(input_list, method({_index: _pad_index}, function(item){return _index == item.pad_index}))
        if (_item_index >= 0)
        {
            array_delete(input_list, _item_index, 1)
        }
        break;
}
