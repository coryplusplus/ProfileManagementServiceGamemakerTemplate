global.character_map = ds_list_create();
global.characters = 8;
for(var i = 1; i <= global.characters;i++)
{
    var char = ds_map_create()
    var sprite_idle = "spr_char_" + string(i) + "_idle";
    var sprite_walk = "spr_char_" + string(i) + "_walk";
    var sprite_up = "spr_char_" + string(i) + "_up";
    var sprite_down = "spr_char_" + string(i) + "_down";
    ds_map_add(char,"idle",sprite_idle)
    ds_map_add(char,"walk",sprite_walk)
    ds_map_add(char,"up",sprite_up)
    ds_map_add(char,"down",sprite_down)
    ds_list_add(global.character_map,char)
    
}
