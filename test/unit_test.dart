import 'package:devices_app/core/class/http_clint.dart';
import 'package:devices_app/core/constant/linkapi.dart';
import 'package:devices_app/core/enum/statusrequest.dart';
import 'package:devices_app/core/functions/handlingdata.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;

void main(){
  HttpClint httpClint = HttpClint() ;
  flutter_test.test('fetch All Devices From Api', ()async{
    bool done = false ;
    final  response  = await httpClint.getData(AppLink.linkGetAllDevices);
    StatusRequest statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      done = true  ;
    }
    flutter_test.expect(done, true);
  });

  flutter_test.test('Search Device From Api', ()async{
    bool done = false ;
    final  response  = await httpClint.getData("${AppLink.linkSearchDevices}?q=a");
    StatusRequest statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      done = true  ;
    }
    flutter_test.expect(done, true);
  });
}