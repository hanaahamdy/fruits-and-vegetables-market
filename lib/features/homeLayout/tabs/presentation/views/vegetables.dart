import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/presentation/widgets/builCategioriesTitles.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/presentation/widgets/buildHorizonalListview.dart';

import '../../data/homeBloc/homeBloc.dart';
import '../../data/homeBloc/home_states.dart';
class VegetablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<HomeBloc, HomeStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = HomeBloc.get(context);
        return ListView(
          physics: BouncingScrollPhysics(),
          children: [
            CategoryTitles(
                firstTitle: "Organic Vegetables",
                detailTitle: "pick up from organic frame",
                offer: "(20% off)"),
            buildListView(list: cubit.vegetables),
            CategoryTitles(
                firstTitle: "Mixed Vegetables Pack",
                detailTitle: "Vegetable mix fresh pack",
                offer: "(10% Off)"),
           buildListView(list: cubit.mixed_Vegetables),
            CategoryTitles(
                firstTitle: "Allium Vegetabels",
                detailTitle: "Fresh Allium Vegetables",
                offer: "(25% Off)"),
        buildListView(list: cubit.allium_Vegetables),
          ],
        );
      },
    );
  }
}


