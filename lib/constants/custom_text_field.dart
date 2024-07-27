import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,  this.controller,  this.maxlines =1,  this.hintText});
  final TextEditingController? controller;
    final int maxlines ;
    final String? hintText;

  @override
  Widget build(BuildContext context) {
    
    return  NeoPopButton(
                          color: Colors.white,
                          onTapUp: () {
                            
                          },
                          shadowColor: Colors.grey,
                          parentColor: Colors.white,
                          depth: 10,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: controller,
                              maxLines: maxlines,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(16),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: hintText,
                                hintStyle: GoogleFonts.pressStart2p(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                
                              ),
                            ),
                          ),
                        );
  }
}