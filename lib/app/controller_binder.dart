import 'package:ecomerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(const MainBottomNavScreen());
  }
}
