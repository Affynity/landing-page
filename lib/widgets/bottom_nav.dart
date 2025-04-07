import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:affynity/theme/theme.dart';
import 'package:affynity/providers/auth_provider.dart';
import 'package:affynity/models/user.dart';

class AffynityBottomNav extends ConsumerWidget {
  const AffynityBottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    final currentRoute = GoRouterState.of(context).matchedLocation;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AffynityTheme.porcelain,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(
            icon: Icons.home,
            label: 'Home',
            isSelected: currentRoute == '/home',
            onTap: () => context.go('/home'),
          ),
          if (user?.type == UserType.brand)
            _NavItem(
              icon: Icons.tune,
              label: 'Filters',
              isSelected: currentRoute == '/filters',
              onTap: () => context.go('/filters'),
            ),
          _NavItem(
            icon: Icons.favorite,
            label: 'Matches',
            isSelected: currentRoute == '/matches',
            onTap: () => context.go('/matches'),
          ),
          _NavItem(
            icon: Icons.person,
            label: 'Profile',
            isSelected: currentRoute == '/profile',
            onTap: () => context.go('/profile'),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AffynityTheme.blush : AffynityTheme.graphite,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AffynityTheme.blush : AffynityTheme.graphite,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
