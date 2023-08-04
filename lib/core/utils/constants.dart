import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Duration animatiedContainterSliderDuration = const Duration(milliseconds: 500);
Duration onBoardingPageTransition = const Duration(milliseconds: 200);
final navigatorKey = GlobalKey<NavigatorState>();

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final uId = user?.uid;