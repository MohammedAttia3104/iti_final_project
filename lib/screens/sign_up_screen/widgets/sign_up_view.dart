import 'package:flutter/material.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/screens/sign_up_screen/widgets/have_an_account.dart';
import 'package:iti_final_project/screens/sign_up_screen/widgets/sign_up_body_section.dart';
import 'package:iti_final_project/screens/sign_up_screen/widgets/sign_up_header_section.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PaddingSize.padding34h),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SignUpHeaderSection(),
                SignUpBodySection(),
                HaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
