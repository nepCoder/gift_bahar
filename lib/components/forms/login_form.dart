import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  Future<void> loginUser() async {
    const String apiUrl = 'http://10.0.2.2:5062/login';

    final Map<String, dynamic> data = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    const storage = FlutterSecureStorage();

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if(responseData != null){
          await storage.write(key: 'tokenType', value: responseData['tokenType']);
          await storage.write(key: 'accessToken', value: responseData['accessToken']);
          await storage.write(key: 'authenticated', value: 'true');
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email or password.', style: TextStyle(color: Colors.red), textAlign: TextAlign.center,),
          backgroundColor: Colors.white,
          closeIconColor: Colors.red,
        ),
      );
      }
    } catch (e) {
      print(e);
    }
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
                    loginUser();
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
                          Navigator.pushNamed(context, '/signup');
                        }),
                ],
              ))
            ],
          ),
        ));
  }
}
