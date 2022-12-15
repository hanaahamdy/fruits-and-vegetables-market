import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/data/homeBloc/homeBloc.dart';

import '../../../../detail_screen/presentation/views/detail_screen.dart';

import '../../data/Fruit_model/fruit_model.dart';

InkWell build_horizenta_item(BuildContext context, List<FruitModel> list,
    int index) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(
                    model: list[index],
                  )));
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10,),
      child: Stack(alignment: Alignment.topRight,
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Image(
                fit: BoxFit.cover,
                width: 140,
                height: 143,
                image: NetworkImage(list[index].image)),
          ),
          IconButton(onPressed: () {

          }, icon: Icon(Icons.favorite_outline, color: Colors.grey,))
        ],
      ),
    ),
  );
}
