/* 	*********************************************************************** */

/*	=======================================================================
/*	SCRIPT NAME: Server Intro Credits Script by IT07
/*	SCRIPT VERSION: v1.3.4 BETA
/*	Credits for original script: Bohemia Interactive http://bistudio.com
/*	=======================================================================

/*	*********************************************************************** */

//	========== SCRIPT CONFIG ============
	
_onScreenTime = 10; 		//how long one role should stay on screen. Use value from 0 to 10 where 0 is almost instant transition to next role 
//NOTE: Above value is not in seconds!

//	==== HOW TO CUSTOMIZE THE CREDITS ===
//	If you want more or less credits on the screen, you have to add/remove roles.
//	Watch out though, you need to make sure BOTH role lists match eachother in terms of amount.
//	Just take a good look at the _role1 and the rest and you will see what I mean.

//	For further explanation of it all, I included some info in the code.

//	== HOW TO CUSTOMIZE THE COLOR OF CREDITS ==
//	Find line **** and look for: color='#f2cb0b'
//	The numbers and letters between the 2 '' is the HTML color code for a certain yellow.
//	If you want to change the color of the text, search on google for HTML color codes and pick the one your like.
//	Then, replace the existing color code for the code you would like to use instead. Don't forget the # in front of it.
//	HTML Color Codes Examples:	
//	#FFFFFF (white)
//	#000000 (black)	No idea why you would want black, but whatever
//	#C80000 (red)
//	#009FCF (light-blue)
//	#31C300 (Razer Green)			
//	#FF8501 (orange)
//	===========================================


//	SCRIPT START

waitUntil {!isNull player};
waitUntil {alive player};
sleep 15; //Wait in seconds before the credits start after player IS ingame

_role1 = "Welcome back to";
_role1names = ["YOUR NAME Wasteland Stratis!"];
_role2 = "Visit our website at";
_role2names = ["www.YOURNAME.tk"];
_role3 = "Join our teamspeak at";
_role3names = ["YOURNAME.ts3dns.com"];
_role4 = "Want to help maitain the server ?";
_role4names = ["Donate on our website!"];
_role5 = "Need more ingame money ?";
_role5names = ["Check our website!"];
_role6 = "Want custom gear loadouts ?";
_role6names = ["Check our website!"];
_role7 = "From all YOUR NAME team,";
_role7names = ["thank you and have fun!"];

{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.60' color='#B40404' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.80' color='#D8D8D8' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],	//DEFAULT: 0.5,0.35
		[safezoneY + safezoneH - 0.8,0.7], 	//DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
	//The list below should have exactly the same amount of roles as the list above
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names],
	[_role5, _role5names],
	[_role6, _role6names],
	[_role7, _role7names]
	];