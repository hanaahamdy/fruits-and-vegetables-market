import 'package:flutter/material.dart';

import '../../../../core/utils/views/AppColors.dart';
import '../../../../core/utils/views/appStyles.dart';
import '../../../../core/utils/widgets/defaultButton.dart';
import 'Item_cart_count_button.dart';
import 'item_stars.dart';

Widget CartItem(double screenWidth, double screenHeight) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        child: Image(
          image: NetworkImage(
              "https://produits.bienmanger.com/36700-0w470h470_Organic_Red_Onion_From_Italy.jpg"),
          width: screenWidth * .3,
          height: screenHeight * .2,
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Graph",
                    style: AppStyles.mediumBlack,
                  ),
                  Text("160 per/kg"),
                ],
              ),
              stars(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CartItemCount(icon:  Icons.add,hero:"second"),
                  Text("1"),
                  CartItemCount(icon:  Icons.minimize_rounded,hero:"first"),
                  DefaultButton(
                      iconLabel: "Add",
                      buttonAction: () {},
                      width: 70,
                      color: AppColors.orange)
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}
