import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/login/data/login_states/login_states.dart';

import '../views/AppColors.dart';

Widget buildConditionalButton(
    {required state, required Widget trueConditionReturn}) {
  return ConditionalBuilder(
      condition: state,
      builder: (context) => trueConditionReturn,
      fallback: (context) => Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ));
}