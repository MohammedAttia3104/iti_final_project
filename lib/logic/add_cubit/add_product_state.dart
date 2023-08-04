part of 'add_product_cubit.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoadingState extends AddProductState {}

class AddProductSuccesState extends AddProductState {}

class AddProductErrorState extends AddProductState {}

class AddProductImageSavedState extends AddProductState {}

class AddedProductToCategoryState extends AddProductState {}
