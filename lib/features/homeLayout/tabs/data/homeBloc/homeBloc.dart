import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/core/cach_helper/shrad_Prefrecce.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../homeScreens/presentation/views/MyCart.dart';

import '../../../../homeScreens/presentation/views/home_page.dart';
import '../../../../homeScreens/presentation/views/my_favourite.dart';
import '../../../../homeScreens/presentation/views/account_page.dart';
import '../../../../../core/utils/views/AppTexts.dart';
import '../../../../signUp/data/user_model/user_model.dart';
import '../Fruit_model/fruit_model.dart';
import 'home_states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class HomeBloc extends Cubit<HomeStates> {
  HomeBloc() : super(HomeInitialState());

  static HomeBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<Widget> screens = [
    HomePage(),
    FavouriteScreen(),
    CartScreen(),
    MyAccount()
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: "Shopping Cart"),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline), label: "My Favourite"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Account")
  ];
  int current_index = 0;

  void changeNav(int index) {
    current_index = index;
    emit(NavigationBarState());
  }

////////////////////////////////////////////Organic Fruit///////////////////////
  List<FruitModel> fruitList = [];
  List<String> fruitsId = [];

  void getOrganicFruit() {
    emit(GetFruitLoadingState());
    FirebaseFirestore.instance.collection("fruits").get().then((value) {
      value.docs.forEach((element) {
        fruitsId.add(element.id);
        fruitList.add(FruitModel.fromJson(element));

        emit(GetFruitSuccessState());
      });
      //list=fruitList;
    }).catchError((onError) {
      print(onError.toString());
      emit(GetFruitErrorState());
    });
  }

///////////////////////////////////////////Stone Fruit////////////////////////////
  List<FruitModel> stoneFruit = [];
  List<String> stoneId = [];

  void getStoneFruit() {
    emit(GetStoneFruitLoadingState());
    FirebaseFirestore.instance.collection("stone fruits").get().then((value) {
      value.docs.forEach((element) {
        stoneId.add(element.id);
        stoneFruit.add(FruitModel.fromJson(element));
        emit(GetStoneFruitSuccessState());
      });

      print(stoneFruit.length);
    }).catchError((onError) {
      print(onError.toString());
      emit(GetStoneFruitErrorState(onError.toString()));
    });
  }

//////////////////////////////////////////Mixed Fruit///////////////////////

  List<FruitModel> mixedFruit = [];
  List<String> mixedFruitId = [];

  void getMixedFruit() {
    emit(GetMixedFruitLoadingState());
    FirebaseFirestore.instance.collection("mixed fruit").get().then((value) {
      value.docs.forEach((element) {
        mixedFruitId.add(element.id);
        mixedFruit.add(FruitModel.fromJson(element));
        emit(GetMixedFruitSuccessState());
      });

      print(mixedFruit.length);
    }).catchError((onError) {
      print(onError.toString());
      emit(GetMixedFruitErrorState(onError.toString()));
    });
  }

  ////////////////////////////// Vegetables////////////////////////////////////////
  List<FruitModel> vegetables = [];
  List<String> vegetablesId = [];

  void getVegetables() {
    emit(GetVegetablesLoadingState());
    FirebaseFirestore.instance.collection("vegetables").get().then((value) {
      value.docs.forEach((element) {
        vegetablesId.add(element.id);
        vegetables.add(FruitModel.fromJson(element));
        emit(GetVegetablesSuccessState());
      });
    }).catchError((onError) {
      print(onError.toString());
      emit(GetVegetablesErrorState(onError.toString()));
    });
  }

////////////////////////////////Mixed Vegetables/////////////////////////////////
  List<FruitModel> mixed_Vegetables = [];
  List<String> mixed_vegetables_id = [];

  void mixedVegetables() {
    emit(GetVegetablesLoadingState());
    FirebaseFirestore.instance
        .collection("mixed vegetables")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        mixed_vegetables_id.add(element.id);
        mixed_Vegetables.add(FruitModel.fromJson(element));
        emit(GetVegetablesSuccessState());
      });
    }).catchError((onError) {
      print(onError.toString());
      emit(GetVegetablesErrorState(onError.toString()));
    });
  }

///////////////////////////////Allium Vegetables/////////////////////////////////
  List<FruitModel> allium_Vegetables = [];
  List<String> mixed_allium_id = [];

  void alliumVegetables() {
    emit(GetAlliumVegetablesLoadingState());
    FirebaseFirestore.instance
        .collection("alluim vegetables")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        mixed_allium_id.add(element.id);
        allium_Vegetables.add(FruitModel.fromJson(element));
        emit(GetAlliumVegetablesSuccessState());
      });
    }).catchError((onError) {
      print(onError.toString());
      emit(GetAlliumVegetablesErrorState(onError.toString()));
    });
  }

  UserModel? user;

  void getUserdata() {
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .get()
        .then((value) {
      user = UserModel.fromJson(value.data()!);
      emit(GetUserDataSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetUserDataErrorState(onError.toString()));
    });
  }

//////////////////////////////////picked Image//////////////////////////////////
  File? galleryImage;
  ImagePicker? picker = ImagePicker();

  Future<void> pickGalleryImage() async {
    emit(GetImageLoadingState());
    final pickedImage = await picker?.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      galleryImage = File(pickedImage.path);
      emit(GetImageSuccessState());
    } else {
      print("no Image select");
      emit(GetImageErrorState());
    }
  }

///////////////////////////////////upload account Image///////////////////////

  void uploadAccountImage(
      {required String email, required var password, required String name}) {
    emit(UpdateUserDataLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child("users/${Uri.file(galleryImage!.path).pathSegments.last}")
        .putFile(galleryImage!)
        .then((value) => {
              value.ref.getDownloadURL().then((value) {
                updateUserData(
                    email: email, password: password, name: name, image: value);
//                emit(UploadProfileImageSuccessState());
              })
            })
        .catchError((onError) {
      emit(UploadProfileImageSuccessState());
    });
  }

  void updateUserData(
      {required String email,
      required var password,
      required String name,
      String? image}) {
    UserModel userModel = UserModel(
        image: image ?? user?.image,
        name: name,
        email: email,
        password: password,
        uId: user!.uId);
    FirebaseFirestore.instance
        .collection("users")
        .doc(userId!)
        .update(userModel.toJson())
        .then((value) {
      getUserdata();
    }).catchError((onError) {
      emit(UpdateUserDataErrorState());
    });
  }

  void signOut(context) {
    emit(SignOutLoadingState());
    FirebaseAuth.instance.signOut().then((value) async {
      await LocalHelper.removeDate(key: "userId");
      //await FirebaseMessaging.instance.deleteToken();
      await FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) async {
          if (element.id == user!.uId)
            element.reference.update({'token': null});
        });
      });
      Navigator.pushNamedAndRemoveUntil(context, "Login", (route) => false);
      emit(SignOutSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SignOutErrorState());
    });
  }

  ////////////////////////////////////like///////////////////
  void favouritesItem(itemId) {
    FirebaseFirestore.instance
        .collection("fruits")
        .doc(itemId)
        .collection("likes")
        .doc(user?.uId)
        .set({"like": true})
        .then((value) {
          emit(SetItemLikeSuccessState());
    })
        .catchError((onError) {
      emit(SetItemLikeErrorState());
    });
  }
}
