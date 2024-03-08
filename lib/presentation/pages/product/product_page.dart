import 'package:animations/animations.dart';
import 'package:business/core/constants/app_sizes.dart';
import 'package:business/core/extensions/extension.dart';
import 'package:business/core/res/colours.dart';
import 'package:business/presentation/blocs/product/bloc/product_bloc.dart';
import 'package:business/presentation/pages/product/add_target_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: OpenContainer(
        openShape: const CircleBorder(),
        closedBuilder: (context, action) => FloatingActionButton(
          onPressed: action,
          child: const Icon(Icons.add),
        ),
        openBuilder: (context, action) => const AddTargetPage(),
      ),
      body: Center(
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductTargetsError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is ProductLoading) {
              return const CupertinoActivityIndicator();
            }
            if (state is ProductTargetsError) {
              return Text(state.message);
            }
            if (state is ProductTargetsLoaded) {
              final targets = state.targets;
              return targets.isEmpty
                  ? Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: Sizes.p16.h,
                      children: [
                        Lottie.asset('assets/json/empty.json', width: 0.9.sw),
                        Text('Targets are empty, try adding them',
                            style: context.labelMedium,),
                      ],
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) => const ListTile(),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: targets.length,
                    );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
