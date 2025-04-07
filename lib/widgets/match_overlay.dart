import 'package:flutter/material.dart';
import 'package:affynity/theme/theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MatchOverlay extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onClose;
  final VoidCallback onMessage;

  const MatchOverlay({
    super.key,
    required this.name,
    required this.image,
    required this.onClose,
    required this.onMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black87,
      child: Stack(
        children: [
          // Background blur and gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'It\'s a Match!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ).animate()
                .fadeIn()
                .scale(),
              const SizedBox(height: 24),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AffynityTheme.blush,
                    width: 4,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ).animate()
                .fadeIn(delay: 200.ms)
                .scale(),
              const SizedBox(height: 16),
              Text(
                'You matched with $name',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ).animate()
                .fadeIn(delay: 400.ms),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: onMessage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AffynityTheme.blush,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text('Send Message'),
                  ).animate()
                    .fadeIn(delay: 600.ms)
                    .slideX(begin: -0.2),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: onClose,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text('Keep Swiping'),
                  ).animate()
                    .fadeIn(delay: 600.ms)
                    .slideX(begin: 0.2),
                ],
              ),
            ],
          ),
          
          // Close button
          Positioned(
            top: 48,
            right: 24,
            child: IconButton(
              icon: const Icon(Icons.close),
              color: Colors.white,
              onPressed: onClose,
            ),
          ),
        ],
      ),
    );
  }
}