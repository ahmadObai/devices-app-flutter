import 'package:devices_app/core/enum/statusrequest.dart';
import 'package:devices_app/core/functions/handlingdata.dart';
import 'package:devices_app/data/datasource/remote/home_data.dart';
import 'package:devices_app/data/model/device_model.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class HomeController extends GetxController{
  Future<bool> getDevices();
}

class HomeControllerImp extends HomeController{
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  List<DeviceModel> devices = [];
  //pagination variables
  int currentPage = 0;
  late RefreshController refreshController;
  late int totalPages;

  @override
  void onInit() async{
    refreshController = RefreshController(initialRefresh: false) ;
    getDevices(isRefresh: true);
    super.onInit();
  }


  @override
  Future<bool> getDevices({bool isRefresh = false}) async{
    if (isRefresh) {
      statusRequest = StatusRequest.loading ;
      update();
      refreshController.resetNoData();
      currentPage = 0;
      update();
    } else {
      if (currentPage > totalPages) {
        refreshController.loadNoData();
      }
    }
    var response = await homeData.getAllDevices(currentPage);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {

      if (isRefresh) {
        devices = response['products'].map<DeviceModel>((obj) => DeviceModel.fromJson(obj)).toList();
      } else {
        devices.addAll(response['products'].map<DeviceModel>((obj) => DeviceModel.fromJson(obj)).toList());
      }
      currentPage = currentPage + 1;
      totalPages = response["total"];
      update();
      return true;
    }else{
      statusRequest = statusRequest;
      update();
      return false;
    }
  }

}