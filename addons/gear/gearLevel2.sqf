//@file Version: 1.1
//@file Name: gearLevel2.sqf
//@file Author: Cael817, based of something i found

if (((getPlayerUID player) in call gearLevel2)) then {

player setVariable ["cmoney", (player getVariable "cmoney") + 12500, true];

removeAllWeapons player;
removeUniform player;
//removeallitems player;
//removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;
clearMagazineCargo player;

player addBackpack "B_Kitbag_sgg";
player forceAddUniform "U_I_GhillieSuit";
player addVest "";	
player linkItem "NVGoggles";
player linkItem "ItemGPS";
player addWeapon "";
player addMagazines ["", 0];
player addItem "";
player addItem "";
player addItem "MediKit";
player addItem "";
player addItem "optic_NVS";
player addGoggles "";
player addHeadgear "H_Cap_blk_Raven";

player addMagazines ["11Rnd_45ACP_Mag", 3];
player addWeapon "hgun_Pistol_heavy_01_F";
player addhandGunItem "optic_MRD";
player addhandGunItem "muzzle_snds_acp";

player addMagazines ["", 0];
player addWeapon "";
player addPrimaryWeaponItem "";
player addPrimaryWeaponItem "";
player addPrimaryWeaponItem "";
player selectWeapon "";

};
