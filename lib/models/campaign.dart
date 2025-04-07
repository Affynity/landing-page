class Campaign {
  final String id;
  final String brandName;
  final String campaignName;
  final String budget;
  final String goal;
  final List<String> tags;
  final String location;
  final String sampleImage;

  Campaign({
    required this.id,
    required this.brandName,
    required this.campaignName,
    required this.budget,
    required this.goal,
    required this.tags,
    required this.location,
    required this.sampleImage,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      id: json['id'] as String,
      brandName: json['brandName'] as String,
      campaignName: json['campaignName'] as String,
      budget: json['budget'] as String,
      goal: json['goal'] as String,
      tags: List<String>.from(json['tags']),
      location: json['location'] as String,
      sampleImage: json['sampleImage'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brandName': brandName,
      'campaignName': campaignName,
      'budget': budget,
      'goal': goal,
      'tags': tags,
      'location': location,
      'sampleImage': sampleImage,
    };
  }
}