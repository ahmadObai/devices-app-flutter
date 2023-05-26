import 'package:devices_app/core/constant/strings.dart';
import 'package:devices_app/modules/home/widgets/drawer_link_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerLinkWidget(
            icon: Icons.menu,
            text: AppStrings.devices,
            onTap:  null,
            isTitle: true,
          ),
          DrawerLinkWidget(
            icon: Icons.home,
            text: AppStrings.home,
            onTap: (){
              Get.back();
            },
          ),
          DrawerLinkWidget(
            icon: Icons.phone_android_outlined,
            text: AppStrings.myDevice,
            onTap: (){
              Get.back();
            },
          ),
          DrawerLinkWidget(
            icon: Icons.settings,
            text: AppStrings.settings,
            onTap: (){
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
