import 'package:flutter/material.dart';

import '../../../../../core/utils/views/AppColors.dart';


TabBar buildTabBar() {
  return TabBar(
    labelColor: AppColors.whiteColor,
    unselectedLabelColor: AppColors.gryColor,
    padding: EdgeInsets.only(top: 20, bottom: 30,),
    indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color:AppColors.orange,
        shape: BoxShape.rectangle),
    tabs: [
      Tab(
          text: "Fruits" ,
      ),
      Tab(
       text: "Vegetables"
      ),
      Tab(
        text: "Dry fruits",
      )
    ],
  );
}