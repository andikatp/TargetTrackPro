import 'package:animations/animations.dart';
import 'package:business/core/res/colours.dart';
import 'package:business/core/services/notification_service.dart';
import 'package:business/presentation/pages/business/business_page.dart';
import 'package:business/presentation/pages/marketing/marketing_page.dart';
import 'package:business/presentation/pages/product/product_page.dart';
import 'package:business/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> logout() async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // await sharedPreferences.remove('isLoggedIn');
    // if (context.mounted) {
    //   await Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute<dynamic>(
    //       builder: (context) => const SplashPage(),
    //     ),
    //   );
    // }
    await showModal<AlertDialog>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Logout'),
        surfaceTintColor: Colours.whiteColor,
        content: const Text(' are you sure you want to log out?'),
        actions: [
          TextButton(onPressed: () {}, child: const Text('No')),
          TextButton(
              onPressed: () {
                NotificationService.showNotification(
                    body: 'Target A', payload: '',);
              },
              child: const Text('Yes'),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
      ),
    );
  }
}
