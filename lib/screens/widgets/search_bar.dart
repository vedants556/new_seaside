import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Widget leading;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: leading,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }
}
