import 'package:business/core/extensions/extension.dart';
import 'package:business/core/res/colours.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TargetTile extends StatelessWidget {
  const TargetTile({
    required this.target,
    super.key,
  });

  final Target target;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colours.whiteColor,
      elevation: 0,
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
          TextButton(
            onPressed: () {},
            child: Text(
              target.status.name
                  .split('')
                  .map(
                    (element) => element == element.toUpperCase()
                        ? ' $element'
                        : element,
                  )
                  .join(),
            ),
          ),
        ],
      ),
    );
  }
}
