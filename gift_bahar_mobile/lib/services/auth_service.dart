import 'dart:convert';
import 'package:gift_bahar/core/const/constants.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<dynamic> loginUser(params) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(baseUrl+signInPath),
        body: jsonEncode(params),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {

        return {
          "access-token": response.headers["access-token"],
          "token-type": response.headers["token-type"],
          "client": response.headers["client"],
          "uid": response.headers["uid"],
          "authorization": response.headers["authorization"]
        };
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }  


Future<bool> signOutUser(headerParam) async {
    try {
      final http.Response response = await http.delete(
        Uri.parse(baseUrl+signOutPath),
        headers: headerParam,
      );
      
      if (response.statusCode == 200) {
        return true ;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }  

}