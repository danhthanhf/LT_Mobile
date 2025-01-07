class Progress {
  int? _timeStamp;
  int? _duration;
  String? _lessonId;
  bool? _locked;
  bool? _completed;

  Progress({
    int? timeStamp,
    int? duration,
    String? lessonId,
    bool? locked,
    bool? completed,
  })  : _timeStamp = timeStamp,
        _duration = duration,
        _lessonId = lessonId,
        _locked = locked,
        _completed = completed;

  Progress.fromJson(Map<String, dynamic> json)
      : _timeStamp = json['timeStamp'],
        _duration = json['duration'],
        _lessonId = json['lessonId'],
        _locked = json['locked'],
        _completed = json['completed'];

  int? get timeStamp => _timeStamp;
  int? get duration => _duration;
  String? get lessonId => _lessonId;
  bool? get locked => _locked;
  bool? get completed => _completed;
}