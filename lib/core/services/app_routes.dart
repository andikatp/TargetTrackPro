import 'package:business/core/services/dependency_container.dart';
import 'package:business/presentation/blocs/product/bloc/product_bloc.dart';
import 'package:business/presentation/pages/product/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/': (context) => BlocProvider(
          create: (context) =>
              sl<ProductBloc>()..add(const GetProductTargetEvent()),
          child: const ProductPage(),
        ),
  };
}
