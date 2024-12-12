import 'package:do_an/entity/User.dart';

class Post {
  String _id, _title, _content;
  DateTime _createdAt = DateTime.now();
  User _author;

  Post(this._id, this._title, this._content, this._createdAt, this._author);

  String get id => _id;
  String get title => _title;
  String get content => _content;
  DateTime get createdAt => _createdAt;
  User get author => _author;

  set id(String value) => value.isNotEmpty ? _id = value : _id;
  set title(String value) => value.isNotEmpty ? _title = value : _title;
  set content(String value) => value.isNotEmpty ? _content = value : _content;
  set author(User value) => value != null ? _author = value : _author;

}