/*
delete object from db
parameters: _obj
*/
private["_obj","_objectID","_objectUID"];
_obj		= _this select 3;
_objectID 	= _obj getVariable ["ObjectID","0"];
_objectUID	= _obj getVariable ["ObjectUID","0"];

player playActionNow "Medic";
sleep 1;
[player,"repair",0,false] call dayz_zombieSpeak;
_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
sleep 5;
	
dayzDeleteObj = [_objectID,_objectUID];
<<<<<<< HEAD
publicVariable "dayzDeleteObj";
=======
publicVariableServer "dayzDeleteObj";
>>>>>>> 9c93e6a9fb518e4860076d65610ce7d7b7826692
if (isServer) then {
	dayzDeleteObj call local_deleteObj;
};

deleteVehicle _obj;