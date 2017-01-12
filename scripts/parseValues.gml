///parseValues(map,values)
var resultMap = argument0
var values = argument1
var list = ds_map_find_value(resultMap, "default");
var size = ds_list_size(list);
var result = ds_list_create()
for (var n = 0; n < ds_list_size(list); n++;)
   {
   var map = ds_list_find_value(list, n);
   var curr = ds_map_find_first(map);
   entry = ds_map_create()


        while (is_string(curr))
        {
              for(var e = 0; e < ds_list_size(values);e++)
             {
                ds_map_add(entry,ds_list_find_value(values,e),ds_map_find_value(map, ds_list_find_value(values,e)))
             }
            curr = ds_map_find_next(map, curr);

      }
   ds_list_add(result,entry)
   }
return result;
