import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_nih/core/domain/entities/media.dart';
import 'package:movie_nih/core/resources/app_router.dart';
import 'package:movie_nih/core/resources/app_strings.dart';
import 'package:movie_nih/core/resources/app_theme.dart';
import 'package:movie_nih/core/services/service_locator.dart';
import 'package:movie_nih/watchlist/presentation/controllers/watchlist_bloc/watchlist_bloc.dart';

/// The main entry point of the application.
///
/// Initializes Hive for local storage, sets up the service locator,
/// and runs the application wrapped in a [BlocProvider] for [WatchlistBloc].
void main() async {
  // Initialize Hive for Flutter
  await Hive.initFlutter();

  // Register the MediaAdapter with Hive
  Hive.registerAdapter(MediaAdapter());

  // Open a Hive box named 'items'
  await Hive.openBox('items');

  // Initialize the service locator for dependency injection
  ServiceLocator.init();

  // Run the application with [MyApp] as the root widget
  runApp(
    BlocProvider(
      create: (context) => sl<WatchlistBloc>(),
      child: const MyApp(),
    ),
  );
}

/// The root widget of the application.
///
/// This widget is wrapped in a [MaterialApp.router] for navigation
/// and applies the application's theme and routing configuration.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      title: AppStrings.appTitle, // Set the application's title
      theme: getApplicationTheme(), // Apply the application's theme
      routerConfig: AppRouter().router, // Configure routing using GoRouter
    );
  }
}
