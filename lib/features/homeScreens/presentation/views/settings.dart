import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/core/utils/views/AppColors.dart';
import 'package:fruit_market_app/core/utils/widgets/textField.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/data/homeBloc/homeBloc.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/data/homeBloc/home_states.dart';
import 'package:fruit_market_app/features/homeLayout/tabs/presentation/widgets/heightAppBar.dart';

import '../../../../core/utils/widgets/defaultButton.dart';
import '../widgets/account_appbar.dart';

class Settings extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeBloc, HomeStates>(builder: (context, state) {
      HomeBloc cubit = HomeBloc.get(context);
      emailController.text = cubit.user!.email;
      phoneController.text = cubit.user!.password;
      nameController.text = cubit.user!.name;
      return Scaffold(
        appBar: accountAppbar(model: cubit.user!, screenHeight: screenHeight,cubit: cubit),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              SizedBox(
                height: screenHeight * .1,
              ),
              buildTextFormField(
                  label: "Email",
                  controller: emailController,
                  inputType: TextInputType.emailAddress),
              buildTextFormField(
                  label: "Password",
                  controller: phoneController,
                  inputType: TextInputType.phone),
              buildTextFormField(
                  label: "name",
                  controller: nameController,
                  inputType: TextInputType.text),
              SizedBox(height: 10,),
              if(state is UpdateUserDataLoadingState)
                LinearProgressIndicator(color: AppColors.primaryColor,backgroundColor: AppColors.whiteColor,),
              SizedBox(height: 10,),
              DefaultButton(iconLabel: "Edit My Data", buttonAction: () {
                cubit.uploadAccountImage(email: emailController.text, password: phoneController.text, name: nameController.text);
              })
            ],
          ),
        ),
      );
    });
  }
}
