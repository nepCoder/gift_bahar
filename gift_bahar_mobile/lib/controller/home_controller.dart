import 'dart:convert';

import 'package:get/get.dart';
import 'package:gift_bahar/services/gift_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final GiftService _giftService = GiftService();
  RxBool isLoading = false.obs;
  RxList<dynamic> giftList = RxList<dynamic>();

  @override
  onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    isLoading(true);
    final sharedPreferences = await SharedPreferences.getInstance();
    final headerParam = sharedPreferences.getString('authHeaders');

    if (headerParam != null) {
      var param = jsonDecode(headerParam);
      Map<String, String> mappedParam = Map<String, String>.from(param
          .map((key, value) => MapEntry(key.toString(), value.toString())));
      List<dynamic> gifts = await _giftService.fetchAllGifts(mappedParam);

      giftList.value = gifts;
      isLoading(false);
    }
    isLoading(false);
  }
}
