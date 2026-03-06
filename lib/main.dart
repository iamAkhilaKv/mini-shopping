import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'Core/Theme/app_theme.dart';
import 'Core/router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
        routerConfig: router
    );
  }
}

