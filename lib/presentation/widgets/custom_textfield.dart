import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/extensions/extension.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.labelText,
    required this.controller,
    required this.icon,
    required this.validator,
    this.type,
    super.key,
  });

  final String labelText;
  final TextEditingController controller;
  final TextInputType? type;
  final IconData icon;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: context.titleSmall,
        ),
        Gap.h12,
        TextFormField(
          autofocus: true,
          controller: controller,
          keyboardType: type,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            prefixIcon: Icon(icon),
            contentPadding: EdgeInsets.zero,
            hintText: labelText,
            hintStyle: context.bodyMedium,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
