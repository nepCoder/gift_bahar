import 'dart:convert';
import 'package:gift_bahar/core/const/constants.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<dynamic> loginUser(params) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(params),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if(responseData != null){
          return responseData;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }  
}