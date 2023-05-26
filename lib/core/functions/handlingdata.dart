import 'package:devices_app/core/enum/statusrequest.dart';

handlingData(response){
  if(response is StatusRequest){
    return response ;
  }else{
    return StatusRequest.success ;
  }
}