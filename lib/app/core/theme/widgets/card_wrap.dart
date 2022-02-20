import 'package:flutter/material.dart';
import 'package:xp_ob/app/core/theme/colors.dart';

class XPCardWrap extends StatelessWidget {
  final String title;
  final Widget? icon;
  final double? width;
  final void Function()? ontap;
  const XPCardWrap({
    Key? key,
    this.icon,
    this.ontap,
    this.width,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white70,
      color: Colors.transparent,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: constraints.maxHeight,
            minHeight: constraints.minHeight,
            minWidth: width ?? 164,
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon == null) ...{
                const Icon(Icons.add_chart),
              } else ...{
                icon!
              },
              const SizedBox(height: 18),
              Text(
                title,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: XPColors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
