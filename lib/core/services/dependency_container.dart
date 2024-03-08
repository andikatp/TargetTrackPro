import 'package:business/data/datasource/app_database.dart';
import 'package:business/data/repositories/product/product_repositories_impl.dart';
import 'package:business/domain/repositories/product/product_repositories.dart';
import 'package:business/domain/usecases/product/delete_product_target.dart';
import 'package:business/domain/usecases/product/edit_product_target.dart';
import 'package:business/domain/usecases/product/get_product_targets.dart';
import 'package:business/domain/usecases/product/save_product_target.dart';
import 'package:business/presentation/blocs/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

part 'dependency_container.main.dart';
