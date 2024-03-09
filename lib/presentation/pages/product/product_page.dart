import 'package:animations/animations.dart';
import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/extensions/extension.dart';
import 'package:business/core/res/colours.dart';
import 'package:business/core/utils/enums.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:business/presentation/blocs/product/bloc/product_bloc.dart';
import 'package:business/presentation/pages/product/add_target_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  void addTarget({
    required TextEditingController nameController,
    required Category category,
    required TextEditingController weightController,
    required DateTime? startDate,
    required DateTime? endDate,
  }) {
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
    context.read<ProductBloc>()
      ..add(SaveProductTargetEvent(target: target))
      ..add(const GetProductTargetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: OpenContainer(
        useRootNavigator: true,
        closedBuilder: (_, action) => FloatingActionButton(
          onPressed: action,
          child: const Icon(Icons.add),
        ),
        openBuilder: (context, __) => AddTargetPage(
          addTarget: addTarget,
        ),
      ),
      body: Center(
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state.status == ProductStatus.error) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            if (state.status == ProductStatus.loading) {
              return const CupertinoActivityIndicator();
            }
            if (state.status == ProductStatus.error) {
              return Text(state.errorMessage);
            }
            if (state.status == ProductStatus.success) {
              final targets = state.targets;
              return targets.isEmpty
                  ? Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: Sizes.p16.h,
                      children: [
                        Lottie.asset('assets/json/empty.json', width: 0.9.sw),
                        Text(
                          'Targets are empty, try adding them',
                          style: context.labelLarge,
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: targets.length,
                      itemBuilder: (context, index) => SwipeActionCell(
                        key: ObjectKey(targets[index]),
                        trailingActions: <SwipeAction>[
                          SwipeAction(
                            icon: const Icon(
                              Icons.edit,
                              color: Colours.whiteColor,
                            ),
                            onTap: (value) {},
                          ),
                          SwipeAction(
                            icon: const Icon(
                              Icons.delete,
                              color: Colours.whiteColor,
                            ),
                            onTap: (value) {
                              context.read<ProductBloc>()
                                ..add(
                                  DeleteProductTargetEvent(
                                    target: targets[index],
                                  ),
                                )
                                ..add(const GetProductTargetEvent());
                            },
                          ),
                        ],
                        child: Material(
                          child: Card(
                            child: Text(targets[index].name),
                          ),
                        ),
                      ),
                    );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
