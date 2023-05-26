import 'package:cached_network_image/cached_network_image.dart';
import 'package:devices_app/core/functions/get_list_stars.dart';
import 'package:devices_app/modules/device/controller/device_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceControllerImp deviceController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Details: ${deviceController.deviceModel.title!}'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.star_border))
        ],
      ),
      body: Column(
        children: [
          CachedNetworkImage(
            width: double.infinity,
            imageUrl: deviceController.deviceModel.thumbnail!,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name -${deviceController.deviceModel.title!}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "OS -${deviceController.deviceModel.category}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Description -${deviceController.deviceModel.description!}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Brand -${deviceController.deviceModel.brand!}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Text(
                      "Review",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.0),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: getStarsList(deviceController.deviceModel.rating!.toDouble()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
