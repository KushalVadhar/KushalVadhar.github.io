import 'dart:typed_data';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:html' as html;
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

class ResumeDesktop extends StatefulWidget {
  const ResumeDesktop({super.key});

  @override
  _ResumeDesktopState createState() => _ResumeDesktopState();
}

class _ResumeDesktopState extends State<ResumeDesktop> {
  Future<void> _downloadResume() async {
    try {
      // Load the PDF file from assets
      final ByteData data = await rootBundle.load('lib/assets/Kushal Resume New.pdf');
      final List<int> bytes = data.buffer.asUint8List();

      // Create a blob from the bytes
      final blob = html.Blob([bytes]);

      // Create an anchor element and trigger the download
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', 'Kushal_Resume_New.pdf')
        ..click();
      html.Url.revokeObjectUrl(url);

      
      AnimatedSnackBar.material(
        'Resume downloaded successfully!',
        type: AnimatedSnackBarType.success,
        animationCurve: Curves.slowMiddle,
        duration: const Duration(seconds: 5), 
      ).show(context);
    } catch (e) {
      // Show floating error AnimatedSnackBar
      AnimatedSnackBar.material(
        'Failed to download resume: $e',
        type: AnimatedSnackBarType.error,
        animationCurve: Curves.bounceIn,
        duration: const Duration(seconds: 3), 
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
      child: Column(
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Resume',
                textStyle: GoogleFonts.pressStart2p(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 200),
              ),
            ],
          ),
          const SizedBox(height: 120),
          Row(
            children: [
              NeoPopTiltedButton(
                isFloating: true,
                onTapUp: () {
                   HapticFeedback.vibrate(); 
                },
                decoration: const NeoPopTiltedButtonDecoration(
                  color: Color.fromRGBO(255, 235, 52, 1),
                  plunkColor: Color.fromRGBO(255, 235, 52, 1),
                  shadowColor: Color.fromRGBO(36, 36, 36, 1),
                  showShimmer: true,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 15),
                  child: Text(
                    'Click On The Coin ?',
                    style: GoogleFonts.pressStart2p(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: _downloadResume,
                child: LottieBuilder.asset(
                  'lottie/Animation - 1721645602332.json',
                  width: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
