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
    routes: [],
  );
}
