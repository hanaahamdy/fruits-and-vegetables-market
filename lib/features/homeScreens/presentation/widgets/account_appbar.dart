

import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/data/homeBloc/homeBloc.dart';
import '../../../../core/utils/views/AppColors.dart';
import '../../../../core/utils/views/images_routes.dart';
import 'package:fruit_market_app/features/signUp/data/user_model/user_model.dart';

import '../../../../core/utils/views/appStyles.dart';

AppBar accountAppbar(
    {required double screenHeight,
    required UserModel model,
      IconData? camera,
    required HomeBloc cubit}) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.primaryColor,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(screenHeight * .2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: cubit.galleryImage == null
                    ? NetworkImage("${model.image}")
                    : FileImage(cubit.galleryImage!) as ImageProvider,
              ),
             Positioned(
                  child: IconButton(
                      onPressed: () {
                        cubit.pickGalleryImage();
                      },
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 30,
                        color: AppColors.whiteColor,
                      )))
            ],
          ),
          Text(
            model.name,
            style: AppStyles.largeStyleSize,
          ),
          Text(
            model.email,
            style: AppStyles.fruitTitle.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    ),
  );
}
