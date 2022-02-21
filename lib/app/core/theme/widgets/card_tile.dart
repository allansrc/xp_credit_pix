import 'package:flutter/material.dart';
import 'package:xp_ob/app/core/theme/colors.dart';

class XPCardTile extends StatelessWidget {
  final void Function() ontap;
  final String title;
  final String description;
  final Widget? icon;
  final Color? color;
  final Color? colorText;
  final bool? boolSpacer;

  const XPCardTile(
      {Key? key,
      required this.ontap,
      required this.title,
      required this.description,
      this.icon,
      this.color,
      this.colorText,
      this.boolSpacer = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: color ?? Colors.white,
        ),
        child: Row(
          children: [
            if (icon != null) ...{icon!} else
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 26,
                    backgroundColor: XPColors.black,
                    child: Icon(
                      Icons.person_add_alt_sharp,
                      color: Colors.white,
                    ),
                  )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: colorText ?? XPColors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      color: colorText ?? XPColors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: XPColors.background,
            )
          ],
        ),
      ),
    );
  }
}
