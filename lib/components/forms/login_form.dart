import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:gift_bahar/controller/login_controller.dart';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  Future<void> loginUser() async {
  
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Invalid email or password.',
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        closeIconColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  errorStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter email.";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  errorStyle: const TextStyle(color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter password.";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    final param = {
                      'email': emailController.text,
                      'password': passwordController.text,
                    };
                    controller.login(param);
                  }
                },
                child: const Text('LOGIN'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text.rich(TextSpan(
                style: const TextStyle(fontSize: 16.0),
                children: [
                  const TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: 'Signup.',
                      style: const TextStyle(
                          color: Colors.yellow,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed('/signup');
                        }),
                ],
              ))
            ],
          ),
        ));
  }
}
