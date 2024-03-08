import 'package:business/core/constants/app_sizes.dart';
import 'package:business/presentation/widgets/custom_category_picker.dart';
import 'package:business/presentation/widgets/custom_date_picker.dart';
import 'package:business/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTargetPage extends StatelessWidget {
  const AddTargetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final weightController = TextEditingController();
    String? category = '';
    DateTime? startDate;
    DateTime? endDate;

    void getDate(DateTime? startDateFromWidget, DateTime? endDateFromWidget) {
      startDate = startDateFromWidget;
      endDate = endDateFromWidget;
    }

    void getCategory(String? categoryFromWidget) =>
        category = categoryFromWidget;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const BeveledRectangleBorder(),
          minimumSize: const Size.fromHeight(Sizes.p64),
        ),
        child: const Text('Add Target'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        minimum: REdgeInsets.all(Sizes.p20),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                labelText: 'Target Name',
                controller: nameController,
                icon: Icons.edit,
              ),
              Gap.h20,
              CustomCategoryPicker(changeCategory: getCategory),
              Gap.h20,
              CustomTextField(
                labelText: 'Weight',
                controller: weightController,
                icon: Icons.monitor_weight,
              ),
              Gap.h20,
              CustomDatePicker(changeDateRange: getDate),
            ],
          ),
        ),
      ),
    );
  }
}
