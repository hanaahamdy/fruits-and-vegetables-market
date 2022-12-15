import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/core/cach_helper/shrad_Prefrecce.dart';
import '../../../../core/utils/views/AppColors.dart';
import '../../../../core/utils/views/AppTexts.dart';
import '../../../../core/utils/widgets/Conditional_Button.dart';
import '../../../../core/utils/views/appStyles.dart';
import '../../../../core/utils/views/images_routes.dart';
import 'package:fruit_market_app/features/login/data/login_bloc/login_bloc.dart';
import 'package:fruit_market_app/features/login/data/login_states/login_states.dart';

import '../../../../core/utils/widgets/defaultButton.dart';
import '../../../../core/utils/widgets/textField.dart';
import '../widgets/login_quistion.dart';
import '../widgets/social_button_widgets.dart';

class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            LocalHelper.saveData(key: "userId", value: state.uId);
            //AppTexts.userId=state.uId;
            Navigator.pushNamedAndRemoveUntil(
                context, "Home Layout", (route) => false);
          }
        },
        builder: (context, state) {
          LoginBloc cubit = LoginBloc.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(22),
              child: Form(
                key: formKey,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Image(
                      image: AssetImage(AppImages.login_logo),
                    ),
                    Text(
                      AppTexts.splashText,
                      style: AppStyles.veryLargeStyleSize,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: screenHeight * .08,
                    ),
                    buildTextFormField(
                        inputType: TextInputType.emailAddress,
                        controller: emailController,
                        label: 'Email',
                        hintText: "Enter your Email....",
                        prefix: Icons.email_outlined),
                    buildTextFormField(
                        inputType: TextInputType.visiblePassword,
                        controller: passwordController,
                        label: 'Password',
                        hintText: "Enter your password....",
                        prefix: Icons.lock,
                        suffix: Icons.visibility_off),
                    SizedBox(
                      height: screenHeight * .02,
                    ),
                    buildConditionalButton(
                        state: state is! LoginLoadingState,
                        trueConditionReturn: DefaultButton(
                            iconLabel: "Login",
                            buttonAction: () {
                              cubit.loginUser(
                                  email: emailController.text,
                                  password: passwordController.text);
                            })),
                    login_register_question(context,
                        question: "Don't have an account?",
                        option: "Create one",
                        pageName: "Register"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildSocialLoginButton(
                            buttonLogo: AppImages.googleImage),
                        buildSocialLoginButton(
                            buttonLogo: AppImages.facebookImage),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
