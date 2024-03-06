import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:gift_bahar/controller/login_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void logoutUser(BuildContext context) {
    const storage = FlutterSecureStorage();
    storage.deleteAll();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'You are logged out successfully.',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.orange,
      ),
    );
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          title: Text(widget.title),
          leading: const Icon(
            Icons.menu,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Welcome to Gift Bahar!'),
              ElevatedButton(
                  onPressed: () {
                    Get.find<AuthController>().logout();
                  },
                  child: const Text('LOGOUT')),
            ],
          ),
        ),
      ),
    );
  }
}
