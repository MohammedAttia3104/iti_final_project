part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileChangeImageState extends ProfileState {}

class ProfileSetImageState extends ProfileState {}
