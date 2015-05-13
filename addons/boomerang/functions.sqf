if (!isNil "boomerang_functions_defined") exitWith {};

#include "macro.h"
#include "hud_constants.h"

diag_log format["Loading boomerang functions ..."];

call compile preprocessFileLineNumbers "addons\boomerang\config.sqf";



boomerang_hud_remove = {
  11 cuttext ["","plain"];
  boomerang_hud_active = nil;
};

boomerang_led_set_state = {
  ARGVX3(0,_index,0);
  ARGVX3(1,_state,false);

  if (_index < 1 || {_index > 12}) exitWith {};

  def(_display);
  def(_idc);
  def(_led);

  _display = uiNamespace getVariable "boomerang_hud";
  _idc = boomerang_hud_led_idc_base + _index;
  _led = _display displayCtrl _idc;
  _led ctrlShow _state;
};

boomerang_lcd_set = {
  ARGVX3(0,_text,"");

  def(_display);
  _display = uiNamespace getVariable "boomerang_hud";

  def(_boomerang_lcd);
  _boomerang_lcd = _display displayCtrl boomerang_hud_lcd_idc;

  _boomerang_lcd ctrlSetText _text;
  _boomerang_lcd ctrlCommit 0;
};


//0 - voice
//1 - beep
//2 - muted
boomerang_sound_mode = 0;


boomerang_led_sound = { _this spawn {
  ARGVX3(0,_index,0);

  if (boomerang_sound_mode == 2) exitWith {};

  if (boomerang_sound_mode == 0) exitWith {
    playSound "contact_voice";
    uiSleep 1;
    playSound ("at_" + str(_index));
    uiSleep 1;
  };

  if (boomerang_sound_mode == 1) exitWith {
    playSound "contact_beep";
    uiSleep 2;
  };
}};

boomerang_cycle_sound_mode = {
  boomerang_sound_mode = (boomerang_sound_mode + 1) % 3;

  def(_mode);
  if (boomerang_sound_mode == 0) then {
    _mode = "Voice reports";
  }
  else { if (boomerang_sound_mode == 1) then {
    _mode = "Beep sounds";
  }
  else { if (boomerang_sound_mode == 2) then {
    _mode = "Sound muted";
  };};};

  def(_text);
  _text = _mode;
  _text = format["<t align='center' font='PuristaMedium' size='1.2' >Boomerang</t><br /><img image='%1' size='1.9' /><br /><t align='center'>(%2)</t>", MF_ITEMS_BOOMERANG_TERMINAL_ICON, "Sound mode"] + "<br /><br />" + _text;
  hintSilent parseText _text;
};


boomerang_alert_at = {
  disableSerialization;
  ARGVX3(0,_direction,0);
  ARGVX3(1,_dist,0);
  ARGVX4(2,_voice,false,true);

  [(" " +str(round(_dist)) + " M")] call boomerang_lcd_set;

  if (_voice) then {
    [_direction] call boomerang_led_sound;
  };

  [_direction, true] call boomerang_led_set_state;
  uiSleep 2;
  [_direction, false] call boomerang_led_set_state;
  [""] call boomerang_lcd_set;
};

//pre-computed set of relative coordinates
boomerang_led_coord_map = [
 [0.03,-0.07,0], //1 o'clock
 [0.0519615,-0.042,0], //2 o'clock
 [0.06,0,0], //3 o'oclock
 [0.0519615,0.042,0], //4 o'oclock
 [0.03,0.07,0], //5 o'oclock
 [0,0.083,0], //6 o'clock
 [-0.03,0.07,0], //7 o'clock
 [-0.0519615,0.042,0], //8 o'clock
 [-0.06,0,0], //9 o'clock
 [-0.0519615,-0.042,0], //10 o'clock
 [-0.03,-0.07,0], //11 o'clock
 [0,-0.083,0] //12 o'clock
];

boomerang_led_setup = {
  disableSerialization;
  ARGVX3(0,_index,0);
  if (_index < 1 || {_index > 12}) exitWith {};

  def(_display);
  def(_idc);
  def(_led);

  _display = uiNamespace getVariable "boomerang_hud";
  _idc = boomerang_hud_led_idc_base + _index;
  _led = _display displayCtrl _idc;

  private["_x","_y", "_w", "_h"];
  _w = 0.025 * boomerand_hud_scale;
  _h = 0.025 * boomerand_hud_scale;
  _x = boomerang_hud_x + _w * 8.6;
  _y = boomerang_hud_y + _h * 13.78;

  def(_vec);
  _vec = boomerang_led_coord_map select (_index -1);
  _vec = [(_vec select 0) *  boomerand_hud_scale, (_vec select 1) * boomerand_hud_scale, 0];

  _led ctrlSetPosition [(_x + (_vec select 0)),(_y + (_vec select 1)),_w,_h];
  _led ctrlSetText "addons\boomerang\images\boomerang_led.paa";
  _led ctrlShow false;
  _led ctrlCommit 0;
};


