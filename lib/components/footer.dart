import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
       
        bool isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.symmetric(vertical: isMobile ? 10 : 20),
          width: double.maxFinite,
          alignment: Alignment.center,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Made By Kushal Vadhar',
                textStyle: GoogleFonts.pressStart2p(
                  fontSize: isMobile ? 14.0 : 25.0, 
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 200),
              ),
            ],
          ),
        );
      },
    );
  }
}
