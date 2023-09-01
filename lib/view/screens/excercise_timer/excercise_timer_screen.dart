import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:fitness_app_new/view/screens/excercise_timer/excercise_timer_controller.dart';
import 'package:fitness_app_new/view/widgets/general_widgets/timer_navigations_widget.dart';

import '../../../config/Colors.dart';
import '../../widgets/general_widgets/countdown_settting_popup.dart';

class ExcerciseTimerScreen extends StatefulWidget {
  final String? title;
  final String? totalSets;
  final String? timeLeft;
  final String? overlayedImg;

  const ExcerciseTimerScreen(
      {Key? key, this.title, this.totalSets, this.timeLeft, this.overlayedImg})
      : super(key: key);

  @override
  State<ExcerciseTimerScreen> createState() => _ExcerciseTimerScreenState();
}

class _ExcerciseTimerScreenState extends State<ExcerciseTimerScreen> {
  final AudioPlayer _player = AudioPlayer();
  final counterController = Get.put(CounterController());

  @override
  void initState() {
    super.initState();
    _player.setAsset('audio/ticking_clock.mp3');
    _player.play();
    _player.setLoopMode(LoopMode.one);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [


          FractionallySizedBox(
            heightFactor: .7,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                widget.overlayedImg.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),


          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0.5, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.darkBlue,
                  widget.overlayedImg != null
                      ? AppColors.darkBlue.withOpacity(0.05)
                      : AppColors.darkBlue.withOpacity(0.8),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title.toString(),
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.redAccent,
                        shadows: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 10,
                          ),
                        ],
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() =>
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              _setsValue(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          CircularCountDownTimer(
                            controller: counterController.countDownController,
                            duration: counterController.lapsTimeList[0]
                                .inSeconds,
                            isReverse: true,
                            fillColor: _chooseColor(),
                            height: 200,
                            width: 200,
                            strokeWidth: 25,
                            onComplete: () {
                              counterController.timeDuration();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                behavior: SnackBarBehavior.floating,
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                // padding: const EdgeInsets.only(left: 20, top: 20),
                              ));
                            },
                            strokeCap: StrokeCap.round,
                            isReverseAnimation: true,
                            ringColor: _chooseColor().withAlpha(50),
                            autoStart: true,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTimerButton(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                icon: Icons.arrow_back,
                                size: 30,
                              ),
                              CustomTimerButton(
                                onTap: () {
                                  showDialog(context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: const Text(
                                              "Would you like to restart this exercise?"),
                                          actions: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(5),
                                                  side: const BorderSide(
                                                      color: Colors.black),
                                                ),
                                                primary: Colors.white,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.black87,
                                              ),
                                              onPressed: () {
                                                counterController
                                                    .countDownController
                                                    .restart(
                                                    duration: counterController
                                                        .lapTime.value
                                                        .inSeconds);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Submit',
                                                style: TextStyle(
                                                    color: Colors.white),),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                icon: Icons.restart_alt_outlined,
                                size: 45,
                              ),
                              CustomTimerButton(
                                onTap: () {},
                                icon: Icons.navigate_next,
                                size: 30,
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),

          Positioned(
            top: 10,
            right: 10,
            child: SafeArea(
              child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const CountdownSettingPopup();
                        });
                  },
                  child: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  String _setsValue() {
    if (int.parse(widget.totalSets!) > counterController.count.value &&
        counterController.subtitle.value == '') {
      return 'Total sets: ${widget.totalSets} | Current set: ${counterController
          .count.value}';
    } else if (int.parse(widget.totalSets!) > counterController.count.value &&
        counterController.subtitle.value != '') {
      return counterController.subtitle.value;
    } else {
      _player.stop();
      counterController.countDownController.pause();
      return 'Congratulations! You have completed the exercise. 🥳';
    }
  }

  Color _chooseColor() {
    return counterController.isDelay.value
        ? Colors.yellowAccent.withAlpha(100)
        : counterController.isRest.value
        ? Colors.red
        : Colors.green;
  }
}
