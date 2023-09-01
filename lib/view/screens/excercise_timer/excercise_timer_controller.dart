import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  var isRest = false.obs;
  var isDelay = false.obs;
  var subtitle = ''.obs;

  List<Duration> lapsTimeList = [
    const Duration(seconds: 30),
    const Duration(minutes: 1),
    const Duration(minutes: 2),
    const Duration(minutes: 5),
  ];

  List<Duration> restTimeList = [
    const Duration(seconds: 5),
    const Duration(seconds: 10),
    const Duration(seconds: 15),
    const Duration(seconds: 30),
  ];

  List<Duration> delayTimeList = [
    const Duration(seconds: 30),
    const Duration(seconds: 1),
    const Duration(minutes: 2),
    const Duration(minutes: 5),
  ];

  late var lapTime = lapsTimeList[0].obs;
  late var restTime = restTimeList[0].obs;
  late var delayTime = delayTimeList[0].obs;

  CountDownController countDownController = CountDownController();

  void timeDuration() async {
    isDelay.value = true;
    subtitle.value = "It's rest time";
    countDownController.restart(duration: restTime.value.inSeconds);
    await Future.delayed(Duration(seconds: restTime.value.inSeconds));
    isDelay.value = false;

    if (isRest.isFalse) {
      count++;
      isRest.value = true;
      subtitle.value = 'Stay ready';
      countDownController.restart(duration: delayTime.value.inSeconds);
    } else {
      subtitle.value = '';
      isRest.value = false;
      countDownController.restart(duration: lapTime.value.inSeconds);
    }
  }
}