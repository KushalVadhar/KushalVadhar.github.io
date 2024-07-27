import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:portfolio_website/components/contact_me.dart';
import 'package:portfolio_website/constants/constants.dart';

class MainPageDesktop extends StatelessWidget {
  const MainPageDesktop({super.key, required this.onGetInTouchTap});

  final VoidCallback onGetInTouchTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1.2,
      constraints: BoxConstraints(minHeight: 350.0),
      padding: const EdgeInsets.all(20.0),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Hi, I am',
                    textStyle: GoogleFonts.pressStart2p(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                  TypewriterAnimatedText(
                    'Kushal Vadhar',
                    textStyle: GoogleFonts.pressStart2p(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                  TypewriterAnimatedText(
                    'A Flutter Developer',
                    textStyle: GoogleFonts.pressStart2p(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
              ),
              SizedBox(height: 120),
              NeoPopTiltedButton(
                isFloating: true,
                onTapUp: onGetInTouchTap,
                decoration: const NeoPopTiltedButtonDecoration(
                  color: Color.fromRGBO(255, 235, 52, 1),
                  plunkColor: Color.fromRGBO(255, 235, 52, 1),
                  shadowColor: Color.fromRGBO(36, 36, 36, 1),
                  showShimmer: true,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 70.0,
                    vertical: 15,
                  ),
                  child: Text(
                    'Get In Touch Now',
                    style: GoogleFonts.pressStart2p(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 30),
          LottieBuilder.asset(
            'lottie/Animation - 1721212428983.json',
            width: screenWidth / 2,
          ),
        ],
      ),
    );
  }
}
