import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // TabController
  late TabController workOutTabController;

  // Tabs to show
  final List<Tab> workOutTabs = <Tab>[
    const Tab(text: "All"),
    const Tab(text: "Strength training"),
    const Tab(text: 'Cardio'),
    const Tab(text: 'Yoga'),
    const Tab(text: 'Crossfit'),
  ];

  @override
  void onInit() {
    // init on init hah
    workOutTabController =
        TabController(vsync: this, length: workOutTabs.length);
    super.onInit();
  }

  @override
  void onClose() { 
    // dispose
    workOutTabController.dispose();
    super.onClose();
  }
}
