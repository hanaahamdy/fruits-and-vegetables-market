import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/presentation/widgets/heightAppBar.dart';
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildHeightAppBar(title: "Cart"));
  }
}
