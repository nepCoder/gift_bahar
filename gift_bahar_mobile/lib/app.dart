import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_bahar/controller/auth_controller.dart';
import 'package:gift_bahar/core/const/constants.dart';
import 'package:gift_bahar/views/home.dart';
import 'package:gift_bahar/views/login.dart';
import 'package:gift_bahar/views/signup.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   final controller = Get.put(AuthController());

    return FutureBuilder(
        future: controller.checkAuthentication(),
        builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            final authenticated = snapshot.data as bool;
            return GetMaterialApp(
              initialRoute: authenticated ? '/home' : '/login',
              defaultTransition: Transition.circularReveal,
              transitionDuration: const Duration(seconds: 5),
              routes: {
                '/login': (context) => const LoginScreen(),
                '/signup': (context) => const SignupScreen(),
                '/home': (context) => const HomeScreen(title: appName ),
              },
              title: 'Gift Bahar',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xFFCA1F3D),
                  secondary: const Color(0xFF0D0D0D),
                ),
                useMaterial3: true,
              ),
            );
          }
        });
  }
}
