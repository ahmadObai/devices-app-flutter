import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:devices_app/core/enum/statusrequest.dart';
import 'package:devices_app/core/functions/checkinternet.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HttpClint {

    Future<Either<StatusRequest, Map>> getData(String linkeUrl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkeUrl));
        Get.log(response.statusCode.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.internetFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }

}
