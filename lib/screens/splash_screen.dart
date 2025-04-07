import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:affynity/widgets/affynity_logo.dart';
import 'package:affynity/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      setState(() => _showContent = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AffynityTheme.ivory,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Initial centered logo
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              top: _showContent
                  ? 100
                  : MediaQuery.of(context).size.height / 2 - 120,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const AffynityLogo(size: 64)
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .scale(),
                  const SizedBox(height: 16),
                  Text(
                    'Where creators and brands connect',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AffynityTheme.graphite,
                        ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(delay: 200.ms, duration: 600.ms),
                ],
              ),
            ),

            // Buttons
            if (_showContent)
              Positioned(
                bottom: 48,
                left: 24,
                right: 24,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => context.go('/login'),
                        child: const Text('Log In'),
                      ),
                    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => context.go('/onboarding'),
                        child: const Text('Create Account'),
                      ),
                    ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
