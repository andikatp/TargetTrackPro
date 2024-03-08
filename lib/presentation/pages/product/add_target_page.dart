import 'package:business/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTargetPage extends StatelessWidget {
  const AddTargetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        minimum: REdgeInsets.all(Sizes.p12),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             TextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
