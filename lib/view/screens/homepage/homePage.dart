import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_app_new/config/Colors.dart';
import 'package:fitness_app_new/config/workouts%20lists/workouts%20Lists.dart';
import 'package:fitness_app_new/view/screens/user%20profile/userProfil.dart';

import '../../../controller/functionsController.dart';
import '../../../controller/tabs controllers/workOutTabController.dart';
import '../../../controller/userController/userController.dart';
import '../../../config/images sources.dart';
import '../../../helpers/string_methods.dart';
import '../../widgets/general_widgets/screen_background_image.dart';

import 'componenets/HomePageSearchBar.dart';
import 'componenets/find_your_workout.dart';
import 'componenets/tabBarViewSections.dart';
import 'componenets/usernameAndProfile.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final String bgImg = ImgSrc().randomFromAssetsList();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FunctionsController controller = Get.put(FunctionsController());

  final UserInformationController userInformationController =
      Get.put(UserInformationController());

  final CustomTabBarController _tabx = Get.put(CustomTabBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BackgroundImage(
          backgroundImage: widget.bgImg,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [0.45, 1],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppColors.darkBlue,
                AppColors.darkBlue.withOpacity(0.05),
              ],
            ),
          ),
          width: double.infinity,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Obx(
                    () => ProfileAndUsername(
                      onProfileImgTap: () {
                        Get.to(() => const UserProfile());
                      },
                      username: capitalize(
                        userInformationController.username.value,
                      ),
                      profileImg:
                          userInformationController.userProfileImg.value,
                    ),
                  ),
                  /* const SizedBox(
                    height: 55,
                  ),
                  DelayedDisplay(
                    delay: Duration(milliseconds: delay + 100),
                    child: PlayButton(),
                  ),*/
                  const SizedBox(
                    height: 130,
                  ),
                  DelayedDisplay(
                    delay: Duration(milliseconds: delay + 200),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: FindYourWorkout(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 45,
                    child: DelayedDisplay(
                      delay: Duration(milliseconds: delay + 300),
                      child: const HomePageSearchBar(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DelayedDisplay(
                    delay: Duration(
                      milliseconds: delay + 400,
                    ),
                    child: TabBar(
                      labelColor: Colors.white,
                      isScrollable: true,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.4),
                            offset: const Offset(0, 3),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      controller: _tabx.workOutTabController,
                      tabs: _tabx.workOutTabs,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: DelayedDisplay(
                      delay: Duration(milliseconds: delay + 600),
                      child: TabBarView(
                        controller: _tabx.workOutTabController,
                        children: [
                          Center(
                            child: TabBarViewSection(
                              title: capitalize(
                                'All workouts',
                              ),
                              dataList: WorkoutsList.allWorkoutsList,
                            ),
                          ),
                          Center(
                            child: TabBarViewSection(
                              title: capitalize(
                                'Strength Traning',
                              ),
                              dataList: WorkoutsList.strengthTraningList,
                            ),
                          ),
                          Center(
                            child: TabBarViewSection(
                                title: capitalize(
                                  'Cardio',
                                ),
                                dataList: WorkoutsList.cardioList),
                          ),
                          Center(
                            child: TabBarViewSection(
                                title: capitalize(
                                  'Yoga',
                                ),
                                dataList: WorkoutsList.yogaList),
                          ),
                          Center(
                            child: TabBarViewSection(
                                title: capitalize(
                                  'Crossfit',
                                ),
                                dataList: WorkoutsList.crossFit),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Offers',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding : const EdgeInsets.only(right: 10),
                            child: ClipRRect( borderRadius: BorderRadius.circular(10),child: Image.asset(imgList[index],fit: BoxFit.cover,)));
                      },
                      itemCount: imgList.length,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

List<String> imgList = <String>[
  'imgs/cycling_img.jpg',
  'imgs/power_yoga.jpg',
  'imgs/warrior_pose_img.jpg',
  'imgs/Downward_facing_dog_pose.jpg',
];