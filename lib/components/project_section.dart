import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/components/project_card.dart';
import 'package:portfolio_website/components/project_utlis.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
              child: Column(
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Projects I have Worked On !',
                        textStyle: GoogleFonts.pressStart2p(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 800),
                    child: Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    children: [
                      for (int i = 0; i < flutterProjectUtils.length; i++)
                      ProjectCardWidget(project :flutterProjectUtils[i]),
                    ],
                  )
                  ),
                ],
              ),
            );
  }
}