// load player textures

_uid = getPlayerUID player;
	
_g4 = [

		// uids

];

_clans = [

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
			player setObjectTextureGlobal  [0, "client\images\vehicleTextures\digicam.jpg"];   			
		};
		
			case (_uid in _SWWD):
		{
			player setObjectTextureGlobal  [0, "client\images\vehicleTextures\SWWD.jpg"];  	
		};
		
			case (_uid in _rank1):
		{
			player setObjectTextureGlobal  [0, "client\images\vehicleTextures\camo_fuel.jpg"];  		
		};		
		
			case (_uid in _rank2):
		{
			player setObjectTextureGlobal  [0, "client\images\vehicleTextures\redcamo.jpg"];  		
		};		
		
			case (_uid in _rank3):
		{
			player setObjectTextureGlobal  [0, "client\images\vehicleTextures\IceCamo.jpg"];  		
		};		
		
			case (_uid in _rank4):
		{
			player setObjectTextureGlobal  [0, "client\images\vehicleTextures\kitty.jpg"];  		
		};		
		
			case (_uid in _rank5):
		{
			player setObjectTextureGlobal  [0, "client\images\vehicleTextures\digicam.jpg"]; 	
		};		
	};
	