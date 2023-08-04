import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/constants.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';
import 'package:iti_final_project/models/onboarding_data_model/onboarding_data_model.dart';
import 'package:iti_final_project/screens/login_screen/login_screen.dart';
import 'package:iti_final_project/widgets/custom_rounded_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController? pageController = PageController();

  int currentPage = 0;

  AnimatedContainer sliderDots({int? index}) {
    return AnimatedContainer(
      duration: animatiedContainterSliderDuration,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: currentPage == index ? kPrimaryColor : kBehindFontColor,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PaddingSize.padding21width),
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            itemCount: onBoardingDataContent.length,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  SizedBox(
                    height: 370.0.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.0.h,
                        ),
                        Image(
                          height: 305.0.h,
                          width: 240.0.w,
                          image: AssetImage(
                            onBoardingDataContent[index]
                                .onBoardingImagePath
                                .toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onBoardingDataContent.length,
                      (index) => sliderDots(
                        index: index,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: PaddingSize.padding32h,
                  ),
                  Text(
                    onBoardingDataContent[index].onBoardingTitle.toString(),
                    style: Styles.textStyle28Extra,
                  ),
                  SizedBox(
                    height: PaddingSize.padding32h,
                  ),
                  Text(
                    onBoardingDataContent[index]
                        .onBoardingDescription
                        .toString(),
                    style: Styles.textStyle13Meduim,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: PaddingSize.padding40h,
                  ),
                  currentPage + 1 == onBoardingDataContent.length
                      ? CustomRoundedButton(
                          buttonText: AppStrings.onBoardingButtonText,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          heroTag: AppStrings.onBoardingBottomTag,
                        )
                      : CustomRoundedButton(
                          buttonText: AppStrings.onBoardingButtonText,
                          onPressed: () {
                            pageController?.nextPage(
                              duration: onBoardingPageTransition,
                              curve: Curves.easeIn,
                            );
                          },
                          heroTag: AppStrings.onBoardingBottomTag,
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
