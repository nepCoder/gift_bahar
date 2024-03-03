import 'package:get/get.dart';
import 'package:gift_bahar/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final LoginService _loginService = LoginService();
  RxBool isLoading = false.obs;

  @override
  onInit() async {
    super.onInit();
  }

  login(params) async {
    isLoading(true);
    final response = await _loginService.loginUser(params);
    final sharedPreferences = await SharedPreferences.getInstance();
    if (response != null) {
      await sharedPreferences.setString('tokenType', response['tokenType']);
      await sharedPreferences.setString('accessToken', response['accessToken']);
      await sharedPreferences.setBool('authenticated', true);

      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Error', 'Inavalid email or password.');
    }
    isLoading(false);
  }

  logout() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('accessToken');
    await sharedPreferences.remove('authenticated');
    Get.offAllNamed('/login');
  }

  Future<bool> checkAuthentication() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('authenticated') ?? false;
  }
}
