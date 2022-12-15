import 'package:flutter/material.dart';

import '../../../../core/utils/views/AppColors.dart';

Widget buildPageIndicator(int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
        3,
        (dotindex) => Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                  decoration: BoxDecoration(
                      color: index == dotindex
                          ? AppColors.primaryColor
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8)),
                  width: 12,
                  height: 10),
            )),
  );
}
