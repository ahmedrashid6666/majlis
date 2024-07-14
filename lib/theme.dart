import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'assets.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData selectedTheme;
  final Typography defaultTypography = Typography();
  late SharedPreferences prefs;

  ThemeData dark = ThemeData.dark().copyWith(
    sliderTheme: SliderThemeData(
      activeTrackColor: amber,
      inactiveTrackColor: amber.withOpacity(0.3),
      thumbColor: amber,
      overlayColor: amber.withAlpha(32),
    ),
    unselectedWidgetColor: blk,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontFamily: "lpmq",
        fontWeight: FontWeight.w500,
        fontSize: 23,
        color: white,
      ),
      titleSmall: TextStyle(
        fontSize: 19,
        fontFamily: 'lpmq',
        color: blk,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(
        color: brown,
      ),
      labelColor: brown,
    ),
    primaryColor: Color(0xFF282828),
    primaryColorDark: Color(0xFF282828),
    scaffoldBackgroundColor: brown,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color.fromARGB(255, 63, 63, 63),
      secondary: Color(0xFF282828),
    ).copyWith(background: Color(0xFFE7E7E7)).copyWith(secondary: Color(0xFF424242)),
  );

  ThemeData light = ThemeData.light().copyWith(
    sliderTheme: SliderThemeData(
      activeTrackColor: mainColor,
      inactiveTrackColor: mainColor.withOpacity(0.3),
      thumbColor: mainColor,
      overlayColor: mainColor.withAlpha(32),
    ),
    unselectedWidgetColor: blk,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: mainColor,
        fontFamily: "lpmq",
        fontWeight: FontWeight.w500,
        fontSize: 23,
      ),
      titleSmall: TextStyle(
        fontSize: 19,
        fontFamily: 'lpmq',
        color: white,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(
        color: mainColor,
      ),
      labelColor: mainColor,
    ),
    primaryColor: Color(0xff074425),
    primaryColorDark: Color(0xff074425),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFE7E7E7),
    colorScheme: ColorScheme.light(
      primary: Color(0xff06558A),
      secondary: Color(0xff003152),
    ).copyWith(secondary: white).copyWith(background: mainColor),
  );

  ThemeProvider(bool darkThemeOn) {
    selectedTheme = darkThemeOn ? dark : light;
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    notifyListeners();
  }

  Future<void> swapTheme() async {
    if (selectedTheme == dark) {
      selectedTheme = light;
      await prefs.setBool("darkTheme", false);
    } else {
      selectedTheme = dark;
      await prefs.setBool("darkTheme", true);
    }
    notifyListeners();
  }

  ThemeData getTheme() => selectedTheme;
}
