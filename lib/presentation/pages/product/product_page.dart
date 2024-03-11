import 'package:animations/animations.dart';
import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/extensions/extension.dart';
import 'package:business/core/res/colours.dart';
import 'package:business/core/utils/enums.dart';
import 'package:business/domain/entities/core/target.dart';
import 'package:business/presentation/blocs/product/bloc/product_bloc.dart';
import 'package:business/presentation/pages/core/add_target_page.dart';
import 'package:business/presentation/pages/core/edit_target_page.dart';
import 'package:business/presentation/widgets/target_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Key listViewKey = UniqueKey();

    void addTarget({
      required String name,
      required Category category,
      required int weight,
      required DateTime? startDate,
      required DateTime? endDate,
    }) {
      final target = Target(
        id: const Uuid().v4(),
        name: name,
        category: category,
        weight: weight,
        status: Status.toDo,
        type: TargetType.product,
        startDate: startDate!,
        endDate: endDate!,
      );
      context.read<ProductBloc>().add(SaveProductTargetEvent(target: target));
    }

    void editProduct(Target target) =>
        context.read<ProductBloc>().add(EditProductTargetEvent(target: target));

    void deleteProductTarget(Target target) => context.read<ProductBloc>().add(
          DeleteProductTargetEvent(
            target: target,
          ),
        );

    return Scaffold(
      floatingActionButton: OpenContainer(
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.p16).r,
        ),
        closedElevation: 5,
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
            switch (state.status) {
              case ProductStatus.initial:
                return const SizedBox();
              case ProductStatus.loading:
                return const CupertinoActivityIndicator();
              case ProductStatus.error:
                return Text(state.errorMessage);
              case ProductStatus.success:
                final targets = state.targets;
                return targets.isEmpty
                    ? Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: Sizes.p16.h,
                        children: [
                          Lottie.asset(
                            'assets/json/empty.json',
                            width: 0.9.sw,
                          ),
                          Text(
                            'Targets are empty, try adding them',
                            style: context.labelLarge,
                          ),
                        ],
                      )
                    : AnimationLimiter(
                        child: ListView.separated(
                          key: listViewKey,
                          itemCount: targets.length,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) =>
                              AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50,
                              child: FadeInAnimation(
                                child: SwipeActionCell(
                                  key: ObjectKey(targets[index]),
                                  trailingActions: <SwipeAction>[
                                    SwipeAction(
                                      backgroundRadius: 15,
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colours.whiteColor,
                                      ),
                                      onTap: (_) =>
                                          deleteProductTarget(targets[index]),
                                    ),
                                    SwipeAction(
                                      backgroundRadius: 15,
                                      color: Colors.orange,
                                      icon: OpenContainer(
                                        closedColor: Colors.transparent,
                                        closedElevation: 0,
                                        openBuilder: (context, action) =>
                                            EditTargetPage(
                                          editTarget: editProduct,
                                          target: targets[index],
                                        ),
                                        closedBuilder: (context, action) =>
                                            const Icon(
                                          Icons.edit,
                                          color: Colours.whiteColor,
                                        ),
                                      ),
                                      onTap: (_) {},
                                    ),
                                  ],
                                  child: TargetTile(
                                    target: targets[index],
                                    changeStatusTarget: editProduct,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
            }
          },
        ),
      ),
    );
  }
}
