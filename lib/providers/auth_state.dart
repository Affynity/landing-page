import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:affynity/providers/auth_provider.dart';
import 'package:affynity/screens/splash_screen.dart';
import 'package:affynity/screens/onboarding_screen.dart';
import 'package:affynity/screens/auth_screen.dart';
import 'package:affynity/screens/login_screen.dart';
import 'package:affynity/screens/home_screen.dart';
import 'package:affynity/screens/profile_screen.dart';
import 'package:affynity/screens/matches_screen.dart';
import 'package:affynity/screens/filters_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);
  return GoRouter(
    refreshListenable: router,
    redirect: router._redirect,
    routes: router._routes,
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(
      authProvider,
      (_, __) => notifyListeners(),
    );
  }

  String? _redirect(BuildContext context, GoRouterState state) {
    final user = _ref.read(authProvider);
    final isAuth = user != null;

    final isSplash = state.matchedLocation == '/';
    final isOnboarding = state.matchedLocation == '/onboarding';
    final isAuthFlow =
        state.matchedLocation == '/auth' || state.matchedLocation == '/login';

    if (!isAuth && !isSplash && !isOnboarding && !isAuthFlow) {
      return '/';
    }

    if (isAuth && (isSplash || isOnboarding || isAuthFlow)) {
      return '/home';
    }

    return null;
  }

  List<RouteBase> get _routes => [
        GoRoute(
          path: '/',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/onboarding',
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/auth',
          builder: (context, state) {
            final isCreator = state.extra as bool? ?? true;
            return AuthScreen(isCreator: isCreator);
          },
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/matches',
          builder: (context, state) => const MatchesScreen(),
        ),
        GoRoute(
          path: '/filters',
          builder: (context, state) => const FiltersScreen(),
        ),
      ];
}
