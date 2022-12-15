import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/presentation/widgets/heightAppBar.dart';

import '../../../../core/utils/views/AppTexts.dart';
import '../../../homeLayout/tabs/presentation/views/fruitPageView.dart';
import '../../../homeLayout/tabs/presentation/views/vegetables.dart';
import '../../../homeLayout/tabs/presentation/widgets/BUILD_TAPBAR.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHeightAppBar(
        title: AppTexts.splashText,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            buildTabBar(),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [
                    FruitPage(),
                    VegetablePage(),
                    VegetablePage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
