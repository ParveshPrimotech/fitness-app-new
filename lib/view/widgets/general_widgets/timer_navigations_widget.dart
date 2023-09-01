import 'package:flutter/material.dart';

class CustomTimerButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double? size;

  const CustomTimerButton({Key? key,required this.icon, required this.onTap,this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: Colors.grey.withAlpha(100)),
        child: Icon(
          icon,
          color: Colors.white.withAlpha(200),
          size: size,
        ),
      ),
    );
  }
}
