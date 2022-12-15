



import 'package:flutter/material.dart';
import '../features/homeScreens/presentation/views/MyCart.dart';
import '../features/homeScreens/presentation/views/helpScreen.dart';
import '../features/homeScreens/presentation/views/home_page.dart';
import '../features/homeScreens/presentation/views/my_favourite.dart';
import '../features/homeScreens/presentation/views/order.dart';
import '../features/homeScreens/presentation/views/settings.dart';
import '../features/homeLayout/tabs/presentation/views/homeLayout.dart';
import '../features/homeScreens/presentation/views/account_page.dart';
import '../features/login/presentation/views/login.dart';
import '../features/onBoard/presention/views/onBoar.dart';
import '../features/signUp/presentation/views/sign up.dart';
import '../features/splash/views/splashScreen.dart';

Map <String, WidgetBuilder>appRoutes= {
  "Splash": (context) => SplashScreen(),
  "Register": (context) => Register(),
  "Home Layout": (context) => HomeLayout(),
  "Test": (context) => MyAccount(),
  "Settings":(context)=>Settings(),
  "Login": (context) => Login(),
  "onBoarding": (context) => OnBoarding(),
  "Account": (context) => MyAccount(),
  "Home":(context)=>HomePage(),
  "Order":(context)=>Order(),
  "Help":(context)=>HelpScreen(),
  "Favourite":(context)=>FavouriteScreen(),
  "Cart":(context)=>CartScreen(),
  "Logout":(context)=>Login()
};
//["Order", "Favourite", "Settings","Cart", "Help" ];