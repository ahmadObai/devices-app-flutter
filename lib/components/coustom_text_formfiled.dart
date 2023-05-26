import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  final String hintText;
  final ValueChanged<String> onChange  ;
  final IconData prefixIcon;

  const CustomTextFormFiled(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.hintText,
      required this.onChange,
      required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 14, left: 20, right: 20),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                color: Get.theme.focusColor.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 5)),
          ],
          border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${labelText}',
            style: Get.textTheme.bodyText1,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            onChanged: onChange,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(prefixIcon),
              hintStyle: Get.textTheme.caption,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding: EdgeInsets.all(0),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}
