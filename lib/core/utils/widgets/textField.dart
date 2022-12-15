
import 'package:flutter/material.dart';
import '../views/AppColors.dart';
import '../views/appStyles.dart';

Widget buildTextFormField(
    {
      var onSubmmited,
      required TextEditingController? controller,
      required String? label,
      IconData? prefix,
      Color borderColor = AppColors.gryColor,
      IconData? suffix,
      VoidCallback? suffixAction,
      String? hintText,
      bool security = false,
      String?error="field can't be null",
      required TextInputType inputType
      , Color suffixIconColor=AppColors.gryColor}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(keyboardType: inputType,
      obscureText: security,
      onFieldSubmitted: onSubmmited,
      style: TextStyle(color: Colors.grey),
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return error;
        }
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: hintText != null ? hintText : null,
          hintStyle: TextStyle(color: AppColors.gryColor,fontSize: 13),
          label: Text("$label",style: AppStyles.textFieldLabelStyle),
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: suffixAction,
            icon: Icon(
              suffix,
              color: suffixIconColor,
            ),
          )
              : null,
          labelStyle:AppStyles.textFieldLabelStyle,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),enabled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(
              10,),
          ),
          prefixIcon: prefix != null
              ? Icon(
            prefix,
            color:AppColors.gryColor,
          )
              : null),
    ),
  );
}