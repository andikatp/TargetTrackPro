import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/extensions/extension.dart';
import 'package:business/core/res/colours.dart';
import 'package:business/core/utils/enums.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TargetTile extends StatelessWidget {
  const TargetTile({
    required this.target,
    required this.changeStatusTarget,
    super.key,
  });

  final Target target;
  final void Function(Target target) changeStatusTarget;

  @override
  Widget build(BuildContext context) {
    void changeStatus(Status? status) {
      final targetChange = target.copyWith(status: status);
      changeStatusTarget(targetChange);
    }

    return Card(
      color: Colours.whiteColor,
      elevation: 0,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: Sizes.p20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${target.name} (${target.weight} Kg)',
                  style: context.labelLarge,
                ),
                Text(
                  target.category.name,
                  style: context.labelMedium,
                ),
                Text(
                  'until '
                  '${DateFormat('d MMM', 'en_US').format(target.endDate)}',
                  style: context.labelSmall.copyWith(color: Colors.red),
                ),
              ],
            ),
            DropdownButton2<Status>(
              value: target.status,
              customButton: Text(
                target.status.name,
                style: const TextStyle(color: Colors.red),
              ),
              dropdownStyleData: const DropdownStyleData(width: 160),
              style: context.titleSmall,
              items: Status.values
                  .map(
                    (status) => DropdownMenuItem<Status>(
                      value: status,
                      child: Text(status.name),
                    ),
                  )
                  .toList(),
              onChanged: changeStatus,
            ),
          ],
        ),
      ),
    );
  }
}
