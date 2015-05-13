//@file Version: 1.1
//@file Name: gearLevel4.sqf
//@file Author: Cael817, based of something i found

if (((getPlayerUID player) in call gearLevel4)) then {

player setVariable ["cmoney", (player getVariable "cmoney") + 400, true];

removeAllWeapons player;
//removeUniform player;
//removeallitems player;
//removeVest player;
//removeBackpack player;
//removeGoggles player;
removeHeadgear player;
clearMagazineCargo player;

player addBackpack "";
//player addUniform "U_B_CTRG_1";
player addVest "";	
player linkItem "";
player linkItem "";
player addWeapon "Binocular";
player addMagazines ["MiniGrenade", 1];
player addItem "FirstAidKit";
player addItem "";
player addItem "";
player addItem "";
player addItem "";
player addGoggles "";
player addHeadgear "H_Shemag_khk";

player addMagazines ["11Rnd_45ACP_Mag", 3];
player addWeapon "hgun_Pistol_heavy_01_F";
player addhandGunItem "optic_MRD";
player addhandGunItem "";

player addMagazines ["", 0];
player addWeapon "";
player addPrimaryWeaponItem "";
player addPrimaryWeaponItem "";
player addPrimaryWeaponItem "";
player selectWeapon "";

};
