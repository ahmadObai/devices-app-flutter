import 'package:cached_network_image/cached_network_image.dart';
import 'package:devices_app/core/constant/color.dart';
import 'package:devices_app/core/constant/routes.dart';
import 'package:devices_app/data/model/device_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceListItem extends StatelessWidget {
  final DeviceModel deviceModel;

  const DeviceListItem({super.key, required this.deviceModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryColor.withOpacity(.2)),
            borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          onTap: (){
            Get.toNamed(AppRoutes.devicePage,
                arguments: {'deviceModel': deviceModel});
          },
          title: Text(
            deviceModel.title!,
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(deviceModel.category!),
          leading: CachedNetworkImage(
            width: 60.0,
            height: 60.0,
            imageUrl: deviceModel.images![0],
            fit: BoxFit.contain,
          ),
          trailing: IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.devicePage,
                    arguments: {'deviceModel': deviceModel});
              },
              icon: const Icon(
                Icons.info,
                color: Colors.black,
                size: 30.0,
              )),
        ),
      ),
    );
  }
}
