import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedSvgButton extends StatelessWidget {
  final String title;

  final Color? background;

  final VoidCallback onPressed;

  final String svgPath;

  const RoundedSvgButton(
      {Key? key,
      required this.title,
      this.background,
      required this.onPressed,
      required this.svgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      onPressed: onPressed,
      padding: const EdgeInsets.all(16),
      textStyle: const TextStyle(color: Colors.white, fontSize: 18),
      shape: Theme.of(context).buttonTheme.shape,
      fillColor:
          background ?? Theme.of(context).buttonTheme.colorScheme!.background,
      child: Row(
        children: [
          const SizedBox(width: 8,),
          SvgPicture.asset(svgPath),
          Expanded(
            child: Center(
              child: Text(title),
            ),
          ),
        ],
      ),
    );
  }
}
