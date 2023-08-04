import 'package:flutter/material.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';

class SignUpHeaderSection extends StatelessWidget {
  const SignUpHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: PaddingSize.padding60h,
        ),
        Text(
          AppStrings.signUp,
          style: Styles.textStyle30Extra,
        ),
        SizedBox(
          height: PaddingSize.padding12h,
        ),
        Text(
          AppStrings.addSignUpDetails,
          style: Styles.textStyle14Medium,
        ),
        SizedBox(
          height: PaddingSize.padding36h,
        ),
      ],
    );
  }
}
