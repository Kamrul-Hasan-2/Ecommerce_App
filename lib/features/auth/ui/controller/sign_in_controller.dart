import 'package:ecomerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../../../app/urls.dart';

class SignInController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> body = {
        "email":email,
        "password": password
    };

    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(Urls.verifyEmailUrl, body: body);
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
