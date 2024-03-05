import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_template/provider/theme_provider/theme_provider.dart';
import 'package:my_template/router/routes.dart';
import 'package:my_template/theme/color_scheme.dart';
import 'package:my_template/utils/extentions.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      themeMode: ref.watch(themeStateProvider),
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: GoogleFonts.aboretoTextTheme(context.textTheme).apply(
            bodyColor: context.theme.colorScheme.inverseSurface,
            displayColor: context.theme.colorScheme.inverseSurface),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.aboretoTextTheme(context.textTheme).apply(
            bodyColor: context.theme.colorScheme.surface,
            displayColor: context.theme.colorScheme.surface),
      ),
    );
  }
}
