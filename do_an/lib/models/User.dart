// import 'package:do_an/entity/Enrollment.dart';
//
// class User {
//   String _id, _firstName, _lastName, _email, _password, _token;
//   List<Enrollment> _enrollments = [];
//
//   User(this._id, this._firstName, this._lastName, this._email, this._password, this._token);
//
//   String get id => _id;
//   String get firstName => _firstName;
//   String get lastName => _lastName;
//   String get email => _email;
//   String get password => _password;
//   List<Enrollment> get enrollments => _enrollments;
//
//   set firstName(String value) => value.isNotEmpty ? _firstName = value : _firstName;
//   set id(String value) => value.isNotEmpty ? _id = value : _id;
//   set lastName(String value) => value.isNotEmpty ? _lastName = value : _lastName;
//   set email(String value) => value.isNotEmpty ? _email = value : _email;
//   set password(String value) => value.isNotEmpty ? _password = value : _password;
//   set enrollments(List<Enrollment> value) => value.isNotEmpty ? _enrollments = value : _enrollments;
//
//   Map<String, dynamic> toJson() => {
//     "id": _id,
//     "firstName": _firstName,
//     "lastName": _lastName,
//     "email": _email,
//     "password": _password,
//   };
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(json["id"], json["firstName"], json["lastName"], json["email"], json["password"]);
//   }
// }