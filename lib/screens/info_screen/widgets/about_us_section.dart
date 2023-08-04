import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    size: 30.0.sp,
                  ),
                  SizedBox(
                    width: PaddingSize.padding15width,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.aboutName,
                        style: Styles.textStyle16Bold,
                      ),
                      Text(
                        AppStrings.aboutNameDescrip,
                        style: Styles.textStyle12Regular,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: PaddingSize.padding10h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 30.0.sp,
                  ),
                  SizedBox(
                    width: PaddingSize.padding15width,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.aboutAddress,
                        style: Styles.textStyle16Bold,
                      ),
                      Text(
                        AppStrings.aboutAddressDescrip,
                        style: Styles.textStyle12Regular,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: PaddingSize.padding10h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.mobile_friendly,
                    size: 30.0.sp,
                  ),
                  SizedBox(
                    width: PaddingSize.padding15width,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.aboutMobileNumber,
                        style: Styles.textStyle16Bold,
                      ),
                      Text(
                        AppStrings.aboutPhoneNumberDescrip,
                        style: Styles.textStyle12Regular,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: PaddingSize.padding10h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.facebook,
                    size: 30.0.sp,
                  ),
                  SizedBox(
                    width: PaddingSize.padding15width,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.aboutContactMe,
                        style: Styles.textStyle16Bold,
                      ),
                      Text(
                        AppStrings.aboutContactMeDescrip,
                        style: Styles.textStyle12Regular,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: PaddingSize.padding10h),
            ],
          ),
        ],
      ),
    );
  }
}
