#include "hud_constants.h"

class boomerang_hud {
  idd = boomerang_hud_idd;
  movingEnable = 1;
  enableSimulation = 0;
  enableDisplay = 0;
  fadein = 0;
  duration = 1e+011;
  fadeout = 0;
  name = "boomerang_hud";
  onLoad = "uiNamespace setVariable ['boomerang_hud',_this select 0]";
  objects[]    = {};
  controls[]   = {
    boomerang_hud_background,
    boomerang_hud_1_led,
    boomerang_hud_2_led,
    boomerang_hud_3_led,
    boomerang_hud_4_led,
    boomerang_hud_5_led,
    boomerang_hud_6_led,
    boomerang_hud_7_led,
    boomerang_hud_8_led,
    boomerang_hud_9_led,
    boomerang_hud_10_led,
    boomerang_hud_11_led,
    boomerang_hud_12_led,
    boomerang_hud_lcd
  };

  LED(1);
  LED(2);
  LED(3);
  LED(4);
  LED(5);
  LED(6);
  LED(7);
  LED(8);
  LED(9);
  LED(10);
  LED(11);
  LED(12);

  class boomerang_hud_background: gui_RscPictureKeepAspect {
    idc = boomerang_hud_background_idc;
    x = -10; y = -10;
    w = 0.1; h = 0.1;
  };

  class boomerang_hud_lcd: gui_RscText {
    idc = boomerang_hud_lcd_idc;
    x = -10; y = -10;
    w = 0.1; h = 0.1;
    text = "";
  };
};