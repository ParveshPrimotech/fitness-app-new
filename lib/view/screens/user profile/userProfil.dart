import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:fitness_app_new/controller/functionsController.dart';
import 'package:fitness_app_new/config/Colors.dart';
import 'package:fitness_app_new/config/text.dart';
import 'package:fitness_app_new/view/widgets/common_app_bar.dart';
import 'package:fitness_app_new/view/widgets/general_widgets/button.dart';
import 'package:fitness_app_new/view/widgets/setting_list_tile.dart';
import '../../../controller/authControllers/signOutController.dart';
import '../../../controller/userController/userController.dart';
import '../../../config/UserProfile/userProfil.dart';
import '../../../helpers/string_methods.dart';
import 'components/appBar.dart';
import 'components/stat.dart';
import 'customizeProfilePage.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final FunctionsController controller = Get.put(FunctionsController());
  final UserInformationController userInformationController = Get.find();
  final SignOutController signOutController = Get.put(SignOutController());
  Color? scfldColor = AppColors.darkBlue;
  Color? overlayedColor = const Color.fromARGB(255, 22, 23, 43);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scfldColor,
      appBar:  const CommonAppBar(title: 'Profile',),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: DelayedDisplay(
                        delay: Duration(milliseconds: delay + 100),
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Obx(
                              (() => Image(
                                    image: NetworkImage(userInformationController
                                        .userProfileImg.value),
                                    fit: BoxFit.cover,
                                    frameBuilder: (_, image, loadingBuilder, __) {
                                      if (loadingBuilder == null) {
                                        return const SizedBox(
                                          height: 300,
                                          child: Center(
                                            child: SpinKitSpinningLines(
                                              color: Color(0xff40D876),
                                              duration: Duration(seconds: 1),
                                              size: 60,
                                            ),
                                          ),
                                        );
                                      }
                                      return image;
                                    },
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          DelayedDisplay(
                            delay: Duration(milliseconds: delay + 400),
                            child: Obx(
                                  () => DelayedDisplay(
                                child: Text(
                                  capitalize(
                                    userInformationController.username.value,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DelayedDisplay(
                            delay: Duration(milliseconds: delay + 300),
                            child: Expanded(
                              child: Text(
                                "I'm a fitness enthusiast who loves to help others reach their goals. I'm passionate about helping people live healthier and happier lives.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white.withOpacity(.8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
/*
                const SizedBox(
                  height: 40,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: delay + 400),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(
                        UserProfileStats.stats.length,
                        (i) => Stat(
                          statValue:
                              capitalize(UserProfileStats.stats[i]["value"]),
                          statTitle: capitalize(
                            UserProfileStats.stats[i]["title"],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),*/
                const SizedBox(height: 30),
                DelayedDisplay(
                  child: ProfileTile(
                    text: "Edit profile",
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onTap: (){
                      Get.to(() => CustomProfileSettings(), arguments: [
                        scfldColor,
                        overlayedColor,
                      ]);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const DelayedDisplay(
                  child: ProfileTile(
                    text: "Rate us on play store",
                    icon: Icon(Icons.feedback_outlined, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 10),
                const DelayedDisplay(
                  child: ProfileTile(
                    text: "Terms and conditions",
                    icon: Icon(Icons.privacy_tip_outlined, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: (){
                    showDialog(context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text(
                                "Are you sure you want to sign out?"),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius
                                        .circular(5),
                                    side: const BorderSide(
                                        color: Colors.black),
                                  ),
                                  primary: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black87,
                                ),
                                onPressed: () {

                                  Navigator.pop(context);
                                },
                                child: const Text('Logout',
                                  style: TextStyle(
                                      color: Colors.white),),
                              ),
                            ],
                          );
                        });
                  },
                  child: const DelayedDisplay(
                    child: ProfileTile(
                      text: "Sign out",
                      icon: Icon(Icons.logout_outlined, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