boomerang_is_terminal_nearby = {
  ARGVX4(0,_player,objNull,false);
  ARGVX4(1,_distance,0,false);

  def(_vehicles);
  _vehicles = (nearestObjects [getPos _player, ["Helicopter", "Plane", "Ship_F", "Car", "Motorcycle", "Tank", MF_ITEMS_BOOMERANG_STATION_TYPE], _distance]);
  init(_result,false);
  {
    if (_x getVariable ["has_boomerang", false]) exitWith {
      _result = true;
    };
  } forEach _vehicles;

  (_result)
};


boomerand_test_leds = {
  disableSerialization;
  {
    for "_i" from 1 to 12 do {
      [_i, _x] call boomerang_led_set_state;
      if ((_i % 2) == 0) then { playSound "contact_beep";};
      uiSleep 0.01;
    };
  } forEach [true, false];
};


boomerang_hud_setup = {
  disableSerialization;
  11 cutRsc ["boomerang_hud","PLAIN",1e+011,false];

  def(_display);
  _display = uiNamespace getVariable "boomerang_hud";

  def(_boomerang_background);
  def(_boomerang_lcd);
  _boomerang_background = _display displayCtrl boomerang_hud_background_idc;
  _boomerang_lcd = _display displayCtrl boomerang_hud_lcd_idc;


  private["_x","_y", "_w", "_h"];
  _w = 0.6 * boomerand_hud_scale;
  _h = 0.6 * boomerand_hud_scale;
  _x = boomerang_hud_x;
  _y = boomerang_hud_y;
  _boomerang_background ctrlSetPosition [_x,_y,_w,_h];
  _boomerang_background ctrlSetText "addons\boomerang\images\boomerang.paa";
  _boomerang_background ctrlCommit 0;

  private["_lx","_ly","_lw","_lh"];
  _lw = _w/3.25;
  _lh = _h/10.4;
  _lx = _x + (_w /10) * 2.26 ;
  _ly = _y + (_h /10) * 2.83;

  _boomerang_lcd ctrlSetPosition [_lx,_ly,_lw,_lh];
  _boomerang_lcd ctrlSetBackgroundColor [0,0,0,0.3];
  _boomerang_lcd ctrlSetFontHeight 0.045 * boomerand_hud_scale;
  _boomerang_lcd ctrlSetFont "PuristaBold";
  _boomerang_lcd ctrlSetTextColor  [0,0,0,0.67];
  _boomerang_lcd ctrlSetText "";
  _boomerang_lcd ctrlCommit 0;

  for "_i" from 1 to 12 do {
    [_i] call boomerang_led_setup;
  };

  //for shits and giggles
  [] spawn boomerand_test_leds;

  boomerang_hud_active = true;


  [] spawn {
    init(_player,player);
    [_player] call boomerang_remove_firedNear;
    [_player] call boomerang_add_firedNear;
    [] call boomerang_setup_hud_keyUp;



    def(_vehicle_has_station);
    def(_player_has_terminal);
    def(_terminal_nearby);
    init(_notification,0);

    _notify_no_terminal = {
      _text = "No portable termial.";
      _text = format["<t align='center' font='PuristaMedium' size='1.2' >Boomerang</t><br /><img image='%1' size='1.9' /><br /><t align='center'>(%2)</t>", MF_ITEMS_BOOMERANG_TERMINAL_ICON, "disconnected"] + "<br /><br />" + _text;
      hintSilent parseText _text;
    };

    _notify_no_station = {
      _text = "No stations nearby.";
      _text = format["<t align='center' font='PuristaMedium' size='1.2' >Boomerang</t><br /><img image='%1' size='1.9' /><br /><t align='center'>(%2)</t>", MF_ITEMS_BOOMERANG_STATION_ICON, "disconnected"] + "<br /><br />" + _text;
      hintSilent parseText _text;
    };

    //hintSilent ""; //clear any hints

    waitUntil {
      sleep 3;
      if (not(alive player)) exitWith {true}; //player died, close the hud
      if (isNil "boomerang_hud_active") exitWith {true}; //something else closed the hud, bail out

      _vehicle_has_station = ((vehicle player) getVariable ["has_boomerang", false]);
      if (_vehicle_has_station) exitWith {false}; //vehicle has boomerang, leave the hud open

      _player_has_terminal = (MF_ITEMS_BOOMERANG_TERMINAL call mf_inventory_count > 0);
      if (not(_player_has_terminal)) exitWith {call _notify_no_terminal; true};  //player dropped the terminal, close the hud

      _terminal_nearby = [player, boomerang_min_distance] call boomerang_is_terminal_nearby;

      if (not(_terminal_nearby)) exitWith {call _notify_no_station; true}; //there are no nearby temrinals, close the hug

      false
    };

    [] call boomerang_remove_hud_keyUp;
    [] call boomerang_hud_remove;
    [_player] call boomerang_remove_firedNear;
  };

};

