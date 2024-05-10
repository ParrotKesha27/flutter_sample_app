import 'package:flutter_sample_app/src/screens/about_screen.dart';
import 'package:flutter_sample_app/src/screens/characters/characters_screen.dart';
import 'package:flutter_sample_app/src/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/characters', routes: [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) =>
        MainScreen(navigationShell: navigationShell),
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
              path: '/characters',
              builder: (context, state) => const CharactersScreen()),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/about',
            builder: (context, state) => const AboutScreen(),
          ),
        ],
      ),
    ],
  ),
]);
