import 'package:animations/animations.dart';
import 'package:business/core/res/colours.dart';
import 'package:business/presentation/blocs/main/cubit/main_cubit.dart';
import 'package:business/presentation/pages/business/business_page.dart';
import 'package:business/presentation/pages/marketing/marketing_page.dart';
import 'package:business/presentation/pages/product/product_page.dart';
import 'package:business/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> logout() async {
    await showModal<AlertDialog>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Logout'),
        surfaceTintColor: Colours.whiteColor,
        content: const Text(' are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => context.read<MainCubit>().logOut(),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          if (state is MainLoggedOut) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<SplashPage>(
                builder: (_) => const SplashPage(),
              ),
            );
          }
        },
        builder: (_, __) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('TargetTrackPro'),
              centerTitle: false,
              leadingWidth: 0,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colours.whiteColor,
                  ),
                  onPressed: logout,
                ),
              ],
              bottom: TabBar(
                tabs: const [
                  Tab(text: 'Product'),
                  Tab(text: 'Business'),
                  Tab(text: 'Marketing'),
                ],
                unselectedLabelColor: Colours.whiteColor.withOpacity(0.6),
                labelColor: Colours.whiteColor,
              ),
            ),
            body: const TabBarView(
              children: [
                ProductPage(),
                BusinessPage(),
                MarketingPage(),
              ],
            ),
          );
        },
      ),
    );
  }
}
