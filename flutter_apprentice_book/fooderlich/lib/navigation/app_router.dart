import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter {
  final AppStateManager appStateManager;
  final ProfileManager profileManager;
  final GroceryManager groceryManager;
  AppRouter(this.appStateManager, this.profileManager, this.groceryManager);

  late final router = GoRouter(
      debugLogDiagnostics: true, // TODO: this should be removed in production
      refreshListenable: appStateManager,
      initialLocation: '/login',
      routes: [
        GoRoute(
            name: 'home',
            path: '/:tab',
            builder: (context, state) {
              final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
              return Home(key: state.pageKey, currentTab: tab);
            }),
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: (context, state) => const OnboardingScreen(),
        ),
      ],
      errorPageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: Center(
              child: Text(
                state.error.toString(),
              ),
            ),
          ),
        );
      },
      redirect: (state) {
        final loggedIn = appStateManager.isLoggedIn;
        final loggingIn = state.subloc == '/login';
        if (!loggedIn) {
          return loggingIn ? null : '/login';
        }

        final isOnBoardingComplete = appStateManager.isOnboardingComplete;
        final onboarding = state.subloc == '/onboarding';
        if (!isOnBoardingComplete) {
          return onboarding ? null : '/onboarding';
        }

        if (loggingIn || onboarding) return '/${FooderlichTab.explore}';
        return null;
      });
}
