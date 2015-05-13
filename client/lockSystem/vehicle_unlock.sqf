//@file Version: 1.2
//@file Name: vehiclesave.sqf
//@file Author: MercyfulFate edited by Gigatek && BadVolt
//@file Created: 06/09/2014
//@file Description: Unlock vehicle

#define ERR_IN_VEHICLE "Unlocking Failed! You can't do that in a vehicle."
#define ERR_DESTROYED "The vehicle is too damaged to unlock."
#define ERR_TOO_FAR_AWAY "Unlocking Failed! You are too far away from the vehicle."
#define ERR_NOT_VEHICLE "Unlocking Failed! This is not a vehicle."
#define ERR_IN_PROGRESS "You're already doing something!"
#define INFO_SUCCESS "Vehicle unlocked!"

private ["_vehicle","_text","_allow"];
_vehicle = cursorTarget;
_text = "";
_allow = false;

if (isNil "_vehicle") exitWith {};

switch (true) do {
  case (!alive player): {}; // player is dead
  case (vehicle player != player): {_text = ERR_IN_VEHICLE};
  case (player distance _vehicle > (sizeOf typeOf _vehicle / 2) max 10): {_text = ERR_TOO_FAR_AWAY};
  case (!alive _vehicle): {_text = ERR_DESTROYED};
  case ({(typeOf _vehicle) isKindOf _x } count ['Air','Tank','Motorcycle','Car','Ship'] == 0 ): {_text = ERR_NOT_VEHICLE};
  case (a3w_actions_mutex): {_text = ERR_IN_PROGRESS};
  default {
    _text = INFO_SUCCESS;
    _allow = true;
  };
};

if (!isDedicated && _allow) then 
	{
	[[netId _vehicle, 0], "A3W_fnc_setLockState", _vehicle] call A3W_fnc_MP; // Unlock
	_vehicle setVariable ["R3F_LOG_disabled",false,true];
	_vehicle setVariable ["R3F_Side", nil, true];
	_vehicle setVariable ["vehicleLocked", 0, true];
	_vehicle setVariable ["ownerUID", nil, true];
	
	player action ["lightOn", _vehicle];
	sleep 1;
	player action ["lightOff", _vehicle];
	
	_vehicle say3D "carlock";
	sleep 0.5;
};


if (_text != "") then {
  [_text, 5] call mf_notify_client;
};