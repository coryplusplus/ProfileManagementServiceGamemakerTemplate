///scr_populate_bearer_token(username,password)
var username = argument0
var password = argument1
var url = "http://api.develop.cloudconfidant.com/profileManagementService/webapi/v1/token/" + username;
var method = "GET";
var headers = ds_map_create();
ds_map_add(headers,"Content-Type","application/json");
ds_map_add(headers,"Authorization", "Basic " + base64_encode(username + ":" + password));

return httpRequest(url,method,headers,"")
