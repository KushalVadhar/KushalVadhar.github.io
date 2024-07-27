import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/components/project_utlis.dart';

class ProjectCardWidget extends StatelessWidget {
  final ProjectUtils project;

  const ProjectCardWidget({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 340, 
        width: 300,  
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), 
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              project.image,
              height: 170, 
              width: 300, 
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
              child: Text(
                project.title,
                style: GoogleFonts.pressStart2p(
                  fontSize: 12, 
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Text(
                project.subtitle,
                style: GoogleFonts.pressStart2p(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Container(
              color: Colors.grey[800],
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12), 
              child: Row(
                children: [
                  Text(
                    'Available On:',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 12, 
                      fontWeight: FontWeight.w600,
                      color: Colors.amber,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'lib/assets/GitHub Line.png',
                    width: 24, 
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
