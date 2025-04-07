class Creator {
  final String id;
  final String name;
  final String handle;
  final String bio;
  final List<String> tags;
  final int followers;
  final double engagementRate;
  final String location;
  final String mediaKit;
  final List<String> photos;

  Creator({
    required this.id,
    required this.name,
    required this.handle,
    required this.bio,
    required this.tags,
    required this.followers,
    required this.engagementRate,
    required this.location,
    required this.mediaKit,
    required this.photos,
  });

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      id: json['id'] as String,
      name: json['name'] as String,
      handle: json['handle'] as String,
      bio: json['bio'] as String,
      tags: List<String>.from(json['tags']),
      followers: json['followers'] as int,
      engagementRate: json['engagementRate'] as double,
      location: json['location'] as String,
      mediaKit: json['mediaKit'] as String,
      photos: List<String>.from(json['photos']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'handle': handle,
      'bio': bio,
      'tags': tags,
      'followers': followers,
      'engagementRate': engagementRate,
      'location': location,
      'mediaKit': mediaKit,
      'photos': photos,
    };
  }
}