import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerLinkWidget extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final GestureTapCallback? onTap;
  final bool isTitle;

  const DrawerLinkWidget(
      {Key? key, this.icon, this.text, this.onTap, this.isTitle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: isTitle == false
                  ? Get.theme.focusColor.withOpacity(1)
                  : Colors.grey,
            ),
            isTitle == false ?
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: 1,
                height: 24,
                color: Get.theme.focusColor.withOpacity(0.2),
              ) : const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Text(text!,
                  style: Get.textTheme.bodyText2?.merge(TextStyle(
                      fontSize: 16,
                      color: isTitle == false
                          ? Get.theme.focusColor.withOpacity(1)
                          : Colors.grey))),
            ),
          ],
        ),
      ),
    );
  }
}
