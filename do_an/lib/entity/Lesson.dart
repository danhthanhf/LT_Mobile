import 'package:do_an/entity/Course.dart';

class Lesson {
  String _id, _title, _content;
  Course _course;
  int _order;
  DateTime _createdAt;

  Lesson(this._id, this._title, this._content, this._course, this._order, this._createdAt);

  String get id => _id;
  String get title => _title;
  String get content => _content;
  Course get course => _course;
  int get order => _order;
  DateTime get createdAt => _createdAt;

  set id(String value) => value.isNotEmpty ? _id = value : _id;
  set title(String value) => value.isNotEmpty ? _title = value : _title;
  set content(String value) => value.isNotEmpty ? _content = value : _content;
  set course(Course value) => value != null ? _course = value : _course;
  set order(int value) => value > 0 ? _order = value : _order;
  set createdAt(DateTime value) => value != null ? _createdAt = value : _createdAt;
  
}