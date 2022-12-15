import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/presentation/widgets/heightAppBar.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHeightAppBar(title: "order"),
    );
  }
}
