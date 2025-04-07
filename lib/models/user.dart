import 'package:flutter/foundation.dart';

enum UserType {
  creator,
  brand,
}

class User {
  final String id;
  final String email;
  final String name;
  final UserType type;
  final String? bio;
  final String? location;
  final List<String> tags;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.type,
    this.bio,
    this.location,
    this.tags = const [],
  });
}