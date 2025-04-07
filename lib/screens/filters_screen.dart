import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:affynity/theme/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  final Set<String> _selectedCategories = {};
  RangeValues _followerRange = const RangeValues(0, 100);
  final _locationController = TextEditingController();
  bool _isRemoteOnly = false;

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  String _formatFollowerCount(double value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(0)}K';
    }
    return value.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: Theme.of(context).textTheme.titleLarge,
            ).animate().fadeIn(delay: 100.ms),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'Beauty',
                'Fashion',
                'Lifestyle',
                'Tech',
                'Food',
                'Travel',
                'Fitness',
                'Gaming',
                'Art',
                'Music',
                'Education',
                'Business',
              ].map((category) => FilterChip(
                label: Text(category),
                selected: _selectedCategories.contains(category),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedCategories.add(category);
                    } else {
                      _selectedCategories.remove(category);
                    }
                  });
                },
                backgroundColor: AffynityTheme.porcelain,
                selectedColor: AffynityTheme.lilac,
                checkmarkColor: AffynityTheme.blush,
              )).toList(),
            ).animate().fadeIn(delay: 200.ms),

            const SizedBox(height: 32),
            Text(
              'Location',
              style: Theme.of(context).textTheme.titleLarge,
            ).animate().fadeIn(delay: 300.ms),
            const SizedBox(height: 16),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: 'Enter city or region',
                prefixIcon: const Icon(Icons.location_on_outlined),
                suffixIcon: _locationController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => setState(() => _locationController.clear()),
                    )
                  : null,
              ),
            ).animate().fadeIn(delay: 400.ms),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text('Remote Only'),
              value: _isRemoteOnly,
              onChanged: (value) => setState(() => _isRemoteOnly = value),
              activeColor: AffynityTheme.blush,
            ).animate().fadeIn(delay: 500.ms),

            const SizedBox(height: 32),
            Text(
              'Follower Range',
              style: Theme.of(context).textTheme.titleLarge,
            ).animate().fadeIn(delay: 600.ms),
            const SizedBox(height: 16),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${_formatFollowerCount(_followerRange.start)}'),
                    Text('${_formatFollowerCount(_followerRange.end)}K+'),
                  ],
                ),
                RangeSlider(
                  values: _followerRange,
                  min: 0,
                  max: 100,
                  divisions: 20,
                  activeColor: AffynityTheme.blush,
                  inactiveColor: AffynityTheme.stone,
                  labels: RangeLabels(
                    '${_formatFollowerCount(_followerRange.start)}',
                    '${_formatFollowerCount(_followerRange.end)}K+',
                  ),
                  onChanged: (values) => setState(() => _followerRange = values),
                ),
              ],
            ).animate().fadeIn(delay: 700.ms),

            const SizedBox(height: 48),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _selectedCategories.clear();
                        _followerRange = const RangeValues(0, 100);
                        _locationController.clear();
                        _isRemoteOnly = false;
                      });
                    },
                    child: const Text('Reset All'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.go('/home'),
                    child: const Text('Apply Filters'),
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 800.ms),
          ],
        ),
      ),
    );
  }
}