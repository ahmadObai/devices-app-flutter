import 'package:devices_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomRefreshWaterDropHeader extends StatelessWidget {
  final String completeText ;

  const CustomRefreshWaterDropHeader({super.key, required this.completeText});

  @override
  Widget build(BuildContext context) {
    return WaterDropHeader(
                    complete: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Icon(Icons.check , color: Colors.grey,),
                          const SizedBox(width: 10.0,),
                          Text(completeText),
                        ],
                      ),
                    ),
                    waterDropColor: AppColor.primaryColor,
                  );
  }
}