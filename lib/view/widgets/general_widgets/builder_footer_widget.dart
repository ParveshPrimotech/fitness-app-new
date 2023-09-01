import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuilderFooterWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final VoidCallback? onTap;

  const BuilderFooterWidget({Key? key,required this.firstText,required this.secondText,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: onTap,
        child: Text.rich(
          TextSpan(
            style: GoogleFonts.nunito(
              fontSize: 16.0,
              color: Colors.white,
            ),
            children: [
              //'Don’t have account? '
              TextSpan(
                text: firstText,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w600,
                ),
              ),
              //'Sign up'
              TextSpan(
                text: secondText,
                style: GoogleFonts.nunito(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
