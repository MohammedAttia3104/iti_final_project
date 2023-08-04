import 'package:flutter/material.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/styles.dart';
import 'package:iti_final_project/screens/login_screen/login_screen.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: Text(
            AppStrings.login,
            style: Styles.textStyle14Medium.copyWith(
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
