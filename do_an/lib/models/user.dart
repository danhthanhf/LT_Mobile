class User {
  final String email;
  final String phone;
  final String name;

  User({
    required this.email,
    required this.phone,
    required this.name,
  });

  // Từ JSON sang đối tượng User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String,
      phone: json['phone'] as String,
      name: json['name'] as String,
    );
  }

  // Từ đối tượng User sang JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
    };
  }
}
