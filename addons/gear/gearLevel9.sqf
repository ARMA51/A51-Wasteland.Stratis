//@file Version: 1.1
//@file Name: gearLevel9.sqf
//@file Author: Cael817, based of something i found

if (((getPlayerUID player) in call gearLevel9)) then {

player setVariable ["cmoney", (player getVariable "cmoney") + 900, true];

removeAllWeapons player;
//removeUniform player;
//removeallitems player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;
clearMagazineCargo player;

player addBackpack "B_Carryall_mcamo";
//player addUniform "U_B_CTRG_1";
player addVest "V_PlateCarrierSpec_rgr";	
player linkItem "NVGoggles";
player linkItem "ItemGPS";
player addWeapon "Rangefinder";
player addMagazines ["MiniGrenade", 3];
player addItem "FirstAidKit";
player addItem "";
player addItem "";
player addItem "";
player addItem "optic_NVS";
player addGoggles "";
player addHeadgear "H_HelmetSpecB_paint2";

player addMagazines ["11Rnd_45ACP_Mag", 3];
player addWeapon "hgun_Pistol_heavy_01_F";
player addhandGunItem "optic_MRD";
player addhandGunItem "muzzle_snds_acp";

player addMagazines ["30Rnd_65x39_caseless_mag_Tracer", 5];
player addWeapon "arifle_MX_F";
player addPrimaryWeaponItem "optic_Aco";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "muzzle_snds_H";
player selectWeapon "arifle_MX_F";

};
