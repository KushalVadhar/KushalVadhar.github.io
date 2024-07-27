import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:portfolio_website/constants/constants.dart';
import 'package:portfolio_website/constants/custom_text_field.dart';
import 'package:portfolio_website/constants/links.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:http/http.dart' as http;

// Import this only for web
import 'dart:html' as html;
import 'dart:convert';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    
    print('initState called');
  }

  @override
  void dispose() {
    // Dispose controllers to free up resources
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> sendMessage(String name, String email, String message) async {
    const url = 'https://formspree.io/f/mqazebna'; 

    setState(() {
      _isSending = true; // Set sending state to true
      print('Sending state set to true');
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'message': message,
        }),
      );

      if (response.statusCode == 200) {
        print('Message sent successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Message sent successfully!')),
        );
      } else {
        print('Failed to send message: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send message.')),
        );
      }
    } catch (e) {
      print('Error sending message: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sending message.')),
      );
    } finally {
      setState(() {
        _isSending = false; // Reset sending state
        print('Sending state set to false');
      });
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
                'Get In Touch Now ',
                textStyle: GoogleFonts.pressStart2p(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 200),
              ),
            ],
          ),
          const SizedBox(height: 80),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= minDesktopWidth) {
                  return buildNameEmailFieldDesktop();
                }
                return buildNameEmailFieldMobile();
              },
            ),
          ),
          const SizedBox(height: 40),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: CustomTextField(
              hintText: 'Your Message',
              maxlines: 20,
              controller: _messageController,
            ),
          ),
          const SizedBox(height: 40),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: NeoPopTiltedButton(
              isFloating: true,
              onTapUp: () {
                print('Send Message button tapped');
                if (_formKey.currentState?.validate() ?? false && !_isSending) {
                  print('Form is valid and not sending, proceeding to send message');
                  sendMessage(
                    _nameController.text,
                    _emailController.text,
                    _messageController.text,
                  );
                } else {
                  print('Form is invalid or message is already sending');
                }
              },
              decoration: const NeoPopTiltedButtonDecoration(
                color: Color.fromRGBO(255, 235, 52, 1),
                plunkColor: Color.fromRGBO(255, 235, 52, 1),
                shadowColor: Color.fromRGBO(36, 36, 36, 1),
                showShimmer: true,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
                child: _isSending
                    ? CircularProgressIndicator(color: Colors.black)
                    : Text(
                        'Send Message Now ',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: const Divider(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            children: [
              InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(Links.github);
                  if (kIsWeb) {
                    html.window.open(url.toString(), '_blank');
                  } else {
                    try {
                      if (await url_launcher.canLaunchUrl(url)) {
                        await url_launcher.launchUrl(url);
                      } else {
                        print('Could not launch URL: $url');
                      }
                    } catch (e) {
                      print('Error launching URL: $e');
                    }
                  }
                },
                child: Image.asset('lib/assets/GitHub Colored.png', width: 40),
              ),
              InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(Links.twitter);
                  if (kIsWeb) {
                    html.window.open(url.toString(), '_blank');
                  } else {
                    try {
                      if (await url_launcher.canLaunchUrl(url)) {
                        await url_launcher.launchUrl(url);
                      } else {
                        print('Could not launch URL: $url');
                      }
                    } catch (e) {
                      print('Error launching URL: $e');
                    }
                  }
                },
                child: Image.asset('lib/assets/Twitter X Rounded Icon.png', width: 40),
              ),
              InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(Links.instagram);
                  if (kIsWeb) {
                    html.window.open(url.toString(), '_blank');
                  } else {
                    try {
                      if (await url_launcher.canLaunchUrl(url)) {
                        await url_launcher.launchUrl(url);
                      } else {
                        print('Could not launch URL: $url');
                      }
                    } catch (e) {
                      print('Error launching URL: $e');
                    }
                  }
                },
                child: Image.asset('lib/assets/Instagram New 2022 Line.png', width: 40),
              ),
              InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(Links.linkedin);
                  if (kIsWeb) {
                    html.window.open(url.toString(), '_blank');
                  } else {
                    try {
                      if (await url_launcher.canLaunchUrl(url)) {
                        await url_launcher.launchUrl(url);
                      } else {
                        print('Could not launch URL: $url');
                      }
                    } catch (e) {
                      print('Error launching URL: $e');
                    }
                  }
                },
                child: Image.asset('lib/assets/Linkedin.png', width: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomTextField(
            hintText: 'Name',
            controller: _nameController,
          ),
        ),
        const SizedBox(width: 25),
        Expanded(
          child: CustomTextField(
            hintText: 'Email',
            controller: _emailController,
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        CustomTextField(
          hintText: 'Name',
          controller: _nameController,
        ),
        const SizedBox(height: 15),
        CustomTextField(
          hintText: 'Email',
          controller: _emailController,
        ),
      ],
    );
  }
}
