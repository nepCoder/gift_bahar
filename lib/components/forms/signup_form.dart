import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 16.0),
        child: Column(
          children: [
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Full Name',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              onTap: () async {
                var picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000, 6, 15),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                }
              },
              showCursor: false,
              readOnly: true,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Date of Birth',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Email',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              obscureText: true,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              obscureText: true,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('SUBMIT'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text.rich(TextSpan(
              style: const TextStyle(fontSize: 16.0),
              children: [
                const TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: 'Login.',
                    style: const TextStyle(
                        color: Colors.yellow,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(context);
                      }),
              ],
            ))
          ],
        ));
  }
}
