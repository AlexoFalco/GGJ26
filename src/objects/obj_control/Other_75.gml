/// @description Insert description here
// You can write your code in this editor
var eventType = ds_map_find_value(async_load, "event_type");

switch(eventType)
{
    case ("gamepad discovered"):
        padIndex = ds_map_find_value(async_load, "pad_index")
        padEnabled = true
        show_message(padIndex)
        //if (instance_exists(ob_menu_page_main_options))
        //{
            //ob_menu_page_main_options.refresh(OPTIONS_SUBPAGE_ENUM.inputs)
        //}
        break;
    case ("gamepad lost"):
        padIndex = undefined
        padEnabled = false
        //if (instance_exists(ob_menu_page_main_options))
        //{
            //ob_menu_page_main_options.refresh(OPTIONS_SUBPAGE_ENUM.inputs)
        //}
        break;
}
