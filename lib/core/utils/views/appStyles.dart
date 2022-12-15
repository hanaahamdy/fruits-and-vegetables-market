import 'package:flutter/material.dart';
import 'AppColors.dart';

class AppStyles {
  static const TextStyle veryLargeStyleSize = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 35, color: AppColors.primaryColor);

  static const TextStyle largeStyleSize = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
    fontSize: 25,
  );
  static const TextStyle largeBlack = TextStyle(
    color: AppColors.blackColor,
    fontSize: 20,
  );
  static const TextStyle fruitTitle = TextStyle(
    color: Color(0xff393939),
    fontSize: 14,
  );
  static const TextStyle fruitPrice = TextStyle(
    color: Color(0xff393939),
    fontSize: 12,
  );
  static const TextStyle textFieldLabelStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16,
  );
  static const TextStyle smallSize = TextStyle(
    color: AppColors.gryColor,
    fontSize: 15,
  );
  static const TextStyle smallBlack= TextStyle(
    color: AppColors.blackColor,
    fontSize: 12,
  );
  static const TextStyle mediumBlack= TextStyle(
    color: AppColors.blackColor,
    fontSize: 16,
  );
  static const TextStyle verySmall = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 12,
  );
}
