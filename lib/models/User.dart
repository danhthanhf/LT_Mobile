class User {
  String? _id, _firstName, _lastName, _email, _password, _token, _avatarUrl;

  User();

  User.init()
      : _id = '',
        _firstName = '',
        _lastName = '',
        _email = '',
        _password = '',
        _token = '',
        _avatarUrl = '';

  String get id => _id ?? '';
  String get firstName => _firstName ?? '';
  String get lastName => _lastName ?? '';
  String get email => _email ?? '';
  String get password => _password ?? '';
  String get avatarUrl => _avatarUrl ?? '';

  set firstName(String value) => _firstName = value.isNotEmpty ? value : _firstName;
  set id(String value) => _id = value.isNotEmpty ? value : _id;
  set lastName(String value) => _lastName = value.isNotEmpty ? value : _lastName;
  set email(String value) => _email = value.isNotEmpty ? value : _email;
  set password(String value) => _password = value.isNotEmpty ? value : _password;
  set avatarUrl(String value) => _avatarUrl = value.isNotEmpty ? value : _avatarUrl;

  Map<String, dynamic> toJson() => {
    "id": _id,
    "firstName": _firstName,
    "lastName": _lastName,
    "email": _email,
    "password": _password,
    "avatarUrl": _avatarUrl,
  };

  factory User.fromJson(Map<String, dynamic> json) {
    return User()
      .._id = json["id"] ?? ''
      .._firstName = json["firstName"] ?? ''
      .._lastName = json["lastName"] ?? ''
      .._email = json["email"] ?? ''
      .._password = json["password"] ?? ''
      .._token = json["token"] ?? ''
      .._avatarUrl = json["avatarUrl"] ?? '';
  }
}
