import 'package:devices_app/components/coustom_text_formfiled.dart';
import 'package:devices_app/core/class/handlingdataview.dart';
import 'package:devices_app/core/constant/strings.dart';
import 'package:devices_app/modules/home/widgets/device_list_item.dart';
import 'package:devices_app/modules/search/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchControllerImp> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    SearchControllerImp searchController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.search),
      ),
      body:  Column(
        children: [
          CustomTextFormFiled(
            controller: controller.textSearchController,
            hintText: 'Type to search devices ...',
            labelText: 'Search',
            prefixIcon: Icons.search,
            onChange: (String text) async {
              await controller.searchDevice();
            },
          ),
          GetBuilder<SearchControllerImp>(
            builder: (controller) {
              return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget:Expanded(
                    child: ListView.builder(
                      itemCount: controller.searchDevices.length,
                      itemBuilder: ((context, index) {
                        return DeviceListItem(
                            deviceModel: controller.searchDevices[index]);
                      }),
                    ),
                  ),
              );
            },
          )
        ],
      ),
    );
  }
}
