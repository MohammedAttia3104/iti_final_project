import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/utils/app_assets.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: PaddingSize.padding34h,
        ),
        SizedBox(
          height: 105.h,
          width: 103.w,
          child: const Image(
            image: AssetImage(
              AppAssets.splashImage,
            ),
          ),
        ),
        SizedBox(
          height: PaddingSize.padding14h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.wave,
              style: Styles.textStyle30Extra.copyWith(
                color: kPrimaryColor,
              ),
            ),
            Text(
              AppStrings.shop,
              style: Styles.textStyle30Extra,
            ),
          ],
        ),
        SizedBox(
          height: PaddingSize.padding6h,
        ),
        Text(
          AppStrings.simplyShopping,
          style: Styles.textStyle10Regular.copyWith(
            letterSpacing: 1.3,
            /// todo : Refactor
          ),
        ),
      ],
    );
  }
}
