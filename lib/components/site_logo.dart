import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, required this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text('Kushal Vadhar',style: GoogleFonts.pressStart2p(fontSize: 15, color: Colors.white),), 
    );
  }
}