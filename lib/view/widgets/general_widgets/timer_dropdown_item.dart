import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_new/helpers/extension/duration_extension.dart';

class DropdownItemWidget extends StatelessWidget {
  final List<Duration> lapsTimeList;
  final Duration selectedItem;
  final Function(Duration) onSelect;

  DropdownItemWidget(
      {Key? key,
      required this.lapsTimeList,
      required this.selectedItem,
      required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      items: lapsTimeList
          .map((e) => DropdownMenuItem<Duration>(
              value: e,
              child: Text(
                e.toStringInHoursMinutesSeconds(),
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          )
          .toList(),
      buttonHeight: 50,
      iconSize: 24,
      buttonPadding: const EdgeInsets.only(left: 5, right: 5),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      value: selectedItem,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (value) {
        onSelect(value as Duration);
      },
    );
  }
}
