import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_bahar/components/forms/login_form.dart';
import 'package:gift_bahar/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFFFFBA00);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Obx(
           () {
            return Stack(
              children: [
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.card_giftcard,
                        size: 64.0,
                        color: accentColor,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'Login to GiftBahar',
                        style: TextStyle(
                            color: accentColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0,),
                      LoginForm(),
                    ],
                  ),
                ),
                Get.find<AuthController>().isLoading.value ? Center(child: CircularProgressIndicator(),) : SizedBox()
              ],
            );
          }
        ),
      ),
    );
  }
}
