import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_app_new/controller/functionsController.dart';
import 'package:fitness_app_new/config/Colors.dart';
import 'package:fitness_app_new/config/text.dart';

import '../../../../controller/authControllers/signOutController.dart';
import '../../../../helpers/string_methods.dart';

class ProfileAppBar extends StatelessWidget {
  ProfileAppBar({
    Key? key,
  }) : super(key: key);
  FunctionsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        capitalize(AppTexts.profile),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      toolbarHeight: 80,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        GetBuilder<SignOutController>(
            init: SignOutController(),
            builder: (signOutController) {
              return ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.darkBlue, elevation: 0),
                label: Text(
                  capitalize(AppTexts.logOut),
                  style: const TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  signOutController.signOut();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              );
            }),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
