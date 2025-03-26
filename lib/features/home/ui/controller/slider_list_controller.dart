import 'package:ecomerce/app/urls.dart';
import 'package:ecomerce/features/home/data/slider_pagination_response.dart';
import 'package:ecomerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../data/slider_model.dart';

class SliderListController extends GetxController{
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  SliderPaginationResponse? _sliderPaginationResponse;

  List<SliderModel> get bannerList => _sliderPaginationResponse?.data?.results ?? [];

  Future<bool> getSlider () async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await  Get.find<NetworkCaller>().getRequest(Urls.homeSlidersUrl);

    if(response.isSuccess){
      _sliderPaginationResponse = SliderPaginationResponse.fromJson(response.responseData);
      isSuccess = true;
    }else{
      _errorMessage =response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}