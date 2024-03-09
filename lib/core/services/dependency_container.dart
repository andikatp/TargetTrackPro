import 'package:business/data/datasource/auth/auth_local_data_source.dart';
import 'package:business/data/datasource/core/app_database.dart';
import 'package:business/data/repositories/auth/auth_repository.dart';
import 'package:business/data/repositories/business/business_repositories_impl.dart';
import 'package:business/data/repositories/marketing/marketing_repositories_impl.dart';
import 'package:business/data/repositories/product/product_repositories_impl.dart';
import 'package:business/domain/repositories/auth/auth_repository.dart';
import 'package:business/domain/repositories/business/business_repositories.dart';
import 'package:business/domain/repositories/marketing/marketing_repositories.dart';
import 'package:business/domain/repositories/product/product_repositories.dart';
import 'package:business/domain/usecases/auth/login.dart';
import 'package:business/domain/usecases/auth/register.dart';
import 'package:business/domain/usecases/business/delete_business_target.dart';
import 'package:business/domain/usecases/business/edit_business_target.dart';
import 'package:business/domain/usecases/business/get_business_targets.dart';
import 'package:business/domain/usecases/business/save_business_target.dart';
import 'package:business/domain/usecases/marketing/delete_marketing_target.dart';
import 'package:business/domain/usecases/marketing/edit_marketing_target.dart';
import 'package:business/domain/usecases/marketing/get_marketing_targets.dart';
import 'package:business/domain/usecases/marketing/save_marketing_target.dart';
import 'package:business/domain/usecases/product/delete_product_target.dart';
import 'package:business/domain/usecases/product/edit_product_target.dart';
import 'package:business/domain/usecases/product/get_product_targets.dart';
import 'package:business/domain/usecases/product/save_product_target.dart';
import 'package:business/presentation/blocs/auth/bloc/auth_bloc.dart';
import 'package:business/presentation/blocs/business/bloc/business_bloc.dart';
import 'package:business/presentation/blocs/marketing/bloc/marketing_bloc.dart';
import 'package:business/presentation/blocs/product/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dependency_container.main.dart';
