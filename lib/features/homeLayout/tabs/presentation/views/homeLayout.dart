import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/data/homeBloc/home_states.dart';
import '../../data/homeBloc/homeBloc.dart';
class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<HomeBloc,HomeStates>(builder: (context,state){
      var cubit=HomeBloc.get(context);
     return DefaultTabController(
        length: 3,
        child: Scaffold(
          body:
          cubit.screens[cubit.current_index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: HomeBloc.get(context).current_index,
            onTap: (ind) {
              HomeBloc.get(context).changeNav(ind);
            },
            items: HomeBloc.get(context).bottomItems,
          ),
        ),
      );
    }, listener: (context,state){});
  }
}
