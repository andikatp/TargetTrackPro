import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/extensions/extension.dart';
import 'package:business/core/utils/enums.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomCategoryPicker extends StatelessWidget {
  const CustomCategoryPicker({
    required this.changeCategory,
    this.target,
    super.key,
  });

  final void Function(Category? category) changeCategory;
  final Target? target;

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
        DropdownButtonFormField2<Category>(
          value: target?.category,
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
                (category) => DropdownMenuItem<Category>(
                  value: category,
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
