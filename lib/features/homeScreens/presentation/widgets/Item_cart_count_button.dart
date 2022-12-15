import 'package:flutter/material.dart';

import '../../../../core/utils/views/AppColors.dart';

FloatingActionButton CartItemCount({required IconData icon ,required Object hero}) {
  return FloatingActionButton(heroTag: hero,
    foregroundColor: Colors.black,
    mini: true,
    backgroundColor: Colors.white,
    child: Center(
      child: Icon(
          icon
      ),
    ),
    onPressed: () {},
    shape: RoundedRectangleBorder(
        side: BorderSide(
            color: AppColors.blackColor),
        borderRadius: BorderRadius.circular(9)),
  );
}