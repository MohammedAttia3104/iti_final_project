import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/widgets/show_flutter_toast.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginCubit get(context) => BlocProvider.of(context);

  void userLoginWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      emit(LoginLoadingState());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) {
        debugPrint(value.user?.email);
        emit(LoginSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState());
      if (e.code == 'user-not-found') {
        showFlutterToast(
            text: 'No user found for that email', state: ToastState.error);
      } else if (e.code == 'wrong-password') {
        showFlutterToast(
            text: 'Wrong password provided for that user',
            state: ToastState.error);
      } else {
        debugPrint(e.toString());
      }
    }
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(LoginChangePasswordState());
  }
}
