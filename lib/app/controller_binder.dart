import 'package:ecomerce/features/auth/ui/controller/sign_in_controller.dart';
import 'package:ecomerce/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecomerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put( MainBottomNavController());
    Get.put( NetworkCaller());
    Get.put( SignInController());
  }
}
