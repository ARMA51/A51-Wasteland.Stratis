#define ST_RIGHT 0x01

class osefStatusBar {
	idd = -1;
	onLoad = "uiNamespace setVariable ['osefStatusBar', _this select 0]";
	onUnload = "uiNamespace setVariable ['osefStatusBar', objNull]";
	onDestroy = "uiNamespace setVariable ['osefStatusBar', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 1;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 1000;
			x = safezoneX + safezoneW - 2.50;
			y = safezoneY + safezoneH - 0.04;
			w = 2.00;
			h = 0.04;
			shadow = 2;
			colorBackground[] = { 1, 0.3, 0, 0.0 };
			font = "PuristaSemibold";
			size = 0.04;
			type = 13;
			style = 1;
			text="Loading statusBar...";
			class Attributes {
				align="center";
				color = "#ffffff";
			};
		};
	};
};