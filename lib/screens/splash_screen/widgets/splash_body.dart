import 'package:flutter/material.dart';
import 'package:iti_final_project/core/utils/app_assets.dart';
import 'package:iti_final_project/screens/splash_screen/widgets/splash_content.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage(
              AppAssets.splashScreenBackground,
            ),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SplashContent(),
        ],
      ),
    );
  }
}
