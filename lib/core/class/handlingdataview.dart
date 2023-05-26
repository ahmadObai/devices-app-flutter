import 'package:flutter/material.dart';
import '../enum/statusrequest.dart';


class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (statusRequest == StatusRequest.internetFailure) {
      return const  Center(
        child: Text('No Internet...please check your connection'),
      );
    } else if (statusRequest == StatusRequest.serverFailure) {
      return const Center(
        child: Text('Server Error')
      );
    } else {
      return widget;
    }
  }
}
