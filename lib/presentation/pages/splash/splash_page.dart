import 'package:business/core/extensions/extension.dart';
import 'package:business/core/res/colours.dart';
import 'package:business/presentation/blocs/splash/cubit/splash_cubit.dart';
import 'package:business/presentation/pages/auth/login_page.dart';
import 'package:business/presentation/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 3)).then(
      (_) async => context.read<SplashCubit>().checkUserLoggedIn(),
    );

    return Scaffold(
      backgroundColor: Colours.redColor,
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashUserChecked) {
            state.isUserLoggedIn
                ? Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (context) => const MainPage(),
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (context) => const LoginPage(),
                    ),
                  );
          }
        },
        builder: (context, _) {
          return Center(
            child: Text(
              'TargetTrackPro',
              style: context.headlineSmall.copyWith(
                fontWeight: FontWeight.w900,
                color: Colours.whiteColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
