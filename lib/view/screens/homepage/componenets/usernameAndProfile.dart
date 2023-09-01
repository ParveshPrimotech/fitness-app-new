import 'package:flutter/material.dart';

import '../../../../config/text.dart';
import 'avatar.dart';

class ProfileAndUsername extends StatelessWidget {
  ProfileAndUsername({
    Key? key,
    required this.username,
    required this.profileImg,
    this.onProfileImgTap,
  }) : super(key: key);

  String username;
  String profileImg;
  void Function()? onProfileImgTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppTexts.hey,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                )),
            Text('$username',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ))
          ],
        ),
        /*RichText(
          text: TextSpan(
            text: AppTexts.hey,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              fontSize: 25,
            ),
            children: [
              TextSpan(
                text: ' $username',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),*/
        Container(
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.all(1),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.red, width: 2),
          ),
          child: Avatar(
            onProfileImgTap: onProfileImgTap,
            networkImage:
                'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=996&t=st=1692697862~exp=1692698462~hmac=6690e939947db94ef8f443d95011ede8b6d81a8141f0703899e550ac7e9a7f0d',
          ),
        ),
      ],
    );
  }
}
