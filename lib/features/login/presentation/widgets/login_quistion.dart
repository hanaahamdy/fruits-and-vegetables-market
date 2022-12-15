import 'package:flutter/material.dart';

import '../../../../core/utils/views/AppColors.dart';
import '../../../../core/utils/widgets/TextButton.dart';

Widget login_register_question(BuildContext context,
    {required String question,
      required String option,
      required String pageName}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        question,
        style: TextStyle(fontSize: 13, color: AppColors.gryColor),
      ),
      buildTextButton(context,
          buttonLabel: option, navigatorPageName: pageName)
    ],
  );
}