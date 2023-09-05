import 'package:flutter/material.dart';
import 'package:fitness_app_new/config/text.dart';

class HomePageSearchBar extends StatelessWidget {
  const HomePageSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: TextField(
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white.withOpacity(0.5),
                  size: 20,
                ),
                isDense: true,
                hintText: AppTexts.searchWorkout,
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.black,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (() {
                // controller.showFilterDialog(context);
              }),
              child: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: Colors.red.withAlpha(100),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(10)),
                ),
                child: const Icon(
                  Icons.filter_list,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ))
      ],
    );
  }
}
