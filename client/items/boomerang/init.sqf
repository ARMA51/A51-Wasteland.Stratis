// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: init.sqf
//@file Author: micovery
//@file Argument: the path to the directory holding this file.

private ["_path"];
_path = _this;

private["_h"];
_h = [] execVM "addons\boomerang\config.sqf";
waitUntil {scriptDone _h;};


[MF_ITEMS_BOOMERANG_TERMINAL, "Boomerang Terminal", {_this call boomerang_toggle_hud}, MF_ITEMS_BOOMERANG_TERMINAL_TYPE, MF_ITEMS_BOOMERANG_TERMINAL_ICON, boomerang_max_inventory_terminals] call mf_inventory_create;
[MF_ITEMS_BOOMERANG_STATION, "Boomerang Station", {_this call boomerang_station_use}, MF_ITEMS_BOOMERANG_STATION_TYPE, MF_ITEMS_BOOMERANG_STATION_ICON, boomerang_max_inventory_stations] call mf_inventory_create;
