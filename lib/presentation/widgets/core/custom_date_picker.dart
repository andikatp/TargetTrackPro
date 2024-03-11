import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/res/colours.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    required this.changeDateRange,
    this.target,
    super.key,
  });

  final void Function(DateTime? startDate, DateTime? endDate) changeDateRange;
  final Target? target;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? startDate;
  DateTime? endDate;

  Future<void> showDatePicker() async {
    showCustomDateRangePicker(
      context,
      dismissible: true,
      minimumDate: DateTime.now(),
      maximumDate: DateTime.now().add(const Duration(days: 30)),
      startDate: startDate,
      endDate: endDate,
      backgroundColor: Colors.white,
      primaryColor: Colours.redColor,
      onApplyClick: (start, end) {
        setState(() {
          endDate = end;
          startDate = start;
        });
        widget.changeDateRange(startDate, endDate);
      },
      onCancelClick: () {
        setState(() {
          endDate = null;
          startDate = null;
        });
        widget.changeDateRange(startDate, endDate);
      },
    );
  }

  @override
  void initState() {
    startDate = widget.target?.startDate;
    endDate = widget.target?.endDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Date Range'),
        Gap.h20,
        SizedBox(
          width: 1.sw,
          child: OutlinedButton(
            onPressed: showDatePicker,
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colours.redColor),
            ),
            child: Text(
              startDate == null
                  ? 'Select Date Range'
                  : '${DateFormat('EEE, MMM d - ', 'en_US').format(startDate!)}'
                      '${DateFormat('EEE, MMM d', 'en_US').format(endDate!)}',
            ),
          ),
        ),
      ],
    );
  }
}
