function ac_get_curve_value(curve_id, value, _index = 0){
    var acRef = animcurve_get_channel(curve_id, _index)
    return animcurve_channel_evaluate(acRef,value)
}
