///parseResponse(async_load)
var load = argument0

var r_str = ds_map_find_value(load, "result");
if(r_str == -1 || is_undefined(r_str))
{
    var resultMap = ds_map_create()
    return resultMap
}
var resultMap = json_decode(r_str);
return resultMap
