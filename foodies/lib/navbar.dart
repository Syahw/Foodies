import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodies/pages/cart_screen.dart';
import 'package:foodies/pages/dashboard_screen.dart';
import 'package:foodies/pages/menu_screen.dart';
import 'package:foodies/pages/profile_screen.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      backgroundColor: Colors.grey.shade200,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 50,
      navBarStyle: NavBarStyle.style9,
    );
  }

  List<Widget> _buildScreens() {
    return [
      const DashboardScreen(),
      const MenuScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: const Color.fromARGB(255, 39, 180, 112),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(LucideIcons.clipboardCheck),
        title: ("Menu"),
        activeColorPrimary: const Color.fromARGB(255, 39, 180, 112),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(LucideIcons.shoppingCart),
        title: ("Cart"),
        activeColorPrimary: const Color.fromARGB(255, 39, 180, 112),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(LucideIcons.user),
        title: ("Profile"),
        activeColorPrimary: const Color.fromARGB(255, 39, 180, 112),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
