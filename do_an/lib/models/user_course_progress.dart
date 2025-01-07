import 'package:do_an/models/course.dart';
import 'package:do_an/models/progress.dart';

class UserCourseProgress {
  int _totalLessons, _totalCompletedLessons;
  double? _myRating;
  bool? _completed;
  Course course;
  List<Progress> progresses;

  UserCourseProgress({
    required int totalLessons,
    required int totalCompletedLessons,
    double? myRating,
    bool? completed,
    required this.course,
    required this.progresses,
  })  : _totalLessons = totalLessons,
        _totalCompletedLessons = totalCompletedLessons,
        _myRating = myRating,
        _completed = completed;

  UserCourseProgress.fromJson(Map<String, dynamic> json)
      : _totalLessons = json['totalLessons'],
        _totalCompletedLessons = json['totalCompletedLessons'],
        _myRating = json['myRating'],
        _completed = json['completed'],
        course = Course.fromJson(json['course']),
        progresses = (json['progresses'] as List)
            .map((item) => Progress.fromJson(item))
            .toList();

  int get totalLessons => _totalLessons;
  int get totalCompletedLessons => _totalCompletedLessons;
  double? get myRating => _myRating;
  bool? get completed => _completed;
  Course get getCourse => course;
  List<Progress> get getProgresses => progresses;

  @override
  String toString() {
    return 'UserCourseProgress(totalLessons: $_totalLessons, totalCompletedLessons: $_totalCompletedLessons, myRating: $_myRating, completed: $_completed, course: $course, progresses: $progresses)';
  }

}