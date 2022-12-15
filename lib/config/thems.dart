import 'package:flutter/material.dart';
import '../core/utils/views/AppColors.dart';

ThemeData appTheme() {
  return ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.shifting,
          elevation: 0,
          selectedItemColor: AppColors.gryColor,
          unselectedItemColor: AppColors.gryColor
      ),
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,
      buttonColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Poppins");
}
