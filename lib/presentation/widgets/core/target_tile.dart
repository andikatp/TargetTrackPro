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
                SizedBox(
                  width: 0.6.sw,
                  child: Text(
                    '${target.name} (${target.weight} Kg)',
                    style: context.labelLarge.copyWith(
                      decoration: target.status.name == 'done'
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
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
            DropdownButtonHideUnderline(
              child: DropdownButton2<Status>(
                value: target.status,
                customButton: Text(
                  target.status.name.split('').map((char) {
                    if (char == target.status.name[0]) {
                      return char.toUpperCase();
                    }
                    if (char == char.toUpperCase()) {
                      return ' $char';
                    }
                    return char;
                  }).join(),
                  style: const TextStyle(color: Colors.red),
                ),
                dropdownStyleData: const DropdownStyleData(width: 160),
                style: context.titleSmall,
                items: Status.values
                    .map(
                      (status) => DropdownMenuItem<Status>(
                        value: status,
                        child: Text(
                          status.name.split('').map((char) {
                            if (char == status.name[0]) {
                              return char.toUpperCase();
                            }
                            if (char == char.toUpperCase()) {
                              return ' $char';
                            }
                            return char;
                          }).join(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: changeStatus,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
