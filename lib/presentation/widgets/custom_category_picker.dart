import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/extensions/extension.dart';
import 'package:business/core/utils/enums.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomCategoryPicker extends StatelessWidget {
  const CustomCategoryPicker({required this.changeCategory, super.key});

  final void Function(String? category) changeCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: context.titleSmall,
        ),
        Gap.h12,
        DropdownButtonFormField2<String>(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: const OutlineInputBorder(),
            hintText: 'Select Target Category',
            hintStyle: context.titleSmall,
            prefixIcon: const Icon(Icons.category),
          ),
          style: context.titleSmall,
          items: Category.values
              .map(
                (category) => DropdownMenuItem<String>(
                  value: category.name,
                  child: Text(category.name),
                ),
              )
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select category.';
            }
            return null;
          },
          onChanged: changeCategory,
        ),
      ],
    );
  }
}
