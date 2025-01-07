
class Lesson {
  late String? _id, _title, _description, _video;
  late int? _order, _duration;
  late DateTime? _createdAt;

  Lesson.fromJson(Map<String, dynamic> json) :
      _id = json['id'],
      _title = json['title'],
      _description = json['description'],
      _order = json['order'],
      _duration = json['duration'],
      _video = json['video'],
      _createdAt = DateTime.parse(json['createdAt']);

  String? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get video => _video;
  int? get order => _order;
  int? get duration => _duration;
  DateTime? get createdAt => _createdAt;

  set id(String? value) => _id = value;
  set title(String? value) => _title = value;
  set content(String? value) => _description = value;
  set order(int? value) => _order = value;
  set createdAt(DateTime? value) => _createdAt = value;

}