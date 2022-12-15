import 'package:flutter/material.dart';

import '../../../../core/utils/views/AppColors.dart';

ElevatedButton defaultButton(
int index, List<dynamic> onBoardItem, context, PageController controller) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor, minimumSize: Size(150, 40)),
      onPressed: () {
        index == onBoardItem.length - 1
            ? Navigator.pushNamed(context, "Login")
            : controller.nextPage(
            duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      },
      child: Text("Next"));
}