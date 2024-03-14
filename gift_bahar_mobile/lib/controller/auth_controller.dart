import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_bahar/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  RxBool isLoading = false.obs;

  login(params) async {
    isLoading(true);
    final response = await _authService.loginUser(params);
    final sharedPreferences = await SharedPreferences.getInstance();
    if (response != null) {
      await sharedPreferences.setString('authHeaders', jsonEncode(response));
      await sharedPreferences.setBool('authenticated', true);
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Error', 'Inavalid email or password.', colorText: Colors.amberAccent ,borderColor: Colors.white, snackPosition: SnackPosition.BOTTOM);
    }
    isLoading(false);
  }

  logout() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final headerParam = sharedPreferences.getString('authHeaders');
    bool isSuccess = false;
    if (headerParam != null) {
      var param = jsonDecode(headerParam);
      Map<String, String> mappedParam = Map<String, String>.from(param
          .map((key, value) => MapEntry(key.toString(), value.toString())));
      isSuccess = await _authService.signOutUser(mappedParam);
    }

    if (isSuccess) {
      await sharedPreferences.remove('authHeaders');
      await sharedPreferences.remove('authenticated');
      Get.snackbar('Success', 'SignOut Successful');
      Get.offAllNamed('/login');
    } else {
      Get.snackbar('Error', 'SignOut Failed!');
    }
  }

  Future<bool> checkAuthentication() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('authenticated') ?? false;
  }
}
