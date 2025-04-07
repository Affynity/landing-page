import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:affynity/theme/theme.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:affynity/widgets/affynity_logo.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _isCreator = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AffynityTheme.ivory,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AffynityLogo(size: 48).animate().fadeIn().scale(),
              const SizedBox(height: 48),
              Text(
                'Welcome to Affynity',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 200.ms),
              const SizedBox(height: 16),
              Text(
                'Choose how you want to join',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AffynityTheme.graphite,
                    ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 300.ms),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AffynityTheme.porcelain,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isCreator = true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: _isCreator
                                ? AffynityTheme.blush
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(26),
                          ),
                          child: Text(
                            'Creator',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _isCreator
                                  ? AffynityTheme.obsidian
                                  : AffynityTheme.graphite,
                              fontWeight: _isCreator
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isCreator = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: !_isCreator
                                ? AffynityTheme.blush
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(26),
                          ),
                          child: Text(
                            'Brand',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: !_isCreator
                                  ? AffynityTheme.obsidian
                                  : AffynityTheme.graphite,
                              fontWeight: !_isCreator
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 400.ms),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AffynityTheme.porcelain,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _isCreator ? 'For Creators' : 'For Brands',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isCreator
                          ? 'Connect with brands and monetize your influence'
                          : 'Find the perfect creators for your campaigns',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _isCreator
                          ? '• Discover brand campaigns\n• Showcase your content\n• Get paid for collaborations'
                          : '• Post campaign opportunities\n• Find authentic creators\n• Track campaign performance',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 500.ms),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go('/auth', extra: _isCreator),
                  child: const Text('Continue'),
                ),
              ).animate().fadeIn(delay: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}
