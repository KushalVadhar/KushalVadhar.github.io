import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/components/navbar.dart';
import 'package:portfolio_website/components/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavMenuTap});
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 60.0,
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration:  BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                    colors: [Colors.black, Colors.white]),borderRadius: BorderRadius.circular(100) ),
            child: Row(
              children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: SiteLogo(onTap: (){

                   })
                 ),
                const Spacer(),
                for (int i = 0; i < navbar.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextButton(onPressed: () {
                      onNavMenuTap(i);
                    }, child:  Text(navbar[i],style:GoogleFonts.pressStart2p(fontSize: 15, color: Colors.black),)),
                  )
              ],
            ),
    );
  }
}