import 'dart:convert';

import 'package:gift_bahar/core/const/constants.dart';
import 'package:http/http.dart' as http;

class GiftService {
  Future<dynamic> fetchAllGifts(headerParams) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(baseUrl+fetchAllGiftsPath),
        headers: headerParams,
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  } 
}