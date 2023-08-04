import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iti_final_project/screens/lay_out_screen/lay_out_screen.dart';
import 'package:iti_final_project/screens/onboarding_screen/onboarding_screen.dart';
import 'widgets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    late bool isLogin;
    final loggedUser = FirebaseAuth.instance.currentUser;
    if (loggedUser == null) {
      isLogin = false;
    } else {
      isLogin = true;
    }
    Timer(
      const Duration(seconds: 3),
      () {
        isLogin == true
            ? Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LayOutScreen(),
                ),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnBoardingScreen(),
                ),
              );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
