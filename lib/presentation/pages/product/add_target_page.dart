import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/utils/enums.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:business/presentation/blocs/product/bloc/product_bloc.dart';
import 'package:business/presentation/widgets/custom_category_picker.dart';
import 'package:business/presentation/widgets/custom_date_picker.dart';
import 'package:business/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

class AddTargetPage extends StatelessWidget {
  const AddTargetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final weightController = TextEditingController();
    var category = Category.quantitative;
    DateTime? startDate;
    DateTime? endDate;

    void getDate(DateTime? startDateFromWidget, DateTime? endDateFromWidget) {
      startDate = startDateFromWidget;
      endDate = endDateFromWidget;
    }

    void getCategory(Category? categoryFromWidget) =>
        category = categoryFromWidget!;

    void addTarget() {
      if (formKey.currentState!.validate()) {
        final target = Target(
          id: const Uuid().v4(),
          name: nameController.text.trim(),
          category: category,
          weight: int.parse(weightController.text.trim()),
          status: Status.toDo,
          type: TargetType.product,
          startDate: startDate!,
          endDate: endDate!,
        );
        context.read<ProductBloc>().add(SaveProductTargetEvent(target: target));
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: addTarget,
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
                labelText: 'Weight',
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
