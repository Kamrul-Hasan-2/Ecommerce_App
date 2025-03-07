import 'package:ecomerce/features/auth/ui/controller/read_my_profile_controller.dart';
import 'package:ecomerce/services/network_caller/auth_controller.dart';
import 'package:ecomerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../../../app/urls.dart';

class VerifyOTPController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = false;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  String? _token;
  String? get token => _token;

  Future<bool> verifyOTP(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> body = {"email": email, "password": otp};

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.verifyOTPUrl, body: body);
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
      String token = response.responseData['data'];
      await Get.find<ReadMyProfileController>().readProfileData(token);
      if (Get.find<ReadMyProfileController>().profileModel == null) {
        _shouldNavigateCompleteProfile = true;
      } else {
        // Get.find<AuthController>().saveUserData(
        //
       //token, Get.find<ReadMyProfileController>().profileModel!);
        _shouldNavigateCompleteProfile = false;
      }
    } else {
      response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
