import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui/buttons/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset('assets/images/welcome_background.jpg',
            fit: BoxFit.cover, width: double.infinity, height: double.infinity),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/icons/logo.svg'),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Welcome\n to our store',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Ger your groceries in as fast as one hour',
                    style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
              ),
              const SizedBox(height: 24),
              const RoundedButton(
                title: 'Get Started',

              ),
              const SizedBox(height: 50),
            ],
          ),
        )
      ]),
    );
  }
}
