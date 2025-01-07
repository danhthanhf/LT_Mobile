// import 'package:do_an/entity/user.dart';
//
// class Post {
//   String _id, _title, _content, _thumbnail, _description;
//   DateTime _createdAt = DateTime.now();
//   User _author;
//
//   Post({required String id, required String title, required String description, required String content, required String thumbnail, required DateTime createdAt, required User author})
//   : _id = id,
//   _title = title,
//   _description = description,
//   _content = content,
//   _thumbnail = thumbnail,
//   _createdAt = createdAt,
//   _author = author
//   ;
//
//   String get id => _id;
//   String get title => _title;
//   String get description => _description;
//   String get content => _content;
//   String get thumbnail => _thumbnail;
//   DateTime get createdAt => _createdAt;
//
//   set id(String value) => value.isNotEmpty ? _id = value : _id;
//   set title(String value) => value.isNotEmpty ? _title = value : _title;
//   set description(String value) => value.isNotEmpty ? _description = value : _description;
//   set content(String value) => value.isNotEmpty ? _content = value : _content;
//   set author(User value) => value != null ? _author = value : _author;
//
//
//   Map<String, dynamic> toJson() => {
//     "id": _id,
//     "title": _title,
//     "description": _description,
//     "content": _content,
//     "createdAt": _createdAt,
//     "author": _author.toJson(),
//     "thumbnail": _thumbnail
//   }
//
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json["id"],
//       title: json["title"],
//       description: json["description"],
//       content: json["content"],
//       createdAt: json["createdAt"],
//       author: User.fromJson(json["author"]),
//       thumbnail: json["thumbnail"],
//     );
//   }
// }