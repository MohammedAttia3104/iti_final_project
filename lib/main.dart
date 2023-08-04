import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/utils/constants.dart';
import 'package:iti_final_project/logic/lay_out_cubit/lay_out_cubit.dart';
import 'package:iti_final_project/logic/login_cubit/login_cubit.dart';
import 'package:iti_final_project/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:iti_final_project/screens/splash_screen/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginCubit(),
        ),
        BlocProvider(
          create: (_) => SignUpCubit(),
        ),
        BlocProvider(
          create: (_) => LayOutCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, snapshot) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
