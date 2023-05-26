import 'package:devices_app/data/model/device_model.dart';
import 'package:get/get.dart';

abstract class DeviceController extends GetxController{

}

class DeviceControllerImp extends DeviceController{
late DeviceModel deviceModel ;

@override
  void onInit() {
  deviceModel  =   Get.arguments['deviceModel'] ;
    super.onInit();
  }
}