vector_angle2 = {
  ARGVX3(0,_obj,objNull);
  ARGVX3(1,_v2,[]);
  def(_local);
  _local = _obj worldToModel _v2;
  (_local select 0) atan2 ( _local select 1);
};

boomerang_get_clock_pos = {
  ARGVX3(0,_unit,objNull);
  ARGVX3(1,_firer,objNull);

  def(_angle);
  _angle = [_unit, getPos _firer] call vector_angle2;
  _angle = ((_angle) + 360) % 360;

  def(_clock_pos);
  _clock_pos = round((_angle / 360) * 12);
  _clock_pos = if (_clock_pos == 0) then {12} else {_clock_pos};

  (_clock_pos)
};


boomerang_fired_near_handler = {
  if (isNil "boomerang_hud_active") exitWith {};
  ARGVX3(0,_unit,objNull);
  ARGVX3(1,_firer,objNull);
  ARGVX3(2,_distance,0);
  ARGVX3(3,_weapon,"");
  ARGVX3(4,_muzzle,"");
  ARGVX3(5,_mode,"");
  ARGVX3(6,_ammo,"");

  if (_unit == _firer) exitWith {};
  _unit = (vehicle _unit);

  def(_clock_pos);
  _clock_pos = [_unit, _firer] call boomerang_get_clock_pos;


  init(_exit,false);
  if (!(isNil "boomerang_last_event_pos" || {isNil "boomerang_last_event_time"})) then {
    if (boomerang_last_event_pos == _clock_pos && (diag_tickTime - boomerang_last_event_time)  < 3) then {
      _exit = true;
    };
  };

  if (_exit) exitWith {};

  boomerang_last_event_pos = _clock_pos;
  boomerang_last_event_time = diag_tickTime;

  init(_dist,(_unit distance _firer));
  if (!isNil "boomerang_alert_script_handle" &&  {not(scriptDone boomerang_alert_script_handle)}) exitWith {
    //don't play the sound, but at least show the LED
    [_clock_pos, _dist, false] spawn boomerang_alert_at;
  };

  boomerang_alert_script_handle = [_clock_pos, _dist, true] spawn boomerang_alert_at;

};

boomerang_vehicle_notify = {
  ARGVX4(0,_player,objNull,false);
  ARGVX4(1,_vehicle,objNull,false);

  if (not(_vehicle getVariable ["has_boomerang", false])) exitWith {false};

  _text = "This vehicle has a boomerang system installed. Press Control+B to activate it.";
  _text = format["<t align='center' font='PuristaMedium' size='1.2' >Boomerang</t><br /><img image='%1' size='1.9' /><br /><t align='center'>(%2)</t>", MF_ITEMS_BOOMERANG_STATION_ICON, "available"] + "<br /><br />" + _text;
  hintSilent parseText _text;

  [] call boomerang_setup_vehicle_keyUp;
  [_vehicle] call boomerang_remove_firedNear;
  [_vehicle] call boomerang_add_firedNear;
  true
};


boomerang_vehicle_watch = {
  def(_notified):
  def(_vehicle);

  waitUntil {
    sleep 2;
    //wait until the player enters a vehicle, and is notified
    waitUntil {
      sleep 2;
      if ((vehicle player) == (player)) exitWith {false};
      if ([player, (vehicle player)] call boomerang_vehicle_notify) exitWith {true};
      false
    };
    _vehicle = (vehicle player);
    //wait until the player exits the vehicle
    waitUntil {sleep 2; ((vehicle player) != _vehicle)};
   [] call boomerang_remove_vehicle_keyUp;
   [_vehicle] call boomerang_remove_firedNear;
    hintSilent "";
  };
};

