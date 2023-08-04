import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';
import 'package:iti_final_project/logic/login_cubit/login_cubit.dart';
import 'package:iti_final_project/widgets/Custom_Text_Form_Field.dart';
import 'package:iti_final_project/widgets/custom_rounded_button.dart';

class UpperLoginSection extends StatefulWidget {
  const UpperLoginSection({super.key});

  @override
  State<UpperLoginSection> createState() => _UpperLoginSectionState();
}

class _UpperLoginSectionState extends State<UpperLoginSection> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          Text(
            AppStrings.login,
            style: Styles.textStyle30Extra,
          ),
          SizedBox(
            height: PaddingSize.padding12h,
          ),
          Text(
            AppStrings.addLoginDetails,
            style: Styles.textStyle14Medium,
          ),
          SizedBox(
            height: PaddingSize.padding36h,
          ),
          CustomTextFormField(
            hintText: AppStrings.yourEmail,
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
            textOnChanged: (p0) => debugPrint(p0),
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(passwordFocusNode),
            textAction: TextInputAction.next,
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
            textOnChanged: (p0) => debugPrint(p0),
            keyboardType: TextInputType.visiblePassword,
            focusNode: passwordFocusNode,
            textAction: TextInputAction.done,
            isObsecured: true,
          ),
          SizedBox(
            height: PaddingSize.padding28h,
          ),
          CustomRoundedButton(
            heroTag: AppStrings.loginBottomTag,
            buttonText: AppStrings.login,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<LoginCubit>(context)
                    .userLoginWithEmailAndPassword(
                  emailAddress: emailController.text,
                  password: passwordController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
