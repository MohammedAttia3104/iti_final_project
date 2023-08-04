import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimationProgress extends StatelessWidget {
  const LoadingAnimationProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.discreteCircle(
      size: 50.0.sp,
      color: kPrimaryColor,
      secondRingColor: kWhiteColor,
      thirdRingColor: kBlackColor,
    );
  }
}
