//@file Version: 1.1
//@file Name: gearLevel10.sqf
//@file Author: Cael817, based of something i found

if (((getPlayerUID player) in call gearLevel10)) then {

player setVariable ["cmoney", (player getVariable "cmoney") + 1000, true];

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
player addWeapon "Laserdesignator";
player addMagazines ["MiniGrenade", 3];
player addItem "FirstAidKit";
player addItem "ToolKit";
player addItem "MediKit";
player addItem "";
player addItem "optic_NVS";
player addGoggles "";
player addHeadgear "H_HelmetSpecB_paint2";

player addMagazines ["11Rnd_45ACP_Mag", 3];
player addWeapon "hgun_Pistol_heavy_01_F";
player addhandGunItem "optic_MRD";
player addhandGunItem "muzzle_snds_acp";

player addMagazines ["20Rnd_762x51_Mag", 8];
player addWeapon "srifle_EBR_F";
player addPrimaryWeaponItem "optic_DMS";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "muzzle_snds_B";
player selectWeapon "srifle_EBR_F";

};
