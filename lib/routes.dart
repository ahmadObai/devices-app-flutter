import 'package:devices_app/core/constant/routes.dart';
import 'package:devices_app/modules/device/binding/device_binding.dart';
import 'package:devices_app/modules/device/view/device_page.dart';
import 'package:devices_app/modules/home/binding/home_binding.dart';
import 'package:devices_app/modules/home/view/home_page.dart';
import 'package:devices_app/modules/search/binding/search_binding.dart';
import 'package:devices_app/modules/search/view/search_page.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoutes.homePage, page: () => const HomePage() , binding: HomeBinding(),),
  GetPage(name: AppRoutes.devicePage, page: () => const DevicePage() , binding: DeviceBinding()),
  GetPage(name: AppRoutes.searchPage, page: () => const SearchPage() , binding: SearchBinding()),
];

