import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/features/login/data/login_states/login_states.dart';
import 'package:fruit_market_app/features/signUp/data/user_model/user_model.dart';

import '../register_states/register_states.dart';

class RegisterBloc extends Cubit<RegisterStates> {
  RegisterBloc() : super(RegisterInitState());

 static RegisterBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  void registerUser(
      {required String name, required String email, required String password}) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUser(uId: value.user!.uid,
          names: name, emails: email, passwords: password,);
      print(value.user?.uid);
    }).catchError((onError){print(onError.toString());
    emit(RegisterErrorState(onError.toString()));});
  }

  void createUser(
      {required String names,
      required String emails,
      required String passwords,
        required String uId
      }) {
    emit(CreateUserLoadingState());
    UserModel userModel = UserModel(uId: uId,image: "https://img.freepik.com/premium-vector/front-portraits-young-men-character-avatars-illustration-graphic-design-animation_635702-210.jpg?w=740",
      name: names, email: emails, password: passwords, );
    FirebaseFirestore.instance
        .collection("users").doc(uId).set(userModel.toJson())
        .then((value) {
      emit(CreateUserSuccessState(userModel));
    }).catchError((onError) {
      emit(CreateUserErrorState(onError.toString()));
    });
  }
}