boomerang_add_firedNear = {
  ARGVX3(0,_vehicle,objNull);
  def(_id);
  _id = _vehicle addEventHandler ["FiredNear", {_this call boomerang_fired_near_handler}];
  _vehicle setVariable ["FiredNear_ID", _id];
};

boomerang_remove_firedNear = {
  diag_log format["%1 call boomerang_remove_firedNear", _this];
  ARGVX3(0,_vehicle,objNull);
  def(_id);
  _id = _vehicle getVariable "FiredNear_ID";
  if (isNil "_id") exitWith {};
  _vehicle removeEventHandler ["FiredNear", _id];
};



boomerang_toggle_hud = {
  _this spawn {
    if (isNil "boomerang_hud_active") exitWith {
      [] call boomerang_hud_remove;
      def(_text);
      _text = "";
      _text = format["<t align='center' font='PuristaMedium' size='1.2' >Boomerang</t><br /><img image='%1' size='1.9' /><br /><t align='center'>(%2)</t>", MF_ITEMS_BOOMERANG_TERMINAL_ICON, "connecting ..."] + "<br /><br />" + _text;
      hintSilent parseText _text;
      [] call boomerang_hud_setup;
      sleep 4;
      if (not(isNil "boomerang_hud_active")) then {
        _text = (
                 "Cycle mode:    Shift + M <br />" +
                 "Exit system:   Ctrl + E"
                );
        _text = format["<t align='center' font='PuristaMedium' size='1.2' >Boomerang</t><br /><img image='%1' size='1.9' /><br /><t align='center'>(%2)</t>", MF_ITEMS_BOOMERANG_STATION_ICON, "connected"] + "<br /><br /><t align='left'>" + _text + "</t>";
        hintSilent parseText _text;
      };
    };

    []  call boomerang_hud_remove;
  };
  false
};


#define MUTEX_UNLOCK mutexScriptInProgress = false; doCancelAction = false


boomerang_ground_deploy = {

  if (not(boomerang_allow_ground_deploy)) exitWith {
    ["Deploying the boomerang on the ground is not allowed.", "Boomerang Vehicle Deploy", true] call BIS_fnc_guiMessage;
  };

  ARGVX3(0,_player,objNull);
  ARGVX3(1,_item_type,"");

  def(_msg);
  _msg = "You are about to deploy the Boomerang Base Station. Players nearby will need to use a Boomerang Terminal. Do you want to proceed?";
  if (not([_msg, "Boomerang Ground Deploy", true, true] call BIS_fnc_guiMessage)) exitWith {false};

  //this is needed in order for the mf_inventory_drop call to work (since it's nested inside USE)
  MUTEX_UNLOCK ;

  private["_device"];
  _device = _item_type call mf_inventory_drop;

  if (!isOBJECT(_device)) exitWith {false};

  _device setVariable ["is_boomerang", true, true];
  _device setVariable ["boomerang_owner_type", "player"];
  _device setVariable ["boomerang_owner_value", getPlayerUID _player];
  _device setVariable ["has_boomerang", true, true];


  true
};

boomerang_vehcle_deploy = {

  if (not(boomerang_allow_vehicle_deploy)) exitWith {
    ["The Boomerang base station cannot be deployed inside vehicles.", "Boomerang Vehicle Deploy", true] call BIS_fnc_guiMessage;
  };

  ARGVX3(0,_vehicle,objNull);
  ARGVX3(1,_player,objNull);
  player groupChat format["%1", boomerang_vehicle_class_list];
  if (isARRAY(boomerang_vehicle_class_list) && ({_vehicle isKindOf _x} count boomerang_vehicle_class_list) == 0) exitWith {
    ["The Boomerang base station cannot be deployed in this kind of vehicle", "Boomerang Vehicle Deploy", true] call BIS_fnc_guiMessage;
  };

  def(_msg);
  _msg = "You are about to deploy the Boomerang Base Station in this vehicle. Once installed, it cannot be removed. Do you want to proceed?";
  if (not([_msg, "Boomerang Vehicle Deploy", true,true] call BIS_fnc_guiMessage)) exitWith {false};

  _vehicle setVariable ["has_boomerang", true, true];
  _vehicle setVariable ["boomerang_owner_type", "player"];
  _vehicle setVariable ["boomerang_owner_value", getPlayerUID _player];

   [_id, 1] call mf_inventory_remove;


  true
};

