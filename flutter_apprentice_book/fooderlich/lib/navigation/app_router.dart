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
          },
          routes: [
            GoRoute(
              name: 'item',
              path: 'item/:id',
              builder: (context, state) {
                final itemId = state.params['id'] ?? '';
                final item = groceryManager.getGroceryItem(itemId);
                return GroceryItemScreen(
                  originalItem: item,
                  onCreate: (item) {
                    groceryManager.addItem(item);
                  },
                  onUpdate: (item) {
                    groceryManager.updateItem(item);
                  },
                );
              },
            ),
            // TODO: profile subroute
          ],
        ),
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
        /*
        commented for now because it doesn't work...
        final isOnBoardingComplete = appStateManager.isOnboardingComplete;
        final onboarding = state.subloc == '/onboarding';
        if (!isOnBoardingComplete) {
          return onboarding ? null : '/onboarding';
        }
        */

        if (loggingIn || false) return '/${FooderlichTab.explore}';
        return null;
      });
}
