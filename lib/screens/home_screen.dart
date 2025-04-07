import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:affynity/theme/theme.dart';
import 'package:affynity/widgets/swipe_card.dart';
import 'package:affynity/widgets/bottom_nav.dart';
import 'package:affynity/widgets/match_overlay.dart';
import 'package:affynity/providers/auth_provider.dart';
import 'package:affynity/models/user.dart';
import 'package:swipable_stack/swipable_stack.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final SwipableStackController _controller;
  final List<Map<String, String>> _matches = [
    {
      'name': 'Luna Rivera',
      'image': 'https://picsum.photos/400/600?random=1',
      'handle': '@GlowWithLuna',
    },
    {
      'name': 'Ritual Beauty',
      'image': 'https://picsum.photos/400/600?random=2',
      'handle': '@RitualBeauty',
    },
    {
      'name': 'Sage Cosmetics',
      'image': 'https://picsum.photos/400/600?random=3',
      'handle': '@SageCosmetics',
    },
    {
      'name': 'Pure Botanicals',
      'image': 'https://picsum.photos/400/600?random=4',
      'handle': '@PureBotanicals',
    },
  ];

  int? _currentMatchIndex;
  bool _isProcessingMatch = false;

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleSwipe(int index, SwipeDirection direction) async {
    if (_isProcessingMatch) return;

    if (direction == SwipeDirection.right) {
      // Simulate a 40% match rate
      if (index % 3 == 0 || index % 5 == 0) {
        setState(() {
          _isProcessingMatch = true;
          _currentMatchIndex = index % _matches.length;
        });

        // Add a small delay to ensure smooth animation
        await Future.delayed(const Duration(milliseconds: 300));
      }
    }
  }

  void _handleMatchClose() {
    setState(() {
      _currentMatchIndex = null;
      _isProcessingMatch = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          user?.type == UserType.creator
              ? 'Discover Campaigns'
              : 'Find Creators',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authProvider.notifier).signOut(),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SwipableStack(
                    controller: _controller,
                    onSwipeCompleted: _handleSwipe,
                    overlayBuilder: (context, properties) {
                      final swipeProgress = properties.swipeProgress;
                      final opacity =
                          swipeProgress <= 1.0 ? swipeProgress : 1.0;
                      return Opacity(
                        opacity: opacity,
                        child: properties.direction == SwipeDirection.right
                            ? _buildOverlay(AffynityTheme.sage, 'LIKE')
                            : _buildOverlay(AffynityTheme.blush, 'NOPE'),
                      );
                    },
                    builder: (context, properties) {
                      final rotationAngle = properties.swipeProgress * 0.5;
                      final scale =
                          1.0 - (0.1 * properties.swipeProgress.abs());

                      return SwipeCard(
                        index: properties.index,
                        userType: user?.type ?? UserType.creator,
                        rotationAngle: rotationAngle,
                        scale: scale,
                        onLike: () => _controller.next(
                            swipeDirection: SwipeDirection.right),
                        onDislike: () => _controller.next(
                            swipeDirection: SwipeDirection.left),
                      );
                    },
                  ),
                ),
                const AffynityBottomNav(),
              ],
            ),
            if (_currentMatchIndex != null)
              MatchOverlay(
                name: _matches[_currentMatchIndex!]['name']!,
                image: _matches[_currentMatchIndex!]['image']!,
                onClose: _handleMatchClose,
                onMessage: () {
                  _handleMatchClose();
                  // TODO: Navigate to chat
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverlay(Color color, String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
