import 'package:flutter/material.dart';

import '../colors.dart';

class XPElevetedButtom extends StatelessWidget {
  final String text;
  final double? width;
  final Color? color;
  final Function()? onpressed;
  const XPElevetedButtom(
      {Key? key, required this.text, this.onpressed, this.color, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) => Container(
        constraints: BoxConstraints(
          maxHeight: constrains.maxHeight,
          maxWidth: constrains.maxWidth,
          minWidth: width ?? 256,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ElevatedButton(
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
            backgroundColor: MaterialStateProperty.all<Color>(
              color ?? XPColors.yellow,
            ),
          ),
        ),
      ),
    );
  }
}
