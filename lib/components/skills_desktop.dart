import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:portfolio_website/components/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
        width: screenWidth,
              color:Colors.black,
              padding: const EdgeInsets.fromLTRB(
                  25, 20, 25, 20), 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Area Of Specialization',
                        textStyle: GoogleFonts.pressStart2p(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (final entry in skillsMap.entries)
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: NeoPopButton(
                            shadowColor: const Color.fromRGBO(36, 36, 36, 1),
                            color: const Color.fromRGBO(255, 235, 52, 1),
                            onTapUp: () => HapticFeedback.vibrate(),
                            onTapDown: () => HapticFeedback.vibrate(),
                            child: Container(
                              width: 250,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: ListTile(
                                leading: Icon(
                                  entry.value,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                title: Text(
                                  entry.key,
                                  style: GoogleFonts.pressStart2p(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'What Skills Can I Work On !',
                        textStyle: GoogleFonts.pressStart2p(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                  ),
                  CarouselSlider.builder(
                    itemCount: skillItems.length,
                    itemBuilder: (context, index, realIndex) {
                      final item = skillItems[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(item['img'], width: 200, height: 200),
                          const SizedBox(height: 10),
                          Text(
                            item['title'],
                            style: GoogleFonts.pressStart2p(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      );
                    },
                    options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                    ),
                  ),
                ],
              ),

    );
  }
}