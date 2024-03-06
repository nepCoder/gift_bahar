import 'package:flutter/material.dart';
import 'package:gift_bahar/components/forms/signup_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFFFFBA00);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: const Center(
          child: SingleChildScrollView(
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
                  'Signup to GiftBahar',
                  style: TextStyle(
                      color: accentColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SignupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
