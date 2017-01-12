///getEncouragementRequests(username)
var username = argument0
var url = "http://api.develop.cloudconfidant.com/profileManagementService/webapi/v1/messages?author=" + username;
var method = "GET";
var headers = ds_map_create();
ds_map_add(headers,"Content-Type","application/json");
ds_map_add(headers,"Authorization","Bearer " + global.bearerToken);

return httpRequest(url,method,headers,"")
