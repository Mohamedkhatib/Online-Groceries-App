import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/screens/login_screen.dart';
import 'package:groceries_app/ui/buttons/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildBackground(),
        _buildBodyContent(),
      ],
    );
  }

  Widget _buildBackground() {
    return Image.asset(
      'assets/images/welcome_background.jpg',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget _buildBodyContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset('assets/icons/logo.svg')),
          const SizedBox(height: 16),
          const Text('Welcome\nto our store',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Text('Ger your groceries in as fast as one hour',
              style: TextStyle(color: Colors.white60, fontSize: 13)),
          const SizedBox(height: 24),
          RoundedButton(
              title: 'Get Started',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return LoginScreen();
                }));
              }),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