boomerang_station_use = {
  private["_item_type"];
  _item_type = _this;

  init(_vehicle, vehicle player);
  init(_player,player);

  if (_vehicle != _player) exitWith {
    [_vehicle,_player] call boomerang_vehcle_deploy;
    false
  };

  [_player, _item_type] call boomerang_ground_deploy;

  false
};


boomerang_vehicle_keyUpHandler = {
  init(_vehicle,vehicle player);
  if (_vehicle == player) exitWith {};
  if (!(_vehicle getVariable ["has_boomerang", false])) exitWith {};

  ARGVX2(0,_this);
  ARGV2(0,_display);
  ARGV2(1,_key);
  ARGV2(2,_shift);
  ARGV2(3,_control);
  ARGV2(4,_alt);


  if (_control && {_key == DIK_B}) then {
    [] call boomerang_toggle_hud;
  };
  true
};

boomerang_remove_vehicle_keyUp = {
  disableSerialization;
    _display = findDisplay 46;
  if (not(undefined(boomerang_vehicle_keyUpHandler_id))) then {
    _display displayRemoveEventHandler  ["keyUp",boomerang_vehicle_keyUpHandler_id];
    boomerang_vehicle_keyUpHandler_id = nil;
  };
};

boomerang_setup_vehicle_keyUp = {
  init(_data,_this);

  disableSerialization;
  _display = findDisplay 46;
  if (undefined(boomerang_vehicle_keyUpHandler_id) ) then {
    boomerang_vehicle_keyUpHandler_id = _display displayAddEventHandler  ["keyUp",format["[_this,%1] call boomerang_vehicle_keyUpHandler",_data]];
  };
};



boomerang_toggle_hud = {
  _this spawn {
    if (isNil "boomerang_hud_active") exitWith {
      [] call boomerang_hud_remove;
      def(_text);
      _text = "";
      _text = format["<t align='center' font='PuristaMedium' size='1.2' >Boomerang</t><br /><img image='%1' size='1.9' /><br /><t align='center'>(%2)</t>", MF_ITEMS_BOOMERANG_TERMINAL_ICON, "connecting ..."] + "<br /><br />" + _text;
      hintSilent parseText _text;
      [] call boomerang_hud_setup;
      sleep 5;
      if (not(isNil "boomerang_hud_active")) then {
        _text = (
                 "Cycle mode:    Shift + M <br />" +
                 "Exit system:    Ctrl + E"
                );
        _text = format["<t align='center' font='PuristaMedium' size='1.2' >Boomerang</t><br /><img image='%1' size='1.9' /><br /><t align='center'>(%2)</t>", MF_ITEMS_BOOMERANG_STATION_ICON, "connected"] + "<br /><br /><t align='left'>" + _text + "</t>";
        hintSilent parseText _text;
      };
    };

    []  call boomerang_hud_remove;
  };
  false
};


boomerang_hud_keyUpHandler = {
  //player groupChat format["%1", _this];
  if (isNil "boomerang_hud_active") exitWith {};
  ARGVX2(0,_this);
  ARGV2(0,_display);
  ARGV2(1,_key);
  ARGV2(2,_shift);
  ARGV2(3,_control);
  ARGV2(4,_alt);

  if (_shift && {_key == DIK_M}) exitWith {
    [] call boomerang_cycle_sound_mode;
    true
  };

  if (_control && {_key == DIK_E}) then {
    []  call boomerang_hud_remove;
    true
  };

  false
};

boomerang_remove_hud_keyUp = {
  disableSerialization;
    _display = findDisplay 46;
  if (not(undefined(boomerang_hud_keyUpHandler_id))) then {
    _display displayRemoveEventHandler  ["keyDown",boomerang_hud_keyUpHandler_id];
    boomerang_hud_keyUpHandler_id = nil;
  };
};

boomerang_setup_hud_keyUp = {
  init(_data,_this);

  disableSerialization;
  _display = findDisplay 46;
  if (undefined(boomerang_hud_keyUpHandler_id) ) then {
    boomerang_hud_keyUpHandler_id = _display displayAddEventHandler  ["keyDown",format["[_this,%1] call boomerang_hud_keyUpHandler",_data]];
  };
};



[] spawn boomerang_vehicle_watch;

boomerang_functions_defined = true;

diag_log format["Loading boomerang functions complete"];