import 'package:business/core/res/colours.dart';
import 'package:business/presentation/pages/business/business_page.dart';
import 'package:business/presentation/pages/marketing/marketing_page.dart';
import 'package:business/presentation/pages/product/product_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TargetTrackPro'),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colours.whiteColor,
              ),
              onPressed: () {},
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
