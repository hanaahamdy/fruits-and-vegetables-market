import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/config/thems.dart';
import 'package:fruit_market_app/core/cach_helper/shrad_Prefrecce.dart';
import 'core/utils/views/AppTexts.dart';

import 'config/routes.dart';

import 'core/utils/blocObserver.dart';
import 'features/homeLayout/tabs/data/homeBloc/homeBloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
 userId=await LocalHelper.getDate(key: "userId");
  print(userId);
  runApp(MyApp(id: userId,));
}

class MyApp extends StatelessWidget {
  final String? id;
   MyApp({required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()
        ..getStoneFruit()
        ..getMixedFruit()
        ..getOrganicFruit()
        ..getVegetables()
        ..mixedVegetables()
        ..alliumVegetables()..getUserdata(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: appRoutes,
        theme: appTheme(),
        initialRoute:id !=null ?"Home Layout":"Login",
      ),
    );
  }
}
