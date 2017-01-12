///parseValue(map,key)
var resultMap = argument0
var key = argument1
var list = ds_map_find_value(resultMap, "default");
var size = ds_list_size(list);
var result = ds_list_create();
for (var n = 0; n < ds_list_size(list); n++;)
   {
   var map = ds_list_find_value(list, n);

    ds_list_add(result,ds_map_find_value(map, key))

   }
return result;
