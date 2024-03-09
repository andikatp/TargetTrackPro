import 'package:business/core/res/theme.dart';
import 'package:business/core/services/dependency_container.dart';
import 'package:business/presentation/blocs/auth/bloc/auth_bloc.dart';
import 'package:business/presentation/blocs/business/bloc/business_bloc.dart';
import 'package:business/presentation/blocs/marketing/bloc/marketing_bloc.dart';
import 'package:business/presentation/blocs/product/bloc/product_bloc.dart';
import 'package:business/presentation/blocs/splash/cubit/splash_cubit.dart';
import 'package:business/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<SplashCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<AuthBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<ProductBloc>()..add(const GetProductTargetEvent()),
        ),
        BlocProvider(
          create: (_) =>
              sl<BusinessBloc>()..add(const GetBusinessTargetEvent()),
        ),
        BlocProvider(
          create: (_) =>
              sl<MarketingBloc>()..add(const GetMarketingTargetEvent()),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ScreenUtilInit(
          designSize: const Size(412, 732),
          minTextAdapt: true,
          builder: (_, __) => MaterialApp(
            theme: AppTheme.lightTheme,
            // darkTheme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            home: const SplashPage(),
          ),
        ),
      ),
    );
  }
}
