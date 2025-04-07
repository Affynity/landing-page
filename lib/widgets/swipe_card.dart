import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:affynity/theme/theme.dart';
import 'package:affynity/models/user.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SwipeCard extends StatelessWidget {
  final int index;
  final UserType userType;
  final double? rotationAngle;
  final double? scale;
  final VoidCallback? onLike;
  final VoidCallback? onDislike;

  const SwipeCard({
    super.key,
    required this.index,
    required this.userType,
    this.rotationAngle,
    this.scale = 1.0,
    this.onLike,
    this.onDislike,
  });

  @override
  Widget build(BuildContext context) {
    final swipeProgress = rotationAngle != null ? rotationAngle! / 0.5 : 0.0;
    final isSwipingRight = rotationAngle != null && rotationAngle! > 0;

    // Enhanced scale animation
    final dynamicScale = scale ?? 1.0;
    final scaleAdjustment = isSwipingRight
        ? 1.0 + (swipeProgress.abs() * 0.15) // Scale up for likes
        : 1.0 - (swipeProgress.abs() * 0.15); // Scale down for dislikes
    final finalScale = dynamicScale * scaleAdjustment;

    // Calculate rotation for the inner content
    final innerRotation = (rotationAngle ?? 0) * -0.5;

    return Transform.rotate(
      angle: rotationAngle ?? 0,
      child: Transform.scale(
        scale: finalScale,
        child: Card(
          margin: const EdgeInsets.all(16),
          child: Stack(
            children: [
              // Main content with counter-rotation
              Transform.rotate(
                angle: innerRotation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: 'https://picsum.photos/400/600',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (userType == UserType.brand) ...[
                            Text(
                              'Luna Rivera',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '@GlowWithLuna',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: AffynityTheme.graphite,
                                  ),
                            ),
                          ] else ...[
                            Text(
                              'Summer Collection Launch',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Ritual Beauty',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: AffynityTheme.graphite,
                                  ),
                            ),
                          ],
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            children: [
                              'Skincare',
                              'Vegan',
                              'Wellness',
                            ]
                                .map((tag) => Chip(
                                      label: Text(tag),
                                      backgroundColor: AffynityTheme.lilac,
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Enhanced Like/Dislike Indicators with opposite animations
              if (rotationAngle != null && rotationAngle != 0)
                Positioned(
                  top: 32,
                  right: rotationAngle! > 0 ? 32 : null,
                  left: rotationAngle! < 0 ? 32 : null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: rotationAngle! > 0
                          ? AffynityTheme.sage.withOpacity(0.9)
                          : AffynityTheme.blush.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Transform.rotate(
                      angle: -rotationAngle! * 0.5,
                      child: Text(
                        rotationAngle! > 0 ? 'LIKE' : 'NOPE',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn()
                      .scale(
                        begin: isSwipingRight
                            ? const Offset(
                                0.7, 0.7) // Scale up from small for likes
                            : const Offset(
                                1.0, 1.0), // Start normal for dislikes
                        end: isSwipingRight
                            ? const Offset(1.0, 1.0) // End normal for likes
                            : const Offset(1.3, 1.3), // Scale up for dislikes
                      )
                      .slideX(
                        begin: isSwipingRight ? -0.3 : 0, // Slide in for likes
                        end: isSwipingRight ? 0 : 0.3, // Slide out for dislikes
                        curve: isSwipingRight
                            ? Curves.easeInOut // Smooth curve for likes
                            : Curves.easeIn, // Quick exit for dislikes
                      ),
                ),

              // Action Buttons with counter-rotation and unique hero tags
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Transform.rotate(
                  angle: innerRotation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: 'dislike_$index',
                        onPressed: onDislike,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          color: AffynityTheme.blush,
                        ),
                      ),
                      const SizedBox(width: 24),
                      FloatingActionButton(
                        heroTag: 'like_$index',
                        onPressed: onLike,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: AffynityTheme.sage,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
