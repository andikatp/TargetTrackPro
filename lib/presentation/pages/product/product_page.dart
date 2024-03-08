import 'package:business/presentation/blocs/product/bloc/product_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductTargetsError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is ProductTargetsError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is ProductTargetsLoaded) {
            final targets = state.targets;
            return targets.isEmpty
                ? const Center(
                    child: Text('empty'),
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
    );
  }
}
