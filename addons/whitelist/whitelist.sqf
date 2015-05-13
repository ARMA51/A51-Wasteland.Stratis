// BLUFOR WHITELISTING FOR CLAN MEMBERS !
_BLUFOR_Whitelist = [

// uids

];

if(playerSide == BLUFOR) then
{
	if(!((getPlayerUID player) in _BLUFOR_Whitelist)) then
	{
		hint "BLUFOR is Whitelisted for Sierra Whiskey Wild Dogs Only!";
		titleFadeOut 9999;
		titleText [format["BLUFOR is Whitelisted for supporting clans only!"],"PLAIN",0];
		[] spawn{
			sleep 5;
			endMission "Enquire on Teamspeak! CPTTS.GAMESERVERS.COM:9194";
		}
	};
};
