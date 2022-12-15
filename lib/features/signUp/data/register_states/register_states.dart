import '../user_model/user_model.dart';

abstract class RegisterStates{}
class RegisterInitState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  final String error;

  RegisterErrorState(this.error);

}
class RegisterLoadingState extends RegisterStates{}
class CreateUserSuccessState extends RegisterStates{
  final UserModel userModel;

  CreateUserSuccessState(this.userModel);

}
class CreateUserErrorState extends RegisterStates{
  final String error;

  CreateUserErrorState(this.error);

}
class CreateUserLoadingState extends RegisterStates{}