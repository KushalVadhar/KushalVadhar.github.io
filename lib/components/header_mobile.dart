import 'package:flutter/material.dart';
import 'package:portfolio_website/components/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 50.0,
            margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
             decoration:  BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                    colors: [Colors.black, Colors.white]),borderRadius: BorderRadius.circular(100) ),
            child: Row(
              children: [
                SiteLogo(onTap: onLogoTap,),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: onMenuTap, icon: const Icon(Icons.menu)),
                )
              ],
            ),
          );
  }
}