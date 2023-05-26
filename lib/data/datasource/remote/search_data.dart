
import 'package:devices_app/core/class/http_clint.dart';
import 'package:devices_app/core/constant/linkapi.dart';

class SearchData{
  HttpClint httpClint ;
  SearchData(this.httpClint);

  searchOfDevice(String text)async{
    var response  = await httpClint.getData("${AppLink.linkSearchDevices}?q=$text");
    return response.fold((left) => left, (right) => right);
  }

}