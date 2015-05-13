// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: canVehicleLock.sqf
//	@file Author: BadVolt

private ["_target"];

_target = _this select 0;

if ({ _target isKindOf _x } count ['Air','Tank','Motorcycle','Car','Ship'] > 0) then 
{
	!isNull _target && (alive _target) && 
  ((vehicle player) == player) && 
	!((locked _target)==2) && (count crew _target == 0) && 
	!(_target getVariable ['R3F_LOG_disabled', false]) && 
	(player distance _target) < 10;
}else{
	false;
};