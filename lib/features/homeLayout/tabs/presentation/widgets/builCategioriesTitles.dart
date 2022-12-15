import 'package:flutter/material.dart';

import '../../../../../core/utils/views/appStyles.dart';



Padding CategoryTitles({required String firstTitle, required String offer,required String detailTitle}) {
  return Padding(
    padding: const EdgeInsets.only( bottom: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              firstTitle,
              style: AppStyles.mediumBlack,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              offer,
              style: AppStyles.verySmall,
            )
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          detailTitle,
          style: AppStyles.smallBlack,
        ),
      ],
    ),
  );
}
