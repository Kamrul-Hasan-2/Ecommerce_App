import 'package:ecomerce/features/auth/data/models/profile_model.dart';
import 'package:ecomerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../../../app/urls.dart';

class ReadMyProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ProfileModel? _profileModel;
  ProfileModel? get profileModel=> _profileModel;

  Future<bool> readProfileData(String token) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.readMyProfileUrl, accessToken: token);
    if (response.isSuccess) {
      _errorMessage = null;
      if(response.responseData['data'] == null){
        _profileModel = null;
      }else{
        _profileModel = ProfileModel.fromJson(response.responseData['data']);
      }
      isSuccess = true;
    } else {
      response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
