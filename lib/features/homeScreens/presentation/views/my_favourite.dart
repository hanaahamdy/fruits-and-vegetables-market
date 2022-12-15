import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/presentation/widgets/heightAppBar.dart';
import 'package:fruit_market_app/features/homeScreens/presentation/widgets/cart_Item.dart';
class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) {
            return SizedBox(
              child: Divider(
                thickness: 1,
              ),
            );
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: screenHeight * .18,
                child: CartItem(screenWidth, screenHeight),
              ),
            );
          }),
      appBar: buildHeightAppBar(title: "Favourites"),
    );
  }
}
