import 'package:flutter/material.dart';
import 'package:affynity/theme/theme.dart';
import 'package:affynity/widgets/bottom_nav.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://picsum.photos/50'),
                      ),
                      title: const Text('Ritual Skincare'),
                      subtitle: const Text('Glow Season Launch'),
                      trailing: Text(
                        '\$500',
                        style: TextStyle(
                          color: AffynityTheme.obsidian,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const AffynityBottomNav(),
          ],
        ),
      ),
    );
  }
}
