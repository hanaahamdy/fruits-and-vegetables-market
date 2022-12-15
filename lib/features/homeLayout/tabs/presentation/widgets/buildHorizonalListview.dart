import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/views/appStyles.dart';


import '../../data/Fruit_model/fruit_model.dart';
import 'build_horizntal_item.dart';

Container buildListView({
  required List<FruitModel> list,
}) {
  return Container(
    child: ListView.builder(physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            build_horizenta_item(context, list, index),
            Text(
              list[index].name,
              style: AppStyles.fruitTitle,
            ),
            Text(
              "${list[index].price} Per/ kg",
              style: AppStyles.fruitPrice,
            )
          ],
        );
      },
      itemCount: list.length,
      scrollDirection: Axis.horizontal,
    ),
    height: 220,
  );
}

