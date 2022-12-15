abstract class HomeStates{}
class HomeInitialState extends HomeStates{}
class GetFruitLoadingState extends HomeStates{
}
class NavigationBarState extends HomeStates{}
class GetImageLoadingState extends HomeStates{
}
class GetImageSuccessState  extends HomeStates{}
class GetImageErrorState  extends HomeStates{}
class GetFruitSuccessState  extends HomeStates{}
class GetFruitErrorState  extends HomeStates{}
class GetMixedFruitLoadingState extends HomeStates{}
class GetMixedFruitSuccessState  extends HomeStates{}
class GetUserDataLoadingState extends HomeStates{}
class GetUserDataSuccessState extends HomeStates{

}
class GetUserDataErrorState extends HomeStates{
  final String error;

  GetUserDataErrorState(this.error);

}
class GetMixedFruitErrorState  extends HomeStates{
  final String error;

  GetMixedFruitErrorState(this.error);
}
class GetStoneFruitLoadingState extends HomeStates{}
class GetStoneFruitSuccessState  extends HomeStates{}
class GetStoneFruitErrorState  extends HomeStates{
  final String error;

  GetStoneFruitErrorState(this.error);
}
class GetVegetablesLoadingState extends HomeStates{}
class GetVegetablesSuccessState  extends HomeStates{}
class GetVegetablesErrorState  extends HomeStates{
  final String error;

  GetVegetablesErrorState(this.error);
}

class GetMixedVegetablesLoadingState extends HomeStates{}
class GetMixedVegetablesSuccessState  extends HomeStates{}
class GetMixedVegetablesErrorState  extends HomeStates{
  final String error;

  GetMixedVegetablesErrorState(this.error);
}
class GetAlliumVegetablesLoadingState extends HomeStates{}
class GetAlliumVegetablesSuccessState  extends HomeStates{}
class GetAlliumVegetablesErrorState  extends HomeStates{
  final String error;

  GetAlliumVegetablesErrorState(this.error);
}
class UploadProfileImageSuccessState  extends HomeStates{}
class UploadProfileImageErrorState  extends HomeStates{}
class UpdateUserDataSuccessState  extends HomeStates{}
class UpdateUserDataErrorState  extends HomeStates{}
class UpdateUserDataLoadingState  extends HomeStates{}
class SignOutLoadingState  extends HomeStates{}
class SignOutSuccessState  extends HomeStates{}
class SignOutErrorState  extends HomeStates{}
class SetItemLikeSuccessState  extends HomeStates{}
class SetItemLikeErrorState  extends HomeStates{}