import 'package:coffe_shop/features/presentation/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../pages/home_page.dart';


class PersistenBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        navBarBuilder:(navBarConfig) => Style9BottomNavBar(
          navBarConfig: navBarConfig,
        ),
        tabs: [
          PersistentTabConfig(
            screen: const HomePage(),
            item: ItemConfig(
              activeForegroundColor: Color(0xFFC67C4E),
              icon: Icon(Icons.home),
              title: "_",
            ),
          ),
          PersistentTabConfig(
            screen:  Text(""),
            item: ItemConfig(
              activeForegroundColor: Color(0xFFC67C4E),
              icon: Icon(Icons.monitor_heart_outlined),
              title: "_",
            ),
          ),
          PersistentTabConfig(
            screen: Text(""),
            item: ItemConfig(
              activeForegroundColor: Color(0xFFC67C4E),
              icon: Icon(Icons.shopping_bag_outlined),
              title: "_",
            ),
          ),
          PersistentTabConfig(
            screen: Text(""),
            item: ItemConfig(
              activeForegroundColor: Color(0xFFC67C4E),
              icon: Icon(Icons.notifications_active_outlined),
              title: "_",
            ),
          ),
        ],
      ),
    );
  }
}