import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/views/AppTexts.dart';
import 'package:fruit_market_app/features/login/data/login_states/login_states.dart';
import 'package:fruit_market_app/features/signUp/data/user_model/user_model.dart';

class LoginBloc extends Cubit<LoginStates> {
  LoginBloc() : super(LoginInitState());

  static LoginBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }


  void loginUser({required String email, required String password}) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginSuccessState(value.user!.uid));

      print(value.user?.uid);
    }).catchError((onError) {
      print(onError.toString());
      emit(LoginErrorState(onError.toString()));
    });
  }

}
