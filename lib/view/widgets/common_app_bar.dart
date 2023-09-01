import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/Colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const CommonAppBar({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 80,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: AppColors.darkBlue,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity,60);
}
