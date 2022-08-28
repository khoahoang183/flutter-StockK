import 'package:flutter/material.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class ResourceColors {
  static const String color_black = "#FF000000";
  static const String color_white = "#FFFFFFFF";
  static const String color_bg_splash_screen = "#FFCF27";

  static const String colorPrimary = "#FFCF27";
  static const String colorPrimarySecond = "#FF018786";
  static const String colorPrimaryText = "#B46FFF";

  static const String color_hint_dark = "#CBCBCB";
  static const String color_view_dark = "#DEDEDE";
  static const String color_bg_disable = "#F5F4F0";

  // Color in login screen
  static const String color_bg_yellow_main = "#FFCF27";
  static const String color_stroke_gray_login_screen = "#CCCCCC";
  static const String color_bg_gray_confirm = "#B3B3B3";
  static const String color_bg_purple_confirm = "#B46FFF";

  // Color in profile screen
  static const String color_bg_link = "#FFFBEF";

  // Color in settings screen
  static const String color_bg_gray_divider = "#F2F2F2";
  static const String color_bg_gray_select_1 = "#333333";
  static const String color_bg_gray_select_2 = "#999999";

  // Text color in app
  static const String color_text_gray_1 = "#1A1A1A";
  static const String color_text_gray_2 = "#B3B3B3";
  static const String color_text_gray_3 = "#4C4C4C";
  static const String color_text_gray_4 = "#999999";
  static const String color_text_gray_5 = "#808080";
  static const String color_text_gray_6 = "#666666";
  static const String color_text_gray_7 = "#F8F8F8";
  static const String color_text_gray_8 = "#E9E9E9";
  static const String color_text_gray_9 = "#FDFDFD";
  static const String color_text_gray_10 = "#f1f1f1";
  static const String color_text_gray_11 = "#fcfcfc";
  static const String color_text_gray_12 = "#393939";

  static const String color_text_brown_1 = "#3C1E1E";
  static const String color_text_red = "#FF4F4F";

  static const String color_bg_dialog_config = "#99C4C4C4";
  static const String color_tool_tip = "#B46FFF";
  static const String color_text_tab = "#891DFF";
  static const String color_bg_sticker = "#F4F4F4";
  static const String color_bg_image_select = "#00A8A4";
  static const String color_bg_text_filter = "#E5E5E5";
  static const String color_text_disable = "#999999";

  // Color of bg dialog
  static const String color_bg_view_dialog = "#E5E5E5";
  static const String color_bg_dialog_dim = "#80323232";

  // Color of gradient
  static const String color_gradient_start = "#B46FFF";
  static const String color_gradient_end = "#FFCF27";
  static const String color_bg_sticker_gradient_start = "#F4F4F4";
  static const String color_bg_sticker_gradient_end = "#D7D7D7";

  // Color of button disable
  static const String color_button_disable = "#B3B3B3";

  // Color of setting screen
  static const String color_text_setting = "#333333";
  static const String color_text_setting_version = "#808080";

  // Color of sticker select
  static const String color_sticker_select = "#B46FFF";

  // Color of bg daily attendance
  static const String color_bg_daily_attendance = "#F2F2F2";
  static const String color_text_sunday = "#FF4F4F";
  static const String color_text_day = "#999999";
  static const String color_item_day = "#CCCCCC";
  static const String color_item_day_active = "#B46FFF";

  static const String color_bg_suggest_ai = "#60B3B3B3";

  // Color of text note auto delete
  static const String color_text_auto_delete = "#969696";

  // Color of text note auto delete
  static const String color_bg_input_search = "#F6F6F6";
  static const String color_tab_select = "#FFC600";

  // Color of icon view dot
  static const String color_ic_view_image_select = "#FFFFFFFF";
  static const String color_ic_view_image_un_select = "#60FFFFFF";

  static const String color_gray_main = "#d5d1c8";
  static const String color_green_main = "#006340";
  static const String color_green_light_main = "#e4fdf2";
}
