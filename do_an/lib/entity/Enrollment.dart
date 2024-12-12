class Enrollment {
  String _id, _courseName, _courseId;
  bool _isCompleted = false;
  int _totalLesson, _totalCompletedLesson;

  Enrollment(this._id, this._courseName, this._courseId, this._isCompleted, this._totalCompletedLesson, this._totalLesson);

  String get courseName => _courseName;
  String get id => _id;
  String get courseId => _courseId;
  bool get isCompleted => _isCompleted;
  int get totalLesson => _totalLesson;
  int get totalCompletedLesson => _totalCompletedLesson;

  set id(String value) => value.isNotEmpty ? _id = value : _id;
  set courseName(String value) => value.isNotEmpty ? _courseName = value : _courseName;
  set courseId(String value) => value.isNotEmpty ? _courseId = value : _courseId;
  set isCompleted(bool value) => _isCompleted  = value;
  set totalLesson(int value) => value > 0 ? _totalLesson = value : _totalLesson;
  set totalCompletedLesson(int value) => value > 0 ?  _totalCompletedLesson = value : _totalCompletedLesson;
}