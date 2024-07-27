import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/neopop.dart';
import 'package:portfolio_website/components/contact_me.dart';
import 'package:portfolio_website/components/drawer_mobile.dart';
import 'package:portfolio_website/components/footer.dart';
import 'package:portfolio_website/components/header_desktop.dart';
import 'package:portfolio_website/components/header_mobile.dart';
import 'package:portfolio_website/components/main_page_desktop.dart';
import 'package:portfolio_website/components/main_page_mobile.dart';
import 'package:portfolio_website/components/navbar.dart';
import 'package:portfolio_website/components/project_section.dart';
import 'package:portfolio_website/components/resume_desktop.dart';
import 'package:portfolio_website/components/resume_mobile.dart';
import 'package:portfolio_website/components/skills_desktop.dart';
import 'package:portfolio_website/components/skills_mobile.dart';
import 'package:portfolio_website/constants/constants.dart';
import 'dart:html' as html;

import 'package:portfolio_website/constants/custom_text_field.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      bool isDesktop = constraints.maxWidth >= minDesktopWidth;

      return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        endDrawer: isDesktop
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
                scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);
              }),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navbarKeys[0]),
              if (isDesktop)
                HeaderDesktop(onNavMenuTap: (int navIndex) {
                  scrollToSection(navIndex);
                })
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              if (isDesktop)
                MainPageDesktop(onGetInTouchTap: () {
                  scrollToSection(4); 
                })
              else
                MainPageMobile(onGetInTouchTap: () {
                  scrollToSection(4); 
                }),
              if (isDesktop)
                SkillsDesktop(
                  key: navbarKeys[1],
                )
              else
                const SkillsMobile(),
              ProjectSection(
                key: navbarKeys[2],
              ),
              if (isDesktop)
                ResumeDesktop(
                  key: navbarKeys[3],
                )
              else
                const ResumeMobile(),
              ContactMe(
                key: navbarKeys[4],
              ),
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex >= navbarKeys.length) {
      print('Index out of range: $navIndex');
      return;
    }
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(key.currentContext!,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
