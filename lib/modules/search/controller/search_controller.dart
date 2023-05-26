import 'package:devices_app/core/enum/statusrequest.dart';
import 'package:devices_app/core/functions/handlingdata.dart';
import 'package:devices_app/data/datasource/remote/search_data.dart';
import 'package:devices_app/data/model/device_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SearchController extends GetxController{
  Future<void> searchDevice();
}

class SearchControllerImp extends SearchController{
  TextEditingController textSearchController  = TextEditingController() ;
  StatusRequest statusRequest = StatusRequest.none;
  SearchData searchData = SearchData(Get.find()) ;
  List<DeviceModel> searchDevices = [];


  @override
  void onInit() async{
    super.onInit();
  }


  @override
  Future<void> searchDevice() async{
    if(textSearchController.text.isNotEmpty){
      statusRequest = StatusRequest.loading ;
      update();
      var response = await searchData.searchOfDevice(textSearchController.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        searchDevices = response['products'].map<DeviceModel>((obj) => DeviceModel.fromJson(obj)).toList();
      }else{
        statusRequest = statusRequest;
      }
      update();
    }else{
      searchDevices.clear() ;
      update();
    }
  }


}