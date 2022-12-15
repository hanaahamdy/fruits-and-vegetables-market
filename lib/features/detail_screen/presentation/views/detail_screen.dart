import 'package:flutter/material.dart';
import '../../../../core/utils/views/appStyles.dart';
import '../../../../core/utils/widgets/defaultButton.dart';

import '../../../../core/utils/views/AppColors.dart';
import '../../../homeLayout/tabs/data/Fruit_model/fruit_model.dart';


class DetailScreen extends StatelessWidget {
  final FruitModel model;

  DetailScreen({required this.model});

  @override
  Widget build(BuildContext context) {
    double homeWidth = MediaQuery.of(context).size.width;
    double homeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 12,
          left: 12,
          right: 12,
        ),
        child: ListView(physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Image(
                    image: NetworkImage(model.image),
                  )),
            ),
            Text(model.name,
                style: AppStyles.mediumBlack
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
            Container(
              child: Text(
                model.description,
                style: AppStyles.smallSize.copyWith(fontSize: 14, height: 1.3),
              ),
            ),
            Text("Nutrition",
                style: AppStyles.mediumBlack
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  model.nutrition.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          model.nutrition[index],
                          style: AppStyles.smallBlack,
                        ),
                      )),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${model.price} Per/Kg",
                  style: AppStyles.mediumBlack.copyWith(fontSize: 19),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: DefaultButton(
                        iconLabel: "Buy Now",
                        buttonAction: () {},
                        width: homeWidth * .5)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
