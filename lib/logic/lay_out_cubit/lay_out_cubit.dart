import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/screens/add_screen/add_screen.dart';
import 'package:iti_final_project/screens/category_screen/category_screen.dart';
import 'package:iti_final_project/screens/home_screen/home_screen.dart';
import 'package:iti_final_project/screens/info_screen/info_screen.dart';
import 'package:iti_final_project/screens/profile_screen/profile_screen.dart';
import 'package:iti_final_project/screens/profile_screen/widgets/profile_view.dart';

import '../../core/utils/constants.dart';

part 'lay_out_state.dart';

class LayOutCubit extends Cubit<LayOutState> {
  LayOutCubit() : super(LayOutInitial());

  static LayOutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = const [
    HomeScreen(),
    CategoryScreen(),
    AddProductsScreen(),
    ProfileScreen(),
    InfoScreen(),
  ];

  void changeBottomNavBar(index) {
    currentIndex = index;
    emit(LayOutChangeBottomNavState());
  }
}
