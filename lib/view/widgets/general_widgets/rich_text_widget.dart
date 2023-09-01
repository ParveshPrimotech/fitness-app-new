import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RichTextWidget extends StatelessWidget {
  String firstText;
  String secondText;

  RichTextWidget({Key? key,required this.firstText,required this.secondText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.inter(
          fontSize: 28,
          color: Colors.white,
          letterSpacing: 1.999999953855673,
        ),
        children: [
          TextSpan(
            text: firstText,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 26)
          ),
          TextSpan(
            text: secondText,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.red,
                fontSize: 26)
          ),
        ],
      ),
    );
  }

}
