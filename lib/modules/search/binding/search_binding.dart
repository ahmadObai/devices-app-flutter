import 'package:devices_app/modules/home/controller/home_controller.dart';
import 'package:devices_app/modules/search/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchControllerImp>(
          () => SearchControllerImp(),
    );

  }
}
