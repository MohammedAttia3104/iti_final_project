import 'package:flutter/material.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:iti_final_project/widgets/Custom_Text_Form_Field.dart';
import 'package:iti_final_project/widgets/custom_rounded_button.dart';

class SignUpBodySection extends StatefulWidget {
  const SignUpBodySection({super.key});

  @override
  State<SignUpBodySection> createState() => _SignUpBodySectionState();
}

class _SignUpBodySectionState extends State<SignUpBodySection> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final firstNameFocusNode = FocusNode();
  final lastNameController = TextEditingController();
  final lastNameFocusNode = FocusNode();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final mobileNoController = TextEditingController();
  final mobileNoFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    emailController.dispose();
    mobileNoController.dispose();
    passwordController.dispose();
    lastNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: AppStrings.firstName,
            controller: firstNameController,
            validate: (value) {
              if (value!.isEmpty) {
                return '* name is required';
              } else if (value.length < 3) {
                return '* name must be at least 3 digits';
              }
              return null;
            },
            textOnChanged: (val) => debugPrint(val),
            keyboardType: TextInputType.name,
            focusNode: firstNameFocusNode,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(lastNameFocusNode),
          ),
          SizedBox(
            height: PaddingSize.padding28h,
          ),
          CustomTextFormField(
            hintText: AppStrings.lastName,
            controller: lastNameController,
            validate: (value) {
              if (value!.isEmpty) {
                return '* name is required';
              } else if (value.length < 3) {
                return '* name must be at least 3 digits';
              }
              return null;
            },
            textOnChanged: (val) => debugPrint(val),
            keyboardType: TextInputType.name,
            focusNode: lastNameFocusNode,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(emailFocusNode),
          ),
          SizedBox(
            height: PaddingSize.padding28h,
          ),
          CustomTextFormField(
            hintText: AppStrings.emailAddress,
            controller: emailController,
            validate: (value) {
              if (value!.isEmpty) {
                return '* Email is required';
              } else if (!value.endsWith("@gmail.com")) {
                return '* Email must be end with @gmail.com';
              } else if (value.length < 13) {
                return '* Email must be at least 13 digits';
              }
              return null;
            },
            textOnChanged: (val) => debugPrint(val),
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(mobileNoFocusNode),
          ),
          SizedBox(
            height: PaddingSize.padding28h,
          ),
          CustomTextFormField(
            hintText: AppStrings.mobileNo,
            controller: mobileNoController,
            validate: (value) {
              if (value!.isEmpty) {
                return '* phone is required';
              } else if (value.length != 11) {
                return '* phone must be at least 11 digits';
              } else if (!value.startsWith("01")) {
                return '* phone must be start with 01';
              }
              return null;
            },
            textOnChanged: (val) => debugPrint(val),
            keyboardType: TextInputType.streetAddress,
            focusNode: mobileNoFocusNode,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(passwordFocusNode),
          ),
          SizedBox(
            height: PaddingSize.padding28h,
          ),
          CustomTextFormField(
            hintText: AppStrings.password,
            controller: passwordController,
            validate: (value) {
              if (value!.isEmpty) {
                return '* Password is required';
              } else if (value.length < 7) {
                return '* Password must be at least 7 char';
              }
              return null;
            },
            textOnChanged: (val) => debugPrint(val),
            keyboardType: TextInputType.visiblePassword,
            focusNode: passwordFocusNode,
            isObsecured: true,
            textAction: TextInputAction.next,
          ),
          SizedBox(
            height: PaddingSize.padding28h,
          ),
          CustomRoundedButton(
            buttonText: AppStrings.signUp,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                SignUpCubit().get(context).userRegister(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      emailAddress: emailController.text,
                      phoneNumber: mobileNoController.text,
                      password: passwordController.text,
                    );
              }
            },
            heroTag: AppStrings.signUpBottomTag,
          ),
          SizedBox(
            height: PaddingSize.padding42h,
          ),
        ],
      ),
    );
  }
}
