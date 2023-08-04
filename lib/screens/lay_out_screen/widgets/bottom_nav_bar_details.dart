// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iti_final_project/core/utils/app_colors.dart';
// import 'package:iti_final_project/logic/lay_out_cubit/lay_out_cubit.dart';
//
// class BottomNavBarDetails extends StatelessWidget {
//   const BottomNavBarDetails({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = LayOutCubit.get(context);
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         elevation: 0,
//         currentIndex: cubit.currentIndex,
//         unselectedItemColor: kSecondaryFontColor,
//         selectedItemColor: kPrimaryColor,
//         onTap: (index) {
//           cubit.changeBottomNavBar(index);
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: 'Home',
//           ),
//         ],
//       ),
//     );
//   }
// }
