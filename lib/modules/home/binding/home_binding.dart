import 'package:devices_app/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeControllerImp>(
          () => HomeControllerImp(),
    );

  }
}
