import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';
import 'package:iti_final_project/widgets/custom_rounded_button_with_icon.dart';

class OrLoginWithSection extends StatelessWidget {
  const OrLoginWithSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.orLoginWith,
          style: Styles.textStyle14Medium,
        ),
        SizedBox(
          height: PaddingSize.padding28h,
        ),
        CustomRoundedButtonWithIcon(
          labelText: AppStrings.loginWithFacebook,
          backgroundColor: kBlueColor,
          prefixIcon: FontAwesomeIcons.facebookF,
          onPressed: () {},
          tag: AppStrings.facebookTag,
        ),
        SizedBox(
          height: PaddingSize.padding28h,
        ),
        CustomRoundedButtonWithIcon(
          labelText: AppStrings.loginWithGoogle,
          backgroundColor: kRedColor,
          prefixIcon: FontAwesomeIcons.googlePlusG,
          onPressed: () {},
          tag: AppStrings.googleTag,
        ),
      ],
    );
  }
}
