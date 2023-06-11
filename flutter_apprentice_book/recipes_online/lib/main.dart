import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:logging/logging.dart';
import 'ui/main_screen.dart';
import 'package:provider/provider.dart';
import 'data/drift/drift_repository.dart';
import 'data/repository.dart';
import 'network/recipe_service.dart';
import 'network/service_interface.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;
  final repository = DriftRepository();
  await repository.init();
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final Repository repository;
  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Repository>(
          lazy: false,
          create: (_) => repository,
          dispose: (_, Repository repository) => repository.close(),
        ),
        Provider<ServiceInterface>(
          create: (_) => RecipeService.create(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Recipes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainScreen(),
      ),
    );
  }

  void _setupLogging() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) {
      log('${rec.level.name}: ${rec.time}: ${rec.message}');
    });
  }
}
