import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/logic/lay_out_cubit/lay_out_cubit.dart';

class LayOutScreen extends StatelessWidget {
  const LayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayOutCubit.get(context);
    print('Layout Screen Build');
    return BlocConsumer<LayOutCubit, LayOutState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        print('Layout Screen Builder state');
        return Scaffold(
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: cubit.currentIndex,
            unselectedItemColor: kSecondaryFontColor,
            selectedItemColor: kPrimaryColor,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.houseCircleCheck),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_rounded,
                ),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.circlePlus),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.userPen),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.info),
                label: 'Info',
              ),
            ],
          ),
        );
      },
    );
  }
}
