import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/utils/enums.dart';
import 'package:business/presentation/widgets/core/custom_category_picker.dart';
import 'package:business/presentation/widgets/core/custom_date_picker.dart';
import 'package:business/presentation/widgets/core/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTargetPage extends StatefulWidget {
  const AddTargetPage({required this.addTarget, super.key});

  final void Function({
    required String name,
    required Category category,
    required int weight,
    required DateTime? startDate,
    required DateTime? endDate,
  }) addTarget;

  @override
  State<AddTargetPage> createState() => _AddTargetPageState();
}

class _AddTargetPageState extends State<AddTargetPage> {
  late GlobalKey<FormState> formKey;
  late TextEditingController nameController;
  late TextEditingController weightController;
  Category category = Category.quantitative;
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    weightController = TextEditingController();
    super.initState();
  }

  void getDate(DateTime? startDateFromWidget, DateTime? endDateFromWidget) {
    startDate = startDateFromWidget;
    endDate = endDateFromWidget;
  }

  void getCategory(Category? categoryFromWidget) =>
      category = categoryFromWidget!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            widget.addTarget(
              name: nameController.text.trim(),
              category: category,
              weight: int.parse(weightController.text.trim()),
              startDate: startDate,
              endDate: endDate,
            );
            Navigator.pop(context);
          }
        },
        style: ElevatedButton.styleFrom(
          shape: const BeveledRectangleBorder(),
          minimumSize: Size.fromHeight(Sizes.p64.h),
        ),
        child: const Text('Add Target'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        minimum: REdgeInsets.all(Sizes.p20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                labelText: 'Target Name',
                controller: nameController,
                icon: Icons.edit,
                validator: (value) =>
                    value == '' ? 'Please enter a target name' : null,
              ),
              Gap.h20,
              CustomCategoryPicker(changeCategory: getCategory),
              Gap.h20,
              CustomTextField(
                labelText: 'Weight (Kg)',
                controller: weightController,
                type: TextInputType.number,
                icon: Icons.monitor_weight,
                validator: (value) =>
                    value == '' ? 'Please enter weight' : null,
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
