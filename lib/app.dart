import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gift_bahar/views/home.dart';
import 'package:gift_bahar/views/login.dart';
import 'package:gift_bahar/views/signup.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const storage = FlutterSecureStorage();
    return FutureBuilder(
        future: storage.read(key: 'authenticated'),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            final authenticated = snapshot.data;
            return MaterialApp(
              initialRoute: authenticated == 'true' ? '/home' : '/login',
              routes: {
                '/login': (context) => const LoginScreen(),
                '/signup': (context) => const SignupScreen(),
                '/home': (context) => const HomeScreen(title: 'Home'),
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