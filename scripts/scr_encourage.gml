///scr_encourage(encouragementId,encouragement)
var encouragementId = argument0
var encouragement = argument1
var url = "http://api.develop.cloudconfidant.com/profileManagementService/webapi/v1/messages/" + encouragementId + "/comments";
var method = "POST";
var headers = ds_map_create();
ds_map_add(headers,"Content-Type","application/json");
ds_map_add(headers,"Authorization","Bearer " + global.bearerToken);
var encouragePaylaod = ds_map_create()
ds_map_add(encouragePaylaod,"author",global.username)
ds_map_add(encouragePaylaod,"message",encouragement)

var encodedPayload = json_encode(encouragePaylaod)
return httpRequest(url,method,headers,encodedPayload)
