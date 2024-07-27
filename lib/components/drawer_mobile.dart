import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/components/navbar.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(context);
                    },
                    icon: Icon(Icons.close, color: Colors.redAccent,)),
              ),
            ),
            for (int i = 0; i < navIcons.length; i++)
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                onTap: () {
                  onNavItemTap(i);
                },
                leading: Icon(navIcons[i],color: Colors.white,),
                title: Text(
                  navbar[i],
                  style: GoogleFonts.pressStart2p(color: Colors.white),
                ),
              )
          ],
        ),
      );
  }
}