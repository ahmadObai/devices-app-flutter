
import 'package:devices_app/core/class/http_clint.dart';
import 'package:devices_app/core/constant/linkapi.dart';

class HomeData{
  HttpClint httpClint ;
  HomeData(this.httpClint);

  getAllDevices(int page)async{
    var response  = await httpClint.getData("${AppLink.linkGetAllDevices}?limit=8&skip=$page");
    return response.fold((left) => left, (right) => right);
  }

}