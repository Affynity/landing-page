import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:affynity/providers/auth_state.dart';
import 'package:affynity/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: AffynityApp()));
}

class AffynityApp extends ConsumerWidget {
  const AffynityApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Affynity',
      theme: AffynityTheme.lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
