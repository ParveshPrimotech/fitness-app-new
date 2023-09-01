import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_app_new/controller/functionsController.dart';
import 'package:fitness_app_new/config/Colors.dart';
import 'package:fitness_app_new/config/images%20sources.dart';
import 'package:fitness_app_new/config/text.dart';
import '../../../helpers/string_methods.dart';
import 'componenets/ChooseLaungageBox.dart';

class ChooseLaungagePage extends StatelessWidget {
  ChooseLaungagePage({Key? key}) : super(key: key);
  final FunctionsController controller = Get.put(FunctionsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DelayedDisplay(
              delay: Duration(milliseconds: delay + 100),
              child: Center(
                child: Text(
                  capitalize(AppTexts.chooseLaungage),
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: delay + 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ChooseLaungageBox(
                    language: AppTexts.primaryLaungage,
                    languageImgPath: ImgSrc.primaryLaungage,
                  ),
                  ChooseLaungageBox(
                    language: AppTexts.secondaryLaungage,
                    languageImgPath: ImgSrc.secondaryLaungage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
