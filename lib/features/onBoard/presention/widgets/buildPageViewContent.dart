import 'package:flutter/material.dart';
import '../../../../core/utils/views/appStyles.dart';
import 'package:fruit_market_app/features/onBoard/presention/widgets/on_board_elevatedButton.dart';
import 'package:fruit_market_app/features/onBoard/presention/widgets/pageIndicator.dart';

import '../../../../core/utils/views/AppColors.dart';
import '../../data/onBoardModel.dart';
import '../../../../core/utils/widgets/TextButton.dart';
import 'buildPageViewContent.dart';

Widget buildPageViewComponent(context, double screenHeight, OnBoardModel model,
    int index, List onBoardItem, PageController controller) {
  return Column(
    children: [
      SizedBox(
        height: screenHeight * .1,
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: buildTextButton(context,navigatorPageName:  "Login",buttonLabel: "Skip"),
      ),
      Expanded(
          child: Image(
            image: AssetImage(model.image),
          )),
      Text(
        model.firstTitle,
        style: AppStyles.largeBlack,
      ),
      SizedBox(
        height: screenHeight * .01,
      ),
      Text(
        model.secondTitle,
        style: AppStyles.smallSize,
      ),
      SizedBox(
        height: screenHeight * .04,
      ),
      buildPageIndicator(index),
      SizedBox(
        height: screenHeight * .06,
      ),
      defaultButton(index, onBoardItem, context, controller),
      SizedBox(
        height: screenHeight * .1,
      )
    ],
  );
}






