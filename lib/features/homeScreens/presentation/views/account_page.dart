import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/core/cach_helper/shrad_Prefrecce.dart';
import '../../../../core/utils/views/AppColors.dart';
import '../../../../core/utils/views/appStyles.dart';
import '../../../../core/utils/views/images_routes.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/data/homeBloc/homeBloc.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/data/homeBloc/home_states.dart';

import '../widgets/account_appbar.dart';

class MyAccount extends StatelessWidget {
  List list = [
    {"icon": Icons.shopping_bag_rounded, "title": "My Order"},
    {"icon": Icons.favorite, "title": "My Favourite"},
    {"icon": Icons.settings, "title": "settings"},
    {"icon": Icons.shopping_cart_outlined, "title": "My Cart"},
    {"icon": Icons.help, "title": "help"},
  ];

  List<String> screens = ["Order", "Favourite", "Settings", "Cart", "Help"];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<HomeBloc, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeBloc cubit = HomeBloc.get(context);
        return Scaffold(
            appBar: accountAppbar(
                screenHeight: screenHeight, model: cubit.user!, cubit: cubit),
            body: Column(
              children: [
                Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                Navigator.pushNamed(context, screens[index]);
                              },
                              title: Text(
                                list[index]["title"],
                                style: AppStyles.mediumBlack,
                              ),
                              leading: Icon(
                                list[index]["icon"],
                                size: 30,
                                color: AppColors.primaryColor,
                              ),
                            ),
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            child: Divider(),
                          );
                        },
                        itemCount: list.length)),
                ListTile(
                    onTap: () {
                cubit.signOut(context);
                    },
                    leading: Icon(
                      Icons.logout,
                      size: 30,
                      color: AppColors.primaryColor,
                    ),
                    title: Text(
                      "Logout",
                      style: AppStyles.mediumBlack,
                    ))
              ],
            ));
      },
    );
  }
}
