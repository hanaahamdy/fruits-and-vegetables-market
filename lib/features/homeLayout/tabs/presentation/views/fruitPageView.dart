import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/homeBloc/homeBloc.dart';
import '../../data/homeBloc/home_states.dart';
import '../widgets/builCategioriesTitles.dart';
import '../widgets/buildHorizonalListview.dart';

class FruitPage extends StatelessWidget {
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
                  firstTitle: "Organic Fruits",
                  detailTitle: "pick up from organic frame",
                  offer: "(20% off)"),
              buildListView(list: cubit.fruitList,),
              CategoryTitles(
                  firstTitle: "Mixed Fruit Pack",
                  detailTitle: "Fruit mix fresh pack",
                  offer: "(10% Off)"),
              buildListView(list: cubit.mixedFruit),
              CategoryTitles(
                  firstTitle: "Stone Fruit Pack",
                  detailTitle: "Fruit mix fresh pack",
                  offer: "(25% Off)"),
              buildListView(list: cubit.stoneFruit),
            ],
          );
        },
    );
  }
}

