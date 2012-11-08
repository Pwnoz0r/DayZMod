<<<<<<< HEAD
private["_item","_isFemale","_itemNew","_item","_onLadder"];
=======
/*
_item spawn player_wearClothes;
TODO: female
*/
private["_item","_isFemale","_itemNew","_item","_onLadder","_model","_hasclothesitem","_config","_text"];
>>>>>>> 9c93e6a9fb518e4860076d65610ce7d7b7826692
_item = _this;
call gear_ui_init;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};

_hasclothesitem = _this in magazines player;
_config = configFile >> "CfgMagazines";
_text = getText (_config >> _item >> "displayName");

if (!_hasclothesitem) exitWith {cutText [format[(localize "str_player_31"),_text,"wear"] , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["You may not change clothes while in a vehicle", "PLAIN DOWN"]};

_isFemale = ((typeOf player == "SurvivorW2_DZ")||(typeOf player == "BanditW1_DZ"));
<<<<<<< HEAD
if (_isFemale) then {
	if (_item != "Skin_Survivor2_DZ") exitWith {cutText ["Currently Female Characters cannot change to this skin. This will change in a future update.", "PLAIN DOWN"]};
};

_myModel = (typeOf player);
_itemNew = "Skin_Survivor2_DZ";
=======
if (_isFemale) exitWith {cutText ["Currently Female Characters cannot change to this skin. This will change in a future update.", "PLAIN DOWN"]};
>>>>>>> 9c93e6a9fb518e4860076d65610ce7d7b7826692

private["_itemNew","_myModel","_humanity","_isBandit","_isHero"];
_myModel = (typeOf player);
_humanity = player getVariable ["humanity",0];
_isBandit = _humanity < -2000;
_isHero = _humanity > 5000;
_itemNew = "Skin_" + _myModel;

if ( !(isClass(_config >> _itemNew)) ) then {
	_itemNew = if (!_isFemale) then {"Skin_Survivor2_DZ"} else {"Skin_SurvivorW2_DZ"}; 
};

switch (_item) do {
	case "Skin_Sniper1_DZ": {
<<<<<<< HEAD
		_itemNew = "Skin_" + _myModel;
		[dayz_playerUID,dayz_characterID,"Sniper1_DZ"] spawn player_humanityMorph;
	};
	case "Skin_Camo1_DZ": {
		_itemNew = "Skin_" + _myModel;
		[dayz_playerUID,dayz_characterID,"Camo1_DZ"] spawn player_humanityMorph;
=======
		_model = "Sniper1_DZ";
	};
	case "Skin_Camo1_DZ": {
		_model = "Camo1_DZ";
	};
	case "Skin_Soldier1_DZ": {
		_model = "Soldier1_DZ";
>>>>>>> 9c93e6a9fb518e4860076d65610ce7d7b7826692
	};
	case "Skin_Survivor2_DZ": {
		_model = "Survivor2_DZ";
		if (_isFemale) then {
			_model = "SurvivorW2_DZ";
		};
<<<<<<< HEAD
		if (_humanity < -2000) then {
=======
		if (_isBandit) then {
>>>>>>> 9c93e6a9fb518e4860076d65610ce7d7b7826692
			_model = "Bandit1_DZ";
			if (_isFemale) then {
				_model = "BanditW1_DZ";
			};
		};
		if (_isHero) then {
			_model = "Survivor3_DZ";
			if (_isFemale) then {
				_model = "SurvivorW2_DZ";
			};
<<<<<<< HEAD
		};
		if (_model != _myModel) then {
			[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
		};
	};
	case "Skin_Soldier1_DZ": {
		_itemNew = "Skin_" + _myModel;
		[dayz_playerUID,dayz_characterID,"Soldier1_DZ"] spawn player_humanityMorph;
	};
};

_config = 		configFile >> "CfgMagazines" >> _itemNew;
_isClass = 		isClass (_config);

if (_isClass) then {
=======
		};
	};
};

if (_model != _myModel) then {
	player removeMagazine _item;
>>>>>>> 9c93e6a9fb518e4860076d65610ce7d7b7826692
	player addMagazine _itemNew;
	[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
};
