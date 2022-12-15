import 'package:flutter/material.dart';

import '../views/AppColors.dart';

Widget DefaultButton(
    {required String iconLabel,
    required VoidCallback buttonAction,
    double width = double.infinity,
    Color color = AppColors.primaryColor}) {
  return Container(
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(12),
              backgroundColor: color),
          onPressed: buttonAction,
          child: Text(iconLabel)));
}
