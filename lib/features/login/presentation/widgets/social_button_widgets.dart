import 'package:flutter/material.dart';

import '../../../../core/utils/views/AppColors.dart';
import '../../../../core/utils/views/appStyles.dart';

Widget buildSocialLoginButton({required buttonLogo}) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(8),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: BorderSide(color: AppColors.gryColor),
        backgroundColor: AppColors.whiteColor,
        elevation: 0),
    icon: Image(
      image: AssetImage(buttonLogo),
    ),
    onPressed: () {},
    label: Text(
      "Login with ",
      style: AppStyles.smallSize,
    ),
  );
}