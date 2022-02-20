import 'package:flutter/material.dart';
import 'package:xp_ob/app/core/theme/colors.dart';

class XPTextField extends StatefulWidget {
  final bool? isObscure;
  final bool? isPassword;
  final String? hintText;
  final TextInputType? keyboardType;
  final void Function(String)? onDone;
  final void Function(String)? onChanged;

  final int? maxLines;
  final int? maxLength;
  final Widget? prefixIcon;

  const XPTextField({
    Key? key,
    this.isObscure = false,
    this.isPassword = false,
    this.keyboardType,
    this.onDone,
    this.onChanged,
    this.maxLines,
    this.maxLength,
    this.prefixIcon,
    this.hintText,
  }) : super(key: key);

  @override
  State<XPTextField> createState() => _XPTextFieldState();
}

class _XPTextFieldState extends State<XPTextField> {
  late TextEditingController controller;
  late bool isObscure;

  @override
  void initState() {
    controller = TextEditingController();

    isObscure = widget.isObscure!;

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16),
      textAlignVertical: TextAlignVertical.center,
      obscureText: isObscure,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
        setState(() {});
      },
      onFieldSubmitted: widget.onDone,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType ?? TextInputType.number,
      decoration: InputDecoration(
          prefix: widget.prefixIcon ?? const SizedBox(),
          // contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          suffixIcon: widget.isPassword!
              ? InkWell(
                  child: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                    color: XPColors.yellow,
                  ),
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                )
              : null,
          fillColor: Colors
              .white, // focusNode.hasFocus ? Colors.white : AppColors.kLilacWhite,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          hintText: widget.hintText,
          labelText: controller.text.isEmpty ? null : widget.hintText,
          labelStyle: const TextStyle(color: XPColors.black)),
    );
  }
}
