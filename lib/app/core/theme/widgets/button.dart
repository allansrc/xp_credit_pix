import 'package:flutter/material.dart';

import '../colors.dart';

class XPButtom extends StatelessWidget {
  final String text;
  final Function()? onpressed;
  const XPButtom({Key? key, required this.text, this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) => Container(
        constraints: BoxConstraints(
          maxHeight: constrains.maxHeight,
          maxWidth: constrains.maxWidth,
          minWidth: 172,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: TextButton(
          onPressed: onpressed,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: const BorderSide(color: XPColors.yellow),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
