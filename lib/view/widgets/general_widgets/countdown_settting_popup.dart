import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_app_new/view/widgets/general_widgets/timer_dropdown_item.dart';
import '../../screens/excercise_timer/excercise_timer_controller.dart';

class CountdownSettingPopup extends StatefulWidget {

  const CountdownSettingPopup({Key? key}) : super(key: key);

  @override
  State<CountdownSettingPopup> createState() => _CountdownSettingPopupState();
}

class _CountdownSettingPopupState extends State<CountdownSettingPopup> {
  final CounterController counterController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AlertDialog(

          title: const Text('Time Settings'),
          content: SizedBox(
            height: (MediaQuery.of(context).size.height * 0.33),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Lap Time'),
                    DropdownItemWidget(
                      lapsTimeList: counterController.lapsTimeList,
                      selectedItem: counterController.lapTime.value,
                      onSelect: (lapTime) {
                        counterController.lapTime.value = lapTime;
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Rest Time'),
                    DropdownItemWidget(
                      lapsTimeList: counterController.restTimeList,
                      selectedItem: counterController.restTime.value,
                      onSelect: (restTime) {
                        counterController.restTime.value = restTime;
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Delay Time'),
                    DropdownItemWidget(
                      lapsTimeList: counterController.delayTimeList,
                      selectedItem: counterController.delayTime.value,
                      onSelect: (delayTime) {
                        counterController.delayTime.value = delayTime;
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        counterController.lapTime.value = const Duration(seconds: 30);
                        counterController.restTime.value = const Duration(seconds: 5);
                        counterController.delayTime.value = const Duration(seconds: 30);
                        Get.back();
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          Colors.red,
                        ),
                      ),
                      child: const Text('Cancel',style: TextStyle(fontSize: 18,color: Colors.black87),),
                    ),
                    const SizedBox(width: 5,),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          Colors.green,
                        ),
                      ),
                      child: const Text('Submit',style: TextStyle(fontSize: 18,color: Colors.black87),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
