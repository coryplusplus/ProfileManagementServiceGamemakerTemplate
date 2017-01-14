///parseValue(map,key)
var result = ds_list_create();
var resultMap = argument0
var key = argument1
if(ds_map_exists(resultMap,"default"))
{
    var list = ds_map_find_value(resultMap, "default");
    var size = ds_list_size(list);
    
    for (var n = 0; n < ds_list_size(list); n++;)
       {
       var map = ds_list_find_value(list, n);
    
        ds_list_add(result,ds_map_find_value(map, key))
    
       }
}
return result;
