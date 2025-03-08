import 'package:ecomerce/services/network_caller/auth_controller.dart';
import 'package:ecomerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../../../app/urls.dart';
import '../../data/models/sign_in_model.dart';

class VerifyOTPController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> verifyOTP(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> body = {"email": email, "otp": otp};

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.verifyOTPUrl, body: body);
    if (response.isSuccess) {
      AuthSuccessModel authSuccessModel = AuthSuccessModel.fromJson(response.responseData);
      Get.find<AuthController>().saveUserData(
        authSuccessModel.data!.token!,
        authSuccessModel.data!.user!,
      );
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
