import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/logic/login_cubit/login_cubit.dart';
import 'package:iti_final_project/screens/lay_out_screen/lay_out_screen.dart';
import 'package:iti_final_project/screens/login_screen/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          print('Login Listener State');
          if (state is LoginSuccessState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LayOutScreen()),
                (route) => false);
          }
        },
        builder: (context, state) {
          print('Login builder State');
          if (state is LoginLoadingState) {
            const Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            );
          }
          if (state is LoginSuccessState) {
            return const LoginBody();
          }
          return const LoginBody();
        },
      ),
    );
  }
}
