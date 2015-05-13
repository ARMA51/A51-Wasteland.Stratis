// Supporter Loadouts Start here 

_uid = getPlayerUID player;

_g4 = [

// uids

];

_Clans = [

// uids

];

_rank1 = [

// uids


];

_rank2 = [

// uids


];

_rank3 = [

// uids

];

_rank4 = [

// uids


];

_rank5 = [

// uids

];

switch (true) do {
	case (_uid in _g4):
		{
		removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			_player addBackpack "B_Carryall_ocamo";
			_player addVest "V_PlateCarrierIAGL_dgtl";
			_player forceAddUniform "U_B_GhillieSuit";
			_player addWeapon "arifle_mas_l119_m203_v_sd";
			_player addPrimaryWeaponItem "optic_mas_Hamr_camo";
			_player addMagazine "30Rnd_mas_556x45_Stanag";
			_player addMagazine "30Rnd_mas_556x45_Stanag";
			_player addMagazine "1Rnd_HE_Grenade_shell";
			_player addMagazine "1Rnd_HE_Grenade_shell";
			_player addItemtoBackpack "HandGrenade";
			_player addWeapon "hgun_mas_glocksf_F";
			_player addHandgunItem "muzzle_mas_snds_L";
			_player addHandgunItem "optic_Yorris";
			_player addMagazine "12Rnd_mas_45acp_Mag";
			_player addMagazine "12Rnd_mas_45acp_Mag";
			_player addItem "Medikit";
			_player addWeapon "Rangefinder";
			_player addItemToBackpack "FirstAidKit";
			_player addItemToBackpack "FirstAidKit";
			_player addHeadgear "H_HelmetLeaderO_ocamo";	
			_player setObjectTextureGlobal  [0, "client\images\vehicleTextures\digicam.jpg"];   	
		};
		
			case (_uid in _Clans):
		{
			removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			_player addBackpack "B_Carryall_ocamo";
			_player addVest "V_PlateCarrierIAGL_dgtl";
			_player forceAddUniform "U_B_GhillieSuit";
			_player addWeapon "arifle_mas_l119_m203_v_sd";
			_player addPrimaryWeaponItem "optic_mas_Hamr_camo";
			_player addMagazine "30Rnd_mas_556x45_Stanag";
			_player addMagazine "30Rnd_mas_556x45_Stanag";
			_player addMagazine "1Rnd_HE_Grenade_shell";
			_player addMagazine "1Rnd_HE_Grenade_shell";
			_player addItemtoBackpack "HandGrenade";
			_player addWeapon "hgun_mas_glocksf_F";
			_player addHandgunItem "muzzle_mas_snds_L";
			_player addHandgunItem "optic_Yorris";
			_player addMagazine "12Rnd_mas_45acp_Mag";
			_player addMagazine "12Rnd_mas_45acp_Mag";
			_player addItem "Medikit";
			_player addWeapon "Rangefinder";
			_player addItemToBackpack "FirstAidKit";
			_player addItemToBackpack "FirstAidKit";
			_player addHeadgear "H_HelmetLeaderO_ocamo";
			_player setObjectTextureGlobal  [0, "client\images\vehicleTextures\SWWD.jpg"];
		};
		
			case (_uid in _rank1):
		{
			removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			_player addBackpack "B_Bergen_mcamo";
			_player addVest "V_TacVest_camo";
			_player forceAddUniform "U_B_CombatUniform_mcam_tshirt";
			_player addWeapon "arifle_mas_mp5SD_e";
			_player addItem "HandGrenade";
			_player addMagazine "30Rnd_mas_9x21_Stanag";
			_player addMagazine "30Rnd_mas_9x21_Stanag";
			_player addWeapon "hgun_mas_glocksf_F";
			_player addMagazine "12Rnd_mas_45acp_Mag";
			_player addMagazine "12Rnd_mas_45acp_Mag";
			_player addItem "Medikit";
			_player addWeapon "Binoculars";
			_player addItem "FirstAidKit";
			_player addHeadgear "H_Cap_brn_SPECOPS";
			_player setObjectTextureGlobal  [0, "client\images\vehicleTextures\camo_fuel.jpg"];
		};
		
			case (_uid in _rank2):
		{
			removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			_player addBackpack "B_Kitbag_mcamo";
			_player addVest "V_TacVest_camo";
			_player forceAddUniform "U_I_GhillieSuit";
			_player addWeapon "arifle_mas_mk16_l_gl";
			_player addPrimaryWeaponItem "optic_mas_ACO_grn_camo";
			_player addMagazine "30Rnd_mas_556x45_Stanag";
			_player addMagazine "30Rnd_mas_556x45_Stanag";
			_player addMagazine "1Rnd_HE_Grenade_shell";
			_player addMagazine "1Rnd_HE_Grenade_shell";
			_player addItem "HandGrenade";
			_player addWeapon "hgun_mas_glocksf_F";
			_player addMagazine "11Rnd_45ACP_Mag";
			_player addMagazine "11Rnd_45ACP_Mag";
			_player addItem "Medikit";
			_player addWeapon "Binoculars";
			_player addItemToUniform "FirstAidKit";
			_player addItemToUniform "FirstAidKit";
			_player addHeadgear "H_HelmetB_camo";	
			_player setObjectTextureGlobal  [0, "client\images\vehicleTextures\redcamo.jpg"];		
		};
		
			case (_uid in _rank3):
		{
			removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			_player addBackpack "B_Carryall_oucamo";
			_player addVest "V_PlateCarrierIAGL_dgtl";
			_player forceAddUniform "U_O_GhillieSuit";
			_player addWeapon "arifle_mas_akms_gl_c_sd";
			_player addPrimaryWeaponItem "optic_mas_Hamr_camo";
			_player addItem "HandGrenade";
			_player addItem "HandGrenade";
			_player addMagazine "30Rnd_mas_762x39_T_mag";
			_player addMagazine "30Rnd_mas_762x39_T_mag";
			_player addMagazine "30Rnd_mas_762x39_T_mag";
			_player addItem "1Rnd_HE_Grenade_shell";
			_player addItem "1Rnd_HE_Grenade_shell";
			_player addWeapon "hgun_mas_sa61_F";
			_player addHandgunItem "muzzle_mas_snds_LM";
			_player addHandgunItem "optic_mas_MRD";
			_player addMagazine "20Rnd_mas_765x17_Mag";
			_player addMagazine "20Rnd_mas_765x17_Mag";
			_player addItem "Medikit";
			_player addWeapon "Rangefinder";
			_player addItem "FirstAidKit";
			_player addItem "FirstAidKit";
			_player addHeadgear "H_PilotHelmetHeli_O";
			_player setObjectTextureGlobal  [0, "client\images\vehicleTextures\IceCamo.jpg"];
		};
		
			case (_uid in _rank4):
		{
			removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			_player addBackpack "B_Carryall_oucamo";
			_player addVest "V_PlateCarrierIA2_dgtl";
			_player forceAddUniform "U_B_GhillieSuit";
			_player addWeapon "srifle_mas_hk417_v_sd";
			_player addPrimaryWeaponItem "optic_mas_Hamr_camo";
			_player addMagazine "20Rnd_mas_762x51_Stanag";
			_player addMagazine "20Rnd_mas_762x51_Stanag";
			_player addItem "HandGrenade";
			_player addItem "HandGrenade";
			_player addWeapon "hgun_Pistol_heavy_01_snds_F";
			_player addMagazine "11Rnd_45ACP_Mag";
			_player addMagazine "11Rnd_45ACP_Mag";
			_player addItem "Medikit";
			_player addWeapon "Rangefinder";
			_player addItemToUniform "FirstAidKit";
			_player addItemToUniform "FirstAidKit";
			_player addHeadgear "H_PilotHelmetHeli_O";	
			_player setObjectTextureGlobal  [0, "client\images\vehicleTextures\SWWD.jpg"]; 
		};	
		
					case (_uid in _rank5):
		{
			removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			removeAllWeapons _player;
			removeVest _player;
			removeBackpack _player;
			_player addBackpack "B_Carryall_mcamo";
			_player addVest "V_PlateCarrierIAGL_dgtl";
			_player forceAddUniform "U_O_Wetsuit";
			_player addWeapon "arifle_mas_akms_gl_c_sd";
			_player addPrimaryWeaponItem "optic_mas_Hamr_camo";
			_player addItem "HandGrenade";
			_player addItem "HandGrenade";
			_player addMagazine "30Rnd_mas_762x39_T_mag";
			_player addMagazine "30Rnd_mas_762x39_T_mag";
			_player addMagazine "30Rnd_mas_762x39_T_mag";
			_player addItem "1Rnd_HE_Grenade_shell";
			_player addItem "1Rnd_HE_Grenade_shell";
			_player addWeapon "hgun_mas_sa61_F";
			_player addHandgunItem "muzzle_mas_snds_LM";
			_player addHandgunItem "optic_mas_MRD";
			_player addMagazine "20Rnd_mas_765x17_Mag";
			_player addMagazine "20Rnd_mas_765x17_Mag";
			_player addItem "Medikit";
			_player addWeapon "Rangefinder";
			_player addItem "FirstAidKit";
			_player addItem "FirstAidKit";
			_player addHeadgear "H_HelmetSpecO_blk";
			_player setObjectTextureGlobal  [0, "client\images\vehicleTextures\digicam.jpg"];   

		};	
			
		default
		{
		_player addBackpack "B_FieldPack_cbr";
		_player addWeapon "hgun_mas_mak_F";
		_player addWeapon "hgun_mas_mp7_F";
		_player addMagazine "40Rnd_mas_46x30_Mag";
		_player addMagazine "8Rnd_mas_9x18_Mag";
		_player addMagazine "8Rnd_mas_9x18_Mag";
		_player addItem "FirstAidKit";
		_player selectWeapon "hgun_mas_mp7_F"
		};
	};
