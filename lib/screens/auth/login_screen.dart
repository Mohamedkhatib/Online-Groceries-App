import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/core/theme.dart';
import 'package:groceries_app/screens/home/home_screen.dart';
import 'package:groceries_app/ui/buttons/rounded_svg_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final inputPhoneController = TextEditingController();

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
    return Image.asset('assets/images/login_background.png');
  }

  Widget _buildBodyContent() {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Get your groceries with nectar',
            style: TextStyle(fontSize: 26),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: inputPhoneController,
            decoration: InputDecoration(
                enabledBorder: inputBorder,
                focusedBorder: inputBorder,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                prefixIconConstraints:const BoxConstraints(maxHeight: 50),
                prefixIcon: _buildCountryCode()),
          ),
          const SizedBox(height: 32),
          const Text('Or connect with social media',
              style: TextStyle(color: Colors.black38)),
          const SizedBox(height: 32),
          RoundedSvgButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (c){
                return HomeScreen();
              }));
            },
            svgPath: 'assets/icons/google.svg',
            background: Colors.blue[700],
            title: 'Continue with Google',
          ),
          const SizedBox(height: 16),

          RoundedSvgButton(
            onPressed: () {},
            svgPath: 'assets/icons/facebook.svg',
            background: Colors.blue[900],
            title: 'Continue with Facebook',
          ),

          const SizedBox(height: 40,),
        ],
      ),
    );
  }

  _buildCountryCode() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CountryCodePicker(
          padding: EdgeInsets.zero,
          flagWidth: 25,
          showCountryOnly: false,
          textStyle: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}
