import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webandcrafts/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: buttonColor),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(fontSize: 7),
        ),
      ),
    );
  }
}
