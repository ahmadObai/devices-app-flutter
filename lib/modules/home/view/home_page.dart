import 'package:devices_app/components/customrefresh.dart';
import 'package:devices_app/core/class/handlingdataview.dart';
import 'package:devices_app/core/constant/routes.dart';
import 'package:devices_app/core/constant/strings.dart';
import 'package:devices_app/modules/home/controller/home_controller.dart';
import 'package:devices_app/modules/home/widgets/custom_drawer.dart';
import 'package:devices_app/modules/home/widgets/device_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends GetView<HomeControllerImp> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.devices),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.searchPage);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return  HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: SmartRefresher(
                physics: const BouncingScrollPhysics(),
                header: CustomRefreshWaterDropHeader(
                    completeText: "Refresher Complate".tr),
                footer: const ClassicFooter(),
                enablePullUp: true,
                enablePullDown: true,
                controller: controller.refreshController,
                onRefresh: () async {
                  final result = await controller.getDevices(isRefresh: true);
                  if (result == true) {
                    controller.refreshController.refreshCompleted();
                  } else {
                    controller.refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  final result = await controller.getDevices(isRefresh: false);
                  if (result == true) {
                    if (controller.currentPage > controller.totalPages) {
                      controller.refreshController.loadNoData();
                    } else {
                      controller.refreshController.loadComplete();
                    }
                  } else {
                    controller.refreshController.loadFailed();
                  }
                },
                child:  ListView.builder(
                  itemCount: controller.devices.length,
                  itemBuilder: ((context, index) {
                    return DeviceListItem(deviceModel: controller.devices[index]);
                  }),
                ),
              ),
          );
        },
      ),
    );
  }
}
