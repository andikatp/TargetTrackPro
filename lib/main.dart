import 'package:business/core/res/theme.dart';
import 'package:business/core/services/app_routes.dart';
import 'package:business/core/services/dependency_container.dart';
import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenUtilInit(
        designSize: const Size(412, 732),
        minTextAdapt: true,
        builder: (_, __) => MaterialApp(
          theme: AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          routes: getAppRoutes(),
        ),
      ),
    );
  }
}
