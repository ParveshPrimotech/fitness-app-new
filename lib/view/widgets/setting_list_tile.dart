import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback? onTap;
  final Color? scfoldColor;
  final Color? overlayedColor;

  const ProfileTile(
      {Key? key,
      required this.icon,
      required this.text,
      this.onTap,
      this.scfoldColor,
      this.overlayedColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shape: BoxShape.rectangle,
              color: Colors.red,
            ),
            child: icon,
          ),
          title: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16),
          ),
          trailing: const Icon(Icons.arrow_forward_rounded, color: Colors.red),
        ),
      ),
    );
  }
}
