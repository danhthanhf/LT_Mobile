class AuthRequest {
  String _lastName;
  String _firstName;
  String _email;
  String _password;

  // Constructor
  AuthRequest({
    required String lastName,
    required String firstName,
    required String email,
    required String password,
  })  : _lastName = lastName,
        _firstName = firstName,
        _email = email,
        _password = password;

  AuthRequest.init()
      : _lastName = "",
        _firstName = "",
        _email = "",
        _password = "";

  // Getters
  String get lastName => _lastName;
  String get firstName => _firstName;
  String get password => _password;
  String get email => _email;

  // Setters
  set lastName(String value) => _lastName = value;
  set firstName(String value) => _firstName = value;
  set password(String value) => _password = value;
  set email(String value) => _email = value;

  factory AuthRequest.fromJson(Map<String, dynamic> json) {
    return AuthRequest(
      lastName: json['lastName'] ?? '',
      firstName: json['firstName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lastName': _lastName,
      'firstName': _firstName,
      'email': email,
      'password': _password,
    };
  }
}
