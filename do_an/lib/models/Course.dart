// class Course {
//   String _id;
//   String _title;
//   String _description;
//   DateTime _createdAt = DateTime.now();
//   int _totalLessons = 0;
//   int price = 0;
//
//
//
//   Course(this._id,this._title, this._description, this._createdAt, this._totalLessons);
//
//   String get id => _id;
//   String get title => _title;
//   String get description => _description;
//   int get totalLesson => _totalLessons;
//   DateTime get createdAt => _createdAt;
//
//   set id(String value) => value.isNotEmpty ? _id = value : _id;
//   set title(String value) => value.isNotEmpty ? _title = value : _title;
//   set description(String value) => value.isNotEmpty ? _description = value : _description;
//   set totalLesson(int value) => value > 0 ? _totalLessons = value : _totalLessons;
//
//
//
// }