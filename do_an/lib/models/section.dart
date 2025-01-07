import 'package:do_an/models/lesson.dart';

class Section {
  late String? _title;
  late int? _totalDuration;
  late List<Lesson> _lessons;

  Section.fromJson(Map<String, dynamic> json)
      : _title = json['title'],
        _totalDuration = json['totalDuration'] ?? 0,
        _lessons = json['lessons'] != null
            ? List<Lesson>.from(json['lessons'].map((lesson) => Lesson.fromJson(lesson)))
            : [];

  String? get title => _title;
  int? get totalDuration => _totalDuration;
  List<Lesson> get lessons => _lessons;

  set title(String? value) => _title = value;
  set totalDuration(int? value) => _totalDuration = value;
  set lessons(List<Lesson> value) => _lessons = value.isNotEmpty ? value : _lessons;
}
