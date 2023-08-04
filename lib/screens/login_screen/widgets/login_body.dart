import 'package:flutter/material.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';
import 'package:iti_final_project/screens/login_screen/widgets/upper_login_section.dart';
import 'do_not_have_an_account_login_section.dart';
import 'or_login_with_section.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PaddingSize.padding34h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: PaddingSize.padding60h,
                ),
                const UpperLoginSection(),
                SizedBox(
                  height: PaddingSize.padding24h,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.forgetPassword,
                    style: Styles.textStyle14Medium,
                  ),
                ),
                SizedBox(
                  height: PaddingSize.padding49h,
                ),
                const OrLoginWithSection(),
                SizedBox(
                  height: PaddingSize.padding60h,
                ),
                const DoNotHaveAnAccountLoginSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
