import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/models/category_model/category_model.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        categoryData.length,
        (index) => Image.asset(
          categoryImages[index],
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      // [
      //   Image.asset(
      //     AppAssets.shopCartImage,
      //     width: double.infinity,
      //     fit: BoxFit.cover,
      //   ),
      //   Image.asset(
      //     AppAssets.onBoardingImageOne,
      //     fit: BoxFit.cover,
      //     width: double.infinity,
      //   ),
      //   Image.asset(
      //     AppAssets.onBoardingImageTwo,
      //     fit: BoxFit.cover,
      //     width: double.infinity,
      //   ),
      //   Image.asset(
      //     AppAssets.onBoardingImageThree,
      //     fit: BoxFit.cover,
      //     width: double.infinity,
      //   ),
      // ],
      options: CarouselOptions(
        height: 150.0.h,
        autoPlay: true,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(
          seconds: 3,
        ),
        autoPlayAnimationDuration: const Duration(
          seconds: 1,
        ),
        autoPlayCurve: Curves.fastOutSlowIn,
        initialPage: 0,
        reverse: false,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1.0,
      ),
    );
  }
}
