import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:iti_final_project/screens/lay_out_screen/lay_out_screen.dart';
import 'package:iti_final_project/screens/sign_up_screen/widgets/sign_up_view.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('signUp Build');
    return Scaffold(
      body: BlocConsumer<SignUpCubit, SignUpState>(listener: (context, state) {
        print('signUp Listener State');
        if (state is CreateUserSuccessState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LayOutScreen(),
              ),
              (route) => false);
        }
      }, builder: (context, state) {
        print('signUp builder State');
        if (state is SignUpLoadingState) {
          const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
        }
        if (state is SignUpSuccessState) {
          return const SignUpView();
        }
        return const SignUpView();
      }),
    );
  }
}
