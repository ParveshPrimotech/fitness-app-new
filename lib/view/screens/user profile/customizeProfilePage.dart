import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_app_new/controller/functionsController.dart';
import 'package:fitness_app_new/view/widgets/common_app_bar.dart';
import '../../../controller/userProfileOptions/userProfileOptionsController.dart';
import '../../../helpers/string_methods.dart';

class CustomProfileSettings extends StatelessWidget {
  CustomProfileSettings({Key? key})
      : super(
    key: key,
  );
  final FunctionsController controller = Get.find();
  final UserProfileOptionsController userProfileOptionsController =
  Get.put(UserProfileOptionsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Edit profile',),
      //   child: ProfileAppBar(),
      backgroundColor: Get.arguments[0],
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...List.generate(
              userProfileOptionsController.userProfileOptionsList.length,
                  (i) => DelayedDisplay(
                delay: Duration(milliseconds: delay + 100 * i),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: InkWell(
                      onTap: userProfileOptionsController
                          .userProfileOptionsList[i]["optionFunction"],
                      child: Row(
                        children: [
                          Icon(
                            userProfileOptionsController.userProfileOptionsList[i]
                            ["optionIcon"],
                            color: i ==
                                userProfileOptionsController
                                    .userProfileOptionsList.length -
                                    1
                                ? Colors.white70
                                : Colors.white70,
                          ),
                          const SizedBox(width: 15,),
                          Text(
                            capitalize(userProfileOptionsController
                                .userProfileOptionsList[i]["optionTitle"]),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: i ==
                                    userProfileOptionsController
                                        .userProfileOptionsList.length -
                                        1
                                    ? Colors.white70
                                    : Colors.white70,
                                fontSize: 20),
                          ),
                        ],
                      )
                    /*ListTile(
                      title: Text(
                        capitalize(userProfileOptionsController
                            .userProfileOptionsList[i]["optionTitle"]),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: i ==
                                    userProfileOptionsController
                                            .userProfileOptionsList.length -
                                        1
                                ? Colors.white
                                : Colors.white,
                            fontSize: 20),
                      ),
                      leading: Icon(
                        userProfileOptionsController.userProfileOptionsList[i]
                            ["optionIcon"],
                        color: i ==
                                userProfileOptionsController
                                        .userProfileOptionsList.length -
                                    1
                            ? Colors.white
                            : Colors.white,
                      ),
                    ),*/
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
