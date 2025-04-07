import 'package:flutter/material.dart';
import 'package:affynity/theme/theme.dart';
import 'package:affynity/widgets/bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage('https://picsum.photos/100'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Luna Rivera',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '@GlowWithLuna',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AffynityTheme.graphite,
                          ),
                    ),
                    const SizedBox(height: 24),
                    const Text('Bio'),
                    TextFormField(
                      initialValue: 'Clean beauty. Clean vibes.',
                      maxLines: 3,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Tags'),
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
                                onDeleted: () {},
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            const AffynityBottomNav(),
          ],
        ),
      ),
    );
  }
}
