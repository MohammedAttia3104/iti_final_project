import 'package:flutter/material.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/styles.dart';
import 'package:iti_final_project/screens/sign_up_screen/sign_up_screen.dart';

class DoNotHaveAnAccountLoginSection extends StatelessWidget {
  const DoNotHaveAnAccountLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.already,
          style: Styles.textStyle14Medium,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ),
            );
          },
          child: Text(
            AppStrings.signUp,
            style: Styles.textStyle14Medium.copyWith(
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
