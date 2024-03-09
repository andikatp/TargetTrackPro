import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/utils/enums.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:business/presentation/widgets/custom_category_picker.dart';
import 'package:business/presentation/widgets/custom_date_picker.dart';
import 'package:business/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditTargetPage extends StatefulWidget {
  const EditTargetPage({
    required this.editTarget,
    required this.target,
    super.key,
  });

  final void Function(Target target) editTarget;

  final Target target;

  @override
  State<EditTargetPage> createState() => _EditTargetPageState();
}

class _EditTargetPageState extends State<EditTargetPage> {
  late GlobalKey<FormState> formKey;
  late TextEditingController nameController;
  late TextEditingController weightController;
  late Category category;
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController()..text = widget.target.name;
    weightController = TextEditingController()
      ..text = widget.target.weight.toString();
    category = widget.target.category;
    startDate = widget.target.startDate;
    endDate = widget.target.endDate;
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
            final updatedTarget = widget.target.copyWith(
              name: nameController.text.trim(),
              category: category,
              weight: int.parse(weightController.text.trim()),
              startDate: startDate,
              endDate: endDate,
            );
            widget.editTarget(updatedTarget);
            Navigator.pop(context);
          }
        },
        style: ElevatedButton.styleFrom(
          shape: const BeveledRectangleBorder(),
          minimumSize: const Size.fromHeight(Sizes.p64),
        ),
        child: const Text('Edit Target'),
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
              CustomCategoryPicker(
                changeCategory: getCategory,
                target: widget.target,
              ),
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
              CustomDatePicker(
                changeDateRange: getDate,
                target: widget.target,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
