// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: canVehicleUnlock.sqf
//	@file Author: BadVolt

private ["_target","_side","_owner","_playerUID","_strToSide"];

_target = _this select 0;
_side = _target getVariable ["R3F_Side",""];
_owner = _target getVariable ["ownerUID","0"];

_strToSide =
{
	switch (toUpper _this) do
	{
		case "WEST":  { BLUFOR };
		case "EAST":  { OPFOR };
		case "GUER":  { INDEPENDENT };
		case "CIV":   { CIVILIAN };
		case "LOGIC": { sideLogic };
		default       { sideUnknown };
	};
};

if (typeName _side != "SIDE") then {
	_side = _side call _strToSide;
};

if ({ _target isKindOf _x } count ['Air','Tank','Motorcycle','Car','Ship'] > 0) then 
{
	!isNull _target
	&& (alive _target)
  && ((vehicle player) == player)
	&& (locked _target==2)
	&& ((player distance _target) < 10)
	&& (((_side == playerSide) && (_side in [EAST,WEST])) || (_owner == getPlayerUID player));
}else{
	false
};