import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';
import 'package:iti_final_project/models/category_model/category_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: PaddingSize.padding21width,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: PaddingSize.padding17h,
                ),
                Text(
                  AppStrings.category,
                  style: Styles.textStyle22Bold.copyWith(
                    color: kBlackColor,
                  ),
                ),
                SizedBox(
                  height: PaddingSize.padding17h,
                ),
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: categoryData[index].onPressed,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  categoryData[index].image,
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  27.0.r,
                                ),
                              ),
                            ),
                            height: 150.0.h,
                            width: 300.0.w,
                          ),
                          Center(
                            child: Text(
                              categoryData[index].title,
                              style: Styles.textStyle26Extra.copyWith(
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: PaddingSize.padding6h,
                    );
                  },
                  itemCount: categoryData.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
