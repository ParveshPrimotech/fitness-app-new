import 'package:flutter/material.dart';
import 'package:fitness_app_new/view/widgets/general_widgets/button.dart';
import '../../../config/Colors.dart';
import '../../../helpers/string_methods.dart';

class EditProfileDialog extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  final VoidCallback onTap;
  final String hintTextField;
  final String? buttonText;
  final String? title;

  EditProfileDialog(
      {Key? key,
      required this.controller,
      required this.onTap,
      required this.hintTextField,
      required this.title,
      this.buttonText})
      : super(key: key);

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300.0,
        height: 200.0,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0x00ffffff),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        child: Container(
          width: double.infinity,
          color: AppColors.dialogBg,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title!,
                style: const TextStyle(color: Colors.black87, fontSize: 20),
              ),
              TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: widget.hintTextField,
                  border: const OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFF000000), width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: CustomButton(
                    text: capitalize(widget.buttonText != null
                        ? widget.buttonText!
                        : "update"),
                    isOutlined: false,
                    onPressed: widget.onTap
                    /*     Get.back();
                      userInformationController
                          .updateUsername(newUserNameController.text.trim());*/
                    ),
              ),
            ],
          ),
        ));
  }
}
