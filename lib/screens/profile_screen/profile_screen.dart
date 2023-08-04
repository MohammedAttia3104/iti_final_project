import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iti_final_project/core/utils/constants.dart';
import 'package:iti_final_project/screens/profile_screen/widgets/profile_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileBody(userId: uId.toString()),
    );
  }
}
