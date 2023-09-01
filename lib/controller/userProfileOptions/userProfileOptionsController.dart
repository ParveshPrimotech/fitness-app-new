import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_app_new/config/Colors.dart';
import 'package:fitness_app_new/controller/functionsController.dart';
import 'package:fitness_app_new/view/widgets/general_widgets/edit_profile_dialogs.dart';

import '../../helpers/string_methods.dart';
import '../functionsController/dialogsAndLoadingController.dart';
import '../userController/userController.dart';

class UserProfileOptionsController extends GetxController {
  FunctionsController controller = Get.put(FunctionsController());
  UserInformationController userInformationController = Get.put(
    UserInformationController(),
  );
  DialogsAndLoadingController dialogsAndLoadingController =
      Get.put(DialogsAndLoadingController());
  TextEditingController newUserNameController = TextEditingController();
  TextEditingController newEmailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  late List userProfileOptionsList = [
    {
      "optionTitle": "change username",
      "optionIcon": Icons.person,
      "optionFunction": () {
        Get.dialog(
          AlertDialog(
            backgroundColor: AppColors.dialogBg,
            actions: [
              EditProfileDialog(
                  controller: newUserNameController,
                  title: 'Change username',
                  onTap: (){
                    Get.back();
                    userInformationController
                        .updateUsername(newUserNameController.text.trim());
                  },
                  hintTextField: "New username")
            ],
          ),
        );
      }
    },
    {
      "optionTitle": "change profile photo",
      "optionIcon": Icons.image,
      "optionFunction": () {

        Get.dialog(
            AlertDialog(
              backgroundColor: AppColors.dialogBg,
              actions: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: AppColors.dialogBg,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        capitalize("Select an image"),
                        style: const TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await userInformationController.updateProfile(
                                  await userInformationController
                                      .getImgFromDevice());
                            },
                            child: const Icon(
                              Icons.perm_media,
                              size: 55,
                              color: Colors.red,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await userInformationController.updateProfile(
                                  await userInformationController
                                      .getImgFromCamera());
                            },
                            child: const Icon(
                              Icons.camera_alt,
                              size: 55,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ));
      },
    },
    {
      "optionTitle": "set a new email address",
      "optionIcon": Icons.mail,
      "optionFunction": () {
        Get.dialog(
          AlertDialog(
            backgroundColor: AppColors.dialogBg,

            actions: [
              EditProfileDialog(
                title: 'Set new email address',
              controller: newUserNameController,
              onTap: (){
                Get.back();
                userInformationController
                    .updateEmail(newEmailController.text.trim());
              },
              hintTextField: "New email")
            ],
          ),
        );
      }
    },
    {
      "optionTitle": "set a new password",
      "optionIcon": Icons.lock,
      "optionFunction": () {

        Get.dialog(
          AlertDialog(
            backgroundColor: AppColors.dialogBg,
            actions: [
              EditProfileDialog(
                title: 'Set new password',
                  controller: newUserNameController,
                  onTap: (){
                    Get.back();
                    userInformationController.updatePassword(
                        newPasswordController.text.trim());
                  },
                  hintTextField: "New password")
            ],
          ),
        );
      }
    },
    {
      "optionTitle": "Delete user",
      "optionIcon": Icons.delete,
      "optionFunction": () {
        dialogsAndLoadingController.showConfirmWithActions(
          capitalize("Are you sure you want to delete your account ?"),
          capitalize("delete"),
          () {
            Get.back();
            userInformationController.deleteUser();
          },
        );
      }
    },
  ];
}
