import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/presentation/widgets/heightAppBar.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the1500s, when an unknown printer took a galley oftype and scrambled it to make a type specimenbook. It has survived not only five centuries, butalso the leap into electronic typesetting, remainingessentially unchanged. It was popularised in the1960s with the release of Letraset sheets containingLorem Ipsum passages, and more recently with desktop publishing software like Aldus Page Maker including versions of Lorem Ipsum.  \n   \n"
               *2),
              )
            ],
          ),
        ),
        appBar: buildHeightAppBar(title: "Help"));
  }
}
