import 'package:flutter/material.dart';
import '../../../../core/utils/views/AppColors.dart';
import '../../../../core/utils/views/AppTexts.dart';
import '../../../../core/utils/views/appStyles.dart';
import '../../../../core/utils/views/images_routes.dart';
import '../../data/onBoardModel.dart';
import '../widgets/buildPageViewContent.dart';

class OnBoarding extends StatelessWidget {
  List<OnBoardModel> onBoardItems = [
    OnBoardModel(
        firstTitle: AppTexts.onBoardFirstTitleFirstPage,
        secondTitle: AppTexts.onBoardSecondTitleFirstPage,
        image: AppImages.onBoard1Image),
    OnBoardModel(
        firstTitle: AppTexts.onBoardFirstTitleSecondPage,
        secondTitle: AppTexts.onBoardSecondTitleSecondPage,
        image: AppImages.onBoard2Image),
    OnBoardModel(
        firstTitle: AppTexts.onBoardFirstTitleThirdPage,
        secondTitle: AppTexts.onBoardSecondTitleThirdPage,
        image: AppImages.onBoard3Image)
  ];
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: PageView.builder(
            controller: pageController,
            itemCount: onBoardItems.length,
            itemBuilder: (context, index) => buildPageViewComponent(
                context,
                screenHeight,
                onBoardItems[index],
                index,
                onBoardItems,
                pageController)));
  }
}


