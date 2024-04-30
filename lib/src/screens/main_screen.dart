import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarItems,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index,
            initialLocation: index == navigationShell.currentIndex),
      ),
    );
  }

  List<BottomNavigationBarItem> get _bottomNavBarItems => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.folder_open),
          label: 'Characters',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          label: 'About'
        ),
      ];
}
