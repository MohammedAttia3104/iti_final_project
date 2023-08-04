import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';

class AboutAppSection extends StatelessWidget {
  const AboutAppSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25.0.r)),
        border: Border.all(
          color: kPrimaryColor,
          width: 2.0.w,
        ),
      ),
      height: 200.0.h,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: PaddingSize.padding15width,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.aboutAppTitle,
                style: Styles.textStyle16Bold,
              ),
              SizedBox(
                height: PaddingSize.padding6h,
              ),
              Text(
                AppStrings.aboutAppSubTitle,
                style: Styles.textStyle12Regular,
              ),
              SizedBox(
                height: PaddingSize.padding6h,
              ),
              Text(
                AppStrings.aboutAppDescription,
                style: Styles.textStyle12Regular.copyWith(
                  color: kSecondaryFontColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
