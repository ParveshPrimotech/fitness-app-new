import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_app_new/view/widgets/general_widgets/rich_text_widget.dart';

import '../../../config/images sources.dart';
import '../../../config/text.dart';
import '../../../helpers/string_methods.dart';
import '../../widgets/general_widgets/builder_footer_widget.dart';
import '../../widgets/general_widgets/button.dart';
import '../../widgets/general_widgets/common_text_field.dart';
import '../../widgets/general_widgets/screen_background_image.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: <Widget>[
              BackgroundImage(
                backgroundImage: ImgSrc.appBackgroundImage,
              ),
              SizedBox(
                width: size.width,
                height: size.height,
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: size.width * 0.06),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //logo section
                      Column(
                        children:  [
                          const SizedBox(
                            height: 16,
                          ),
                        RichTextWidget(firstText: 'SIGN', secondText: 'UP'),
                        ],
                      ),
                      //email and password TextField here
                      Column(
                        children: [
                          CommonTextField(
                              icon: Icons.person,
                              hintText: 'Enter first name',
                              textEditingController: firstNameController,
                              textInputType: TextInputType.text),
                          const SizedBox(
                            height: 8,
                          ),   CommonTextField(
                              icon: Icons.person,
                              hintText: 'Enter last name',
                              textEditingController: lastNameController,
                              textInputType: TextInputType.text),
                          const SizedBox(
                            height: 8,
                          ),   CommonTextField(
                              icon: Icons.email,
                              hintText: 'Enter your gmail address',
                              textEditingController: emailController,
                              textInputType: TextInputType.emailAddress),
                          const SizedBox(
                            height: 8,
                          ),
                          CommonTextField(
                              icon: Icons.location_city,
                              hintText: 'Enter address',
                              textEditingController: addressController,
                              textInputType: TextInputType.text),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),

                      //sign in button & continue with text here
                      Column(
                        children: [
                          CustomButton(
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                            },
                            text: capitalize(AppTexts.signUp),
                            isOutlined: false,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          BuilderFooterWidget(
                            firstText: 'Already have account? ',
                            secondText: 'Login',
                            onTap: (){
                              Get.toNamed("/login");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
