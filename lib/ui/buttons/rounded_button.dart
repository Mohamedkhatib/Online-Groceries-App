import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;

  final Color? background;

  final VoidCallback onPressed;

  const RoundedButton(
      {Key? key, required this.title, this.background, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,

      onPressed: onPressed,
      padding:const EdgeInsets.all(16),
      textStyle: const TextStyle(color: Colors.white, fontSize: 18),
      shape: Theme.of(context).buttonTheme.shape,
      fillColor:
          background ?? Theme.of(context).buttonTheme.colorScheme!.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
