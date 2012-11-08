/*
[_objectID,_objectUID] call local_deleteObj;
*/
private["_id","_uid","_key"];
_id 	= _this select 0;
_uid 	= _this select 1;

if (isServer) then {
//remove from database
	if (parseNumber _id > 0) then {
<<<<<<< HEAD
		//Send request by ID
=======
		//Send request
>>>>>>> 9c93e6a9fb518e4860076d65610ce7d7b7826692
		_key = format["CHILD:304:%1:",_id];
		_key call server_hiveWrite;
		diag_log format["DELETE: Deleted by ID: %1",_id];
	} else  {
<<<<<<< HEAD
		//Send request by UID
=======
		//Send request
>>>>>>> 9c93e6a9fb518e4860076d65610ce7d7b7826692
		_key = format["CHILD:310:%1:",_uid];
		_key call server_hiveWrite;
		diag_log format["DELETE: Deleted by UID: %1",_uid];
	};
};