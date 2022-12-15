import 'package:flutter/material.dart';
import '../../../core/utils/views/AppColors.dart';
import '../../../core/utils/views/AppTexts.dart';
import '../../../core/utils/views/appStyles.dart';

import '../../../core/utils/views/images_routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    delayed_navigation();
    buildAnimatedText();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
              position: slideAnimation,
              child: Text(
                AppTexts.splashText,
                style: AppStyles.largeStyleSize,
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * .66,
          ),
         Image(width: double.infinity,fit: BoxFit.cover
           ,height: 200,
           image: AssetImage(AppImages.splash_logo),
         )
        ],
      ),
    );
  }

  void buildAnimatedText() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    slideAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 7))
        .animate(animationController);
    animationController.forward();
    slideAnimation.addListener(() {
      setState(() {});
    });
    super.initState();
  }
  void delayed_navigation() {
    Future.delayed(Duration(seconds: 5)).then((value) =>
        Navigator.pushNamed(
            context, "onBoarding", ));
  }
}
