import 'package:do_an/models/section.dart';
import 'package:do_an/models/user.dart';

class Course {
  String? _id;
  String? _title;
  String? _video;
  double _scoreRating;
  String? _thumbnail;
  User _author;
  List<Section> _sections;
  String? _description;
  DateTime _createdAt = DateTime.now();
  int? _totalLessons = 0;
  int? _price = 0;
  int? _totalDuration = 0;
  List<String>? categories;

  // Default constructor
  Course({
    String? id,
    String? title,
    String? video,
    double scoreRating = 0.0,
    String? thumbnail,
    required User author,
    List<Section> sections = const [],
    String? description,
    DateTime? createdAt,
    int? totalLessons = 0,
    int? price = 0,
    int? totalDuration = 0,
  })  : _id = id,
        _title = title,
        _video = video,
        _scoreRating = scoreRating,
        _thumbnail = thumbnail,
        _author = author,
        _sections = sections,
        _description = description,
        _createdAt = createdAt ?? DateTime.now(),
        _totalLessons = totalLessons,
        _price = price,
        _totalDuration = totalDuration;

  Course.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _title = json['title'],
        _video = json['video'],
        _scoreRating = json['scoreRating'],
        _thumbnail = json['thumbnail'],
        _author = User.fromJson(json['author']),
        _sections = (json['sections'] as List).map((section) => Section.fromJson(section)).toList(),
        _description = json['description'],
        _createdAt = DateTime.parse(json['createdAt']),
        _totalLessons = json['totalLessons'],
        _price = json['price'],
        _totalDuration = json['totalDuration'],
        categories = json['categories'].map<String>((category) => category.toString()).toList()
      ;

  factory Course.init() => Course(author: User(), sections: []);

  String? get id => _id;
  String? get title => _title;
  String? get video => _video;
  double get scoreRating => _scoreRating;
  String? get thumbnail => _thumbnail;
  User get author => _author;
  List<Section> get sections => _sections;
  String? get description => _description;
  DateTime get createdAt => _createdAt;
  int? get totalLessons => _totalLessons;
  int? get price => _price;
  int? get totalDuration => _totalDuration;
  String get categoriesString => categories!.join(', ');

  set id(String? value) => _id = value?.isNotEmpty == true ? value : _id;
  set title(String? value) => _title = value?.isNotEmpty == true ? value : _title;
  set video(String? value) => _video = value?.isNotEmpty == true ? value : _video;
  set scoreRating(double value) => _scoreRating = value > 0 ? value : _scoreRating;
  set thumbnail(String? value) => _thumbnail = value?.isNotEmpty == true ? value : _thumbnail;
  set author(User value) => _author = value;
  set sections(List<Section> value) => _sections = value.isNotEmpty ? value : _sections;
  set description(String? value) => _description = value?.isNotEmpty == true ? value : _description;
  set createdAt(DateTime? value) => _createdAt = value!;
  set totalLessons(int? value) => _totalLessons = value! > 0 ? value : _totalLessons;
  set price(int? value) => _price = value! > 0 ? value : _price;
  set totalDuration(int? value) => _totalDuration = value! > 0 ? value : _totalDuration;
}