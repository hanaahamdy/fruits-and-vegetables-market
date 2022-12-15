import 'package:flutter/material.dart';
import '../../../../../core/utils/views/appStyles.dart';
import '../../../../../core/utils/views/AppColors.dart';

AppBar buildHeightAppBar(
    {required String title,
    IconData? icon,
    IconData? leadIcon,
    TextStyle titleStyle = AppStyles.largeBlack}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: leadIcon == null
        ? null
        : IconButton(
            onPressed: () {},
            icon: Icon(leadIcon),
          ),
    elevation: 0,
    title: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        title,
        style: titleStyle.copyWith(color: Colors.white),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(30),
      child: SizedBox(
        height: 10,
      ),
    ),
    backgroundColor: AppColors.primaryColor,
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 20, right: 10),
        child: icon != null ? Icon(Icons.notifications) : null,
      )
    ],
  );
}
