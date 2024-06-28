import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_app/screen/onboarding_page.dart';
import 'package:gemini_app/theme/theme_notifier.dart';
import 'package:gemini_app/theme/themes.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch<ThemeMode>(themeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: themeMode,
      home: const OnboardingPage(),
    );
  }
}
