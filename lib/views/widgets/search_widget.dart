import 'package:flutter/material.dart';

import '../theme/colors_theme.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    required this.obscureText,
    this.keyboardType,
    this.capizalize,
    required this.showLabel,
    this.suffixIcon,
    this.prefixIcon,
    this.color,
    this.readOnly,
  });

  final Function(String value)? onChanged;
  final TextCapitalization? capizalize;
  final Color? color;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hintText;
  final bool obscureText;
  final bool? readOnly;
  final bool showLabel;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextFormField(
        readOnly: readOnly ?? false,
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textCapitalization: capizalize ?? TextCapitalization.words,
        style: const TextStyle(color: ColorsTheme.white),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: ColorsTheme.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: ColorsTheme.blue.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: ColorsTheme.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: ColorsTheme.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: ColorsTheme.white),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: ColorsTheme.white),
          ),
        ),
      ),
    );
  }
}
