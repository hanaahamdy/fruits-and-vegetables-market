import 'package:flutter/material.dart';
import '../views/AppColors.dart';

import '../views/appStyles.dart';

TextButton buildTextButton(context,{required String  navigatorPageName,required String buttonLabel}) {
  return TextButton(
    onPressed: () {
      Navigator.pushNamedAndRemoveUntil(context,navigatorPageName,(route)=>false);
    },
    child: Text(
      buttonLabel,
      style: AppStyles.smallSize.copyWith(fontSize: 15,color: AppColors.primaryColor),
    ),
  );
}