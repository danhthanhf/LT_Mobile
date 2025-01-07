class Mentor {
  final String id;
  final String firstName;
  final String avatarUrl;

  Mentor({
    required this.id,
    required this.firstName,
    required this.avatarUrl,
  });

  factory Mentor.fromJson(Map<String, dynamic> json) => Mentor(
    id: json['id'],
    firstName: json['firstName'],
    avatarUrl: json['avatarUrl'] ?? '',
  );
}