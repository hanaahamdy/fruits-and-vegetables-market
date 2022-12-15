import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/Conditional_Button.dart';
import '../../../../core/utils/views/images_routes.dart';
import 'package:fruit_market_app/features/login/presentation/widgets/login_quistion.dart';
import 'package:fruit_market_app/features/signUp/data/register_bloc/register_bloc.dart';
import 'package:fruit_market_app/features/signUp/data/register_states/register_states.dart';

import '../../../../core/utils/views/AppTexts.dart';
import '../../../../core/utils/views/appStyles.dart';
import '../../../../core/utils/widgets/defaultButton.dart';
import '../../../../core/utils/widgets/textField.dart';

class Register extends StatelessWidget {
  GlobalKey formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: BlocConsumer<RegisterBloc, RegisterStates>(
        listener: (context, state) {
          if (state is CreateUserSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, "Login", (route) => false);
          }
        },
        builder: (context, state) {
          RegisterBloc cubit = RegisterBloc.get(context);
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
                    height: screenHeight * .02,
                  ),
                  buildTextFormField(inputType: TextInputType.text,
                      controller: nameController,
                      label: 'Name',
                      hintText: "Enter your Name....",
                      prefix: Icons.person),
                  buildTextFormField(inputType: TextInputType.emailAddress,
                      controller: emailController,
                      label: 'Email',
                      hintText: "Enter your Email....",
                      prefix: Icons.email_outlined),
                  buildTextFormField(inputType: TextInputType.visiblePassword,
                      controller: passwordController,
                      label: 'Password',
                      hintText: "Enter your password....",
                      prefix: Icons.lock,
                      suffix: Icons.visibility_off),
                  SizedBox(
                    height: screenHeight * .02,
                  ),
                  buildConditionalButton(
                    state: state is! CreateUserLoadingState,
                    trueConditionReturn: DefaultButton(
                        iconLabel: "Sign up",
                        buttonAction: () {
                          cubit.registerUser(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }),
                  ),
                  login_register_question(context,
                      question: "Do You Have an account?",
                      option: "Login",
                      pageName: "Login")
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
