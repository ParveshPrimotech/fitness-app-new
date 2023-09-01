import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_app_new/controller/functionsController.dart';

import '../../../helpers/string_methods.dart';

class CustomButton extends StatelessWidget {

  final VoidCallback onPressed;
  String text;
  bool isOutlined = false;
  bool isRounded = true;

  CustomButton({
    Key? key,
    required this.text,
    required this.isOutlined,
    this.isRounded = true,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FunctionsController>(
        init: FunctionsController(),
        builder: (controller) {
          return Transform.scale(
            scale: 1 * btnScaleValue,
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      color: isOutlined ? Colors.white : Colors.red,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(isRounded ? 30 : 10),
                    ),
                    primary: isOutlined ? Colors.transparent : Colors.red,
                    onPrimary: Colors.red),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
