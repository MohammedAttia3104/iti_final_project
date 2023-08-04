import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';
import 'package:iti_final_project/screens/info_screen/widgets/about_app_section.dart';
import 'package:iti_final_project/screens/info_screen/widgets/about_us_section.dart';
import 'package:iti_final_project/widgets/row_bar_with_icons.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingSize.padding21width,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RowBarWithIcons(
                text: AppStrings.infoScreen,
                suffixIsSelected: true,
              ),
              SizedBox(
                height: PaddingSize.padding12h,
              ),
              Text(
                AppStrings.aboutUs,
                style: Styles.textStyle22Bold,
              ),
              SizedBox(
                height: PaddingSize.padding12h,
              ),
              const AboutUsSection(),
              SizedBox(
                height: PaddingSize.padding20h,
              ),
              Text(
                AppStrings.aboutOurApp,
                style: Styles.textStyle22Bold,
              ),
              SizedBox(
                height: PaddingSize.padding12h,
              ),
              const AboutAppSection(),
            ],
          ),
        ),
      ),
    );
  }
}
