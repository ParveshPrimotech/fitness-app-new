import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_app_new/controller/functionsController.dart';

import '../../../../config/text.dart';
import '../../../../helpers/string_methods.dart';

class FindYourWorkout extends GetView<FunctionsController> {
  const FindYourWorkout({Key? key,}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: capitalize(AppTexts.getFit),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize:30,
        ),
        children: [
          // const TextSpan(text: " "),
          TextSpan(
            text: " ${capitalize(AppTexts.feelGreat)}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
