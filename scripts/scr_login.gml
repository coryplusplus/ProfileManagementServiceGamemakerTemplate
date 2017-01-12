///scr_login(username,password)
var username = argument0
var password = argument1
var url = "http://api.develop.cloudconfidant.com/profileManagementService/webapi/v1/password";
var method = "POST";
var headers = ds_map_create();
ds_map_add(headers,"Content-Type","application/json");
ds_map_add(headers,"Authorization","Bearer " + global.bearerToken);
var loginPayload = ds_map_create()
ds_map_add(loginPayload,"profileName",username)
ds_map_add(loginPayload,"password",password)

var encodedPayload = json_encode(loginPayload)
return httpRequest(url,method,headers,encodedPayload)
