import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:affynity/models/user.dart';

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier() : super(null);

  void signIn(String email, String name, UserType type) {
    state = User(
      id: DateTime.now().toString(), // Mock ID
      email: email,
      name: name,
      type: type,
    );
  }

  void signOut() {
    state = null;
  }

  void updateProfile({
    String? bio,
    String? location,
    List<String>? tags,
  }) {
    if (state == null) return;
    
    state = User(
      id: state!.id,
      email: state!.email,
      name: state!.name,
      type: state!.type,
      bio: bio ?? state!.bio,
      location: location ?? state!.location,
      tags: tags ?? state!.tags,
    );
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier();
});