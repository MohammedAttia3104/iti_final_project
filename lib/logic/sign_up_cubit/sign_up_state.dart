part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpChangePasswordState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {}

class CreateUserSuccessState extends SignUpState {}

class CreateUserErrorState extends SignUpState {
  final String error;

  CreateUserErrorState(this.error);
}